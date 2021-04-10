+++
categories = ["code"]
tags = ["Honeycomb", "GitLab", "tracing"]
date = "2021-04-08T07:36:01-04:00"
description = ""
keywords = ["Honeycomb", "GitLab", "tracing", "builds", "alpine", "buildevents"]
title = "Tracing GitLab builds in Honeycomb"

+++

By adding observability to your builds you can start to understand where your build time is being spent and how to optimize your builds.

[Honeycomb](https://www.honeycomb.io/) is a fantastic observability platform, and they provide a [buildevents](https://github.com/honeycombio/buildevents) tool you can use to instrument your builds. Here is a simple approach to instrumenting a GitLab build pipeline with Honeycomb tracing.

# Step 1: Pre/Post build

Instrumenting your build requires some work at the start and end of your build. In GitLab one way to achieve this is by introducing a _stage_ at the start and and the end of your pipeline. Let's call these stages `initialization` and `tracing`:

```
stages:
   - initialization
   - ...(your regular build stages remain here)...
   - tracing
```

The initialization stage sets us up by doing two things:

1. storing the start time of the build (to be used later)
2. downloading the `buildevents` tool, which is a small binary used for tracing

These are exposed as artifacts to make them available later in the build. Here is what this stage looks like:

```
initialization:
  stage: initialization
  image: (your preferred image here, this example is based on an alpine image)
  script:
    - date +%s >build_start_time
    - apk add curl
    - curl -L -o buildevents https://github.com/honeycombio/buildevents/releases/latest/download/buildevents-linux-amd64
    - chmod 755 buildevents
  artifacts:
    paths:
      - buildevents
      - build_start_time
    expire_in: 3 days
```

The `tracing` stage runs at the end of the build and closes off the trace. A trace URL is printed here so that you can click through the URL to arrive directly at the trace view in Honeycomb!

```
tracing:
  stage: tracing
  script:
    - export BUILD_ID=$CI_PIPELINE_ID
    - export BUILD_START_TIME=$(cat ./build_start_time)
    - traceURL=$(.buildevents build $BUILD_ID $BUILD_START_TIME success)
    - echo "Honeycomb Trace $traceURL"
```

# Step 2: Instrumenting jobs

A GitLab build is comprised of multiple jobs. You can create a trace span for each individual GitLab job in your build by doing a bit of work before and after the job. A job template can help with this:

```
.job_template: &traced_job
before_script:
  - date +%s > /tmp/job_start_time
  - apk add bash
  - export BUILD_ID=$CI_PIPELINE_ID
  - export STEP_ID=$CI_JOB_ID-$CI_COMMIT_SHORT_SHA
  - export NAME=$CI_JOB_NAME
after_script:
  - export BUILD_ID=$CI_PIPELINE_ID
  - export STEP_ID=$CI_JOB_ID-$CI_COMMIT_SHORT_SHA
  - export NAME=$CI_JOB_NAME
  - export START_TIME=$(cat /tmp/job_start_time)
  - echo "Sending honeycomb trace for ${NAME} (id= ${STEP_ID}) within ${BUILD_ID} pipeline starting at ${START_TIME}"
  - ./buildevents step $BUILD_ID $STEP_ID $START_TIME $NAME
```

With this template defined, adding tracing to your job is as simple as adding a YAML anchor at the start of the job definition:

```
compile:
  <<: *traced_job
  stage: compile
  ...

deploy:
  <<: *traced_job
  stage: deploy
  ...
```

# Step 3: Instrumenting individual commands

Within a job, there may be several commands that get executed. It can be very helpful to see how long certain commands are taking!

For example, if the command you're trying to run is `mix compile`, you can simply wrap it with a call to `buildevents` like so, and supply a name for your trace span:

```
./buildevents cmd $BUILD_ID $STEP_ID give_a_name_for_this_trace_span -- mix compile
```
This will create a trace span around the execution of this command.


# Limitations

* This implementation does not trace failed builds, only successes.
* It won't capture time spent waiting for a GitLab runner.
* The artifacts in the `initialization` stage are set to expire after 3 days. If someone hits "Retry" on this build after a time period longer than that, these artifacts will no longer be available and so the build will fail.

# Wrap Up

This is a simple approach to tracing builds. Despite its limitations, I have found it's sufficient to get me going with tracing and to start me on the path to optimizing my builds.