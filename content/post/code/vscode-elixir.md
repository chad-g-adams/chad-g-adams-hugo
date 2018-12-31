+++
categories = ["code"]
date = "2018-12-31T13:50:44-05:00"
description = "Elixir is a programming language that I am in the process of learning, and which I use at work. This post documents the settings I am using to develop in elixir using the VSCode editor."
tags = ["elixir", "visual studio code"]
keywords = ["elixir", "vscode", "visual studio"]
title = "Setting up Visual Studio Code for Elixir"

+++

Elixir is a programming language that I am in the process of learning, and which I use at work. This post documents the settings I am using to develop in elixir using the VSCode editor.

## 1. Language Support

Install extension `ElixirLS`

Out of the box this gives you:

* autocomplete, navigation, dialyzer (aka static analysis/linting) and debugging capabilities. Hooray!

## 2. Formatting

Elixir is an auto-formatted language for [reasons](https://hashrocket.com/blog/posts/format-your-elixir-code-now), hence `mix format` is your friend. In your VSCode Settings, hit the checkbox for "Editor: Format on Save" to run this on every save.

## 3. Test Execution

I commonly run tests three different ways:

1. Run a single test. Most frequently used while developing.
2. Run *all* the tests. Used for regression testing.
3. Run all the tests from a single file. Sometimes useful while developing.

Set these up as Tasks in your tasks.json as follows:
```
  {
      "label": "mix test",
      "type": "shell",
      "command": "mix test",
      "group": "test",
      "presentation": {
          "echo": true,
          "reveal": "always",
          "focus": false,
          "panel": "shared",
          "clear": true
      }
  },
  {
      "label": "single test",
      "type": "shell",
      "command": "mix test ${relativeFile}:${lineNumber}",
      "group": "test",
      "presentation": {
          "echo": true,
          "reveal": "always",
          "focus": false,
          "panel": "shared",
          "clear": true
      },
      "runOptions": {
          "reevaluateOnRerun": false
      }
  },
  {
      "label": "test current file",
      "type": "shell",
      "command": "mix test ${relativeFile}",
      "group": "test",
      "presentation": {
          "echo": true,
          "reveal": "always",
          "focus": false,
          "panel": "shared",
          "clear": true
      },
      "runOptions": {
          "reevaluateOnRerun": false
      }
  }

```


You can also create hotkeys to launch your tests. I do it like:

```
{
  "key": "ctrl-s",
  "command": "workbench.action.tasks.runTask",
  "args": "mix test"
},
{
  "key": "ctrl+shift+s",
  "command": "workbench.action.tasks.runTask",
  "args": "single test",
  "when": "editorTextFocus"
}
```

Now it's super easy to run a single test, or all the tests, on a whim.

Use in combination with the standard "Rerun Last Task" (new in vscode 1.30) to run your single test over and over again without having to switch windows.

With credit to:

* https://pragdave.me/blog/2018/06/13/visual-studio-code-elixir-tests.html


​
