Madman
==================================================

[![Gem Version](https://badge.fury.io/rb/madman.svg)](https://badge.fury.io/rb/madman)
[![Build Status](https://travis-ci.com/DannyBen/madman.svg?branch=master)](https://travis-ci.com/DannyBen/madman)
[![Maintainability](https://api.codeclimate.com/v1/badges/506449ea988f5518425d/maintainability)](https://codeclimate.com/github/DannyBen/madman/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/506449ea988f5518425d/test_coverage)](https://codeclimate.com/github/DannyBen/madman/test_coverage)


---

The Markdown Swiss Army Knife

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

- [x] GitHub-style markdown generation (markup and stylesheet).
- [x] Convert markdown to HTML file.
- [x] Ad-hoc server to serve a markdown file locally for preview.
- [x] Markdown generation with GitHub API (optional).
- [x] Table of Contents generation for a folder of markdown files.
- [x] Web server for an entire folder (like [Madness][1]) with GitHub Pages 
      compatibility.
- [ ] [Planned] Generate breadcrumbs.
- [ ] [Planned] Generate navigation README in folders without one.
- [ ] [Planned] Combine multiple markdown files to one.
- [ ] [Considered] Table of Contents generation for a single file.



Usage
--------------------------------------------------

<!-- usage -->

```
$ madman
Commands:
  nav      Add site-wide navigation links to README files
  preview  Serve a markdown file using a local server
  render   Render markdown to HTML
  serve    Serve a markdown folder using a local server
```

<!-- usage -->

### Render Markdown to File

<!-- render -->

```
$ madman render
Usage:
  madman render FILE [--github --save OUTFILE]
  madman render (-h|--help)
```

<!-- render -->

<details><summary>Show full usage</summary>
<!-- render-help -->

```
$ madman render --help
Render markdown to HTML

Usage:
  madman render FILE [--github --save OUTFILE]
  madman render (-h|--help)

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

<!-- render-help -->
</details>

### Preview Markdown in Browser

<!-- preview -->

```
$ madman preview
Usage:
  madman preview FILE [--port N --bind ADDRESS]
  madman preview (-h|--help)
```

<!-- preview -->

<details><summary>Show full usage</summary><!-- preview-help -->

```
$ madman preview --help
Serve a markdown file using a local server

This command will start a local server with two endpoints:
  /         will render the markdown with the default renderer
  /github   will render with the GitHub API

Usage:
  madman preview FILE [--port N --bind ADDRESS]
  madman preview (-h|--help)

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

<!-- preview-help --></details>


### Personal Wiki (Serve a complete Markdown folder)

<!-- serve -->

```
$ madman serve
Usage:
  madman serve FOLDER [--port N --bind ADDRESS --github]
  madman serve (-h|--help)
```

<!-- serve -->

<details><summary>Show full usage</summary><!-- serve-help -->

```
$ madman serve --help
Serve a markdown folder using a local server

Usage:
  madman serve FOLDER [--port N --bind ADDRESS --github]
  madman serve (-h|--help)

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
    The folder containing markdown files

Environment Variables:
  GITHUB_ACCESS_TOKEN
    Your GitHub API access token
    Required only if you wish to use the '/github' endpoint
    Generate one here: https://github.com/settings/tokens

Examples:
  madman serve
  madman serve path/to/docs -p4000 --github
```

<!-- serve-help --></details>


### Inject Site Navigation (Table of Contents)

<!-- nav -->

```
$ madman nav
Usage:
  madman nav FOLDER [--marker TEXT --force --dry --verbose --depth N]
  madman nav (-h|--help)
```

<!-- nav -->

<details><summary>Show full usage</summary><!-- nav-help -->

```
$ madman nav --help
Add site-wide navigation links to README files

This command will add a table of contents to all README files in the folder. The
table of contents will link to all the pages and folders that are in the same
folder as each README file.

Usage:
  madman nav FOLDER [--marker TEXT --force --dry --verbose --depth N]
  madman nav (-h|--help)

Options:
  -f --force
    Add to all README files, even if they do not have a marker

  -m --marker TEXT
    Look for an HTML comment with <!-- TEXT --> [default: nav]

  -d --depth N
    The depth of the table of contents [default: 1]

  --dry
    Do not save the updated files, just show what will happen

  -v --verbose
    Show the updated README content

  -h --help
    Show this help

Parameters:
  FOLDER
    The folder containing markdown files

Examples:
  madman nav
  madman nav path/to/docs --force --marker toc
  madman nav path/to/docs --dry -v -d2
```

<!-- nav-help --></details>


[1]: https://github.com/DannyBen/madness