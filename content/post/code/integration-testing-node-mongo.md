+++
categories = [ "code" ]
tags = [ "testing", "Mongo", "Node", "Mongoose"]
date = "2016-10-14T22:31:54-04:00"
description = ""
keywords = [ "integration testing", "Node", "Mongo", "Mongoose", "Mocha" ]
title = "Integration Testing with Node and Mongo"
+++

I've been building [an application](https://github.com/cised-ca/social-enterprise-directory) using Node.js with a MongoDB datastore. Now I want to perform some integration testing (*without* mocking the DB layer) to ensure full end-to-end success of the application. Here's how I went about doing this.

# Using a test database
While the goal is to execute code paths that go through Mongo, it will still be acceptable to execute against a different db than the one used for production deployments. This will ensure the test data never ends up in production by accident, and also avoids production data getting deleted by accident.

Hence, I'll have the application connect to Mongo using a test connection string. This will be specified in a configuration file with suitable default value.

Since the application creates the db collections on start up, there are no further pre-requisite Mongo commands to setup the test database.

# Starting the application

Before any tests can run, the application needs to start up. So I wrote a simple `app_starter.js` utility to boot the application into service with the appropriate test configuration.

# Starting each test with a clean datastore

Each test needs to be independent, so we can't leave remnants in the datastore from a previous test. Hence the first thing I do at the start of each test is clean the database.

I'm using Mocha as my test framework, so this gets implemented as a `beforeEach` hook:

    beforeEach( function(done) {
        dbUtil.cleanDatabase(done);
    });

# Cleaning the datastore

One very straightforward way to clean the datastore, is to drop the database and re-create it again. My application connects to the datastore using [Mongoose](mongoosejs.com). With Mongoose, the database can be dropped with the following command:

    function cleanDatabase(done) {
      mongoose.connection.db.dropDatabase(done);
    }

That was easy.

Now how do we re-create the database? Turns out Mongoose is kind enough to do this for you automatically under the hood, so nothing else to do. However there's one more wrinkle to deal with...

Mongoose will re-create the collections in the database on demand, but not the indexes. The indexes are only built during mongoose connection establishment. This means our tests won't be able to execute successfully because the database indexes won't be present. Let's look at how to address that.

# Rebuilding the indexes

Luckily Mongoose supplies an API to rebuild the indexes:

    mongoose.model(modelName).ensureIndexes();

This takes a little time to complete, so I had to register on `index` event to listen for when it finishes.

    mongoose.model(myModel).on('index', done);

Once the indexes are ready, the database is set for your test to begin. Here is the updated `cleanDatabase` function which delegates to a rebuildIndexes helper function:

    function cleanDatabase(done) {
      mongoose.connection.db.dropDatabase( function() {
        rebuildIndexes(done);
      });
    }

You may find the full implementation [here](https://github.com/cised-ca/social-enterprise-directory/blob/dd0c588843ffe014b0befd36e316beefa6bc181b/test/api/helpers/db/db_util.js)

# Results
That puts a simple automated integration test framework in place for application developers to work with. This should help ensure stability of the application over time as new features get added, while also allowing developers to take a TDD approach to feature development.

On my system it does take a few 100 ms to run each test due to the extra database overhead. Given the number of tests at the moment, this is not a concern. In the future if it somehow grows into a problem there are alternatives to dropping the database, such as removing the collections, which I've heard may improve execution performance. This would be easy to refactor in the future if needed, but I expect the current implementation will be just fine for a long while.
