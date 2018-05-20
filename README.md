Madman
==================================================

[![Gem Version](https://badge.fury.io/rb/madman.svg)](https://badge.fury.io/rb/madman)
[![Build Status](https://travis-ci.com/DannyBen/madman.svg?branch=master)](https://travis-ci.com/DannyBen/madman)
[![Maintainability](https://api.codeclimate.com/v1/badges/506449ea988f5518425d/maintainability)](https://codeclimate.com/github/DannyBen/madman/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/506449ea988f5518425d/test_coverage)](https://codeclimate.com/github/DannyBen/madman/test_coverage)


---

The Markdown Swiss Armi Knife

---

Installation
--------------------------------------------------

```
$ gem install madman
```

Or with Bundler:

```ruby
gem 'madman', require: false
```



Key Features
--------------------------------------------------

- GitHub-style markdown generation.
- Convert markdown to a single HTML file (including CSS).
- Ad-hoc server to serve a markdown file locally for preview.
- Markdown generation with GitHub API (optional).
- [Planned] Table of Contents generation for a single file.
- [Planned] Table of Contents generation for a folder of markdown files.
- [Planned] Combine multiple markdown files to one.
- [Considered] Web server for an entire folder (like [Madness][1])



Usage
--------------------------------------------------

<!-- usage -->
```
$ madman
Commands:
  preview  Serve a markdown file using a local server
  render   Render markdown to HTML
  serve    Serve a markdown folder using a local server
```

---

```
$ madman render --help
Render markdown to HTML

Usage:
  madman render FILE [--github --save OUTFILE]
  madman render (-h|--help|--version)

Options:
  --github
    Render using the GitHub API
    Requires setting the GITHUB_ACCESS_TOKEN environment variable

  --save OUTFILE
    Save the output to a file

  -h --help
    Show this help

Parameters:
  FILE
    The input markdown file

Environment Variables:
  GITHUB_ACCESS_TOKEN
    Your GitHub API access token
    Generate one here: https://github.com/settings/tokens

Examples:
  madman render README.md
  madman render README.md --github
  madman render README.md --save out.html
```

---

```
$ madman preview --help
Serve a markdown file using a local server

This command will start a local server with two endpoints:
  /         will render the markdown with the default renderer
  /github   will render with the GitHub API

Usage:
  madman preview FILE [--port N --bind ADDRESS]
  madman preview (-h|--help|--version)

Options:
  -p --port N
    Set server port [default: 3000]

  -b --bind ADDRESS
    Set server listen address [default: 0.0.0.0]

  -h --help
    Show this help

Parameters:
  FILE
    The input markdown file

Environment Variables:
  GITHUB_ACCESS_TOKEN
    Your GitHub API access token
    Required only if you wish to use the '/github' endpoint
    Generate one here: https://github.com/settings/tokens

Examples:
  madman preview README.md
  madman preview README.md -p4000
```

---

```
$ madman serve --help
Serve a markdown folder using a local server

Usage:
  madman serve [FOLDER] [--port N --bind ADDRESS --github]
  madman serve (-h|--help|--version)

Options:
  --github
    Use the GitHub API renderer instead of the default one

  -p --port N
    Set server port [default: 3000]

  -b --bind ADDRESS
    Set server listen address [default: 0.0.0.0]

  -h --help
    Show this help

Parameters:
  FOLDER
    The folder containing markdown files. If not provided, the current directory
    will be used.

Environment Variables:
  GITHUB_ACCESS_TOKEN
    Your GitHub API access token
    Required only if you wish to use the '/github' endpoint
    Generate one here: https://github.com/settings/tokens

Examples:
  madman serve README.md
  madman serve README.md -p4000
```

---

<!-- usage -->


[1]: https://github.com/DannyBen/madness