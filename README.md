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
- [Planned] Table of Contents generation for a single file.
- [Planned] Table of Contents generation for a folder of markdown files.
- [Planned] Combine multiple markdown files to one.



Usage
--------------------------------------------------

<!-- usage -->
```
$ madman
Madman 0.0.1

Commands:
  render  Render markdown to HTML
  serve   Run a webserver and serve the markdown file as HTML
```

---

```
$ madman render --help
Render markdown to HTML

Usage:
  madman render INFILE [OUTFILE] [--rtl]
  madman render (-h|--help|--version)

Options:
  --rtl
    Render text Right-to-Left

  -h --help
    Show this help

  --version
    Show version number

Parameters:
  INFILE
    The input markdown file

  OUTFILE
    The output HTML file. If not provided, the input filename will be used with
    .html extension

Examples:
  madman render README.md
  madman render README.md out.html --rtl
```

---

```
$ madman serve --help
Run a webserver and serve the markdown file as HTML

Usage:
  madman serve INFILE [--port N --bind ADDRESS --rtl]
  madman serve (-h|--help|--version)

Options:
  --rtl
    Render text Right-to-Left

  -p --port N
    Set server port [default: 3000]

  -b --bind ADDRESS
    Set server listen address [default: 0.0.0.0]

  -h --help
    Show this help

  --version
    Show version number

Parameters:
  INFILE
    The input markdown file

Examples:
  madman serve README.md
  madman serve README.md -p4000 --rtl
```

---

<!-- usage -->