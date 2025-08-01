Madman
==================================================

The Markdown Swiss Army Knife

Installation
--------------------------------------------------

```
$ gem install madman
```

Or with Bundler:

```ruby
gem 'madman', require: false
```



Features
--------------------------------------------------

- [x] GitHub-style markdown generation (markup and stylesheet).
- [x] Convert markdown to HTML file.
- [x] Ad-hoc server to serve a markdown file locally for preview.
- [ ] Ad-hoc server to allow editing of a local markdown file.
- [x] Markdown generation with GitHub API (optional).
- [x] Table of Contents generation for a folder of markdown files.
- [x] Web server for an entire folder (like [Madness][1]) with GitHub Pages compatibility.
- [x] Automatic detection of Right-to-Left markdown files for HTML rendering.
- [x] Generate navigation README in folders without one.
- [x] Convert YAML file to an interactive HTML with collapsible sections.
- [ ] Generate breadcrumbs.
- [ ] Combine multiple markdown files to one.
- [ ] Table of Contents generation for a single file.



Usage
--------------------------------------------------

<!-- usage -->

```
$ madman
Commands:
  nav      Add site-wide navigation links to README files
  preview  Serve a markdown or YAML file using a local server
  readme   Create README in all qualified sub directories
  render   Render markdown or YAML to HTML
  serve    Serve a markdown directory using a local server
```

<!-- usage -->

### Render Markdown or YAML to HTML

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
Render markdown or YAML to HTML

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
    The input markdown or YAML file

Environment Variables:
  GITHUB_ACCESS_TOKEN
    Your GitHub API access token
    Generate one here: https://github.com/settings/tokens

Examples:
  madman render README.md
  madman render README.md --github
  madman render README.md --save out.html
  madman render file.yml --save out.html
```

<!-- render-help -->
</details>

### Preview Markdown or HTML in Browser

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
Serve a markdown or YAML file using a local server

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
    The input markdown or YAML file

Environment Variables:
  GITHUB_ACCESS_TOKEN
    Your GitHub API access token
    Required only if you wish to use the '/github' endpoint
    Generate one here: https://github.com/settings/tokens

Examples:
  madman preview README.md
  madman preview README.md -p4000
  madman preview file.yml
```

<!-- preview-help --></details>


### Personal Wiki (Serve a complete Markdown folder)

<!-- serve -->

```
$ madman serve
Usage:
  madman serve DIR [--port N --bind ADDRESS --github]
  madman serve (-h|--help)
```

<!-- serve -->

<details><summary>Show full usage</summary><!-- serve-help -->

```
$ madman serve --help
Serve a markdown directory using a local server

Usage:
  madman serve DIR [--port N --bind ADDRESS --github]
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
  DIR
    The directory containing markdown files

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
  madman nav DIR [options]
  madman nav (-h|--help)
```

<!-- nav -->

<details><summary>Show full usage</summary><!-- nav-help -->

```
$ madman nav --help
Add site-wide navigation links to README files

This command generates a Table of Contents for a directory, and injects it to a
file. In addition, it supports recursive execution, which will add a Table of
Contents to all README files (or a filename of your choice) in all the
subfolders, creating nagigation pages for an entire Markdown site.

Usage:
  madman nav DIR [options]
  madman nav (-h|--help)

Options:
  -f --force
    Inject TOC to all README files, even if they do not have a marker

  -m --marker TEXT
    Look for an HTML comment with <!-- TEXT --> [default: nav]

  -d --depth N
    The depth of the table of contents [default: 1]

  -v --verbose
    Show the updated README content

  -t --target NAME
    Set the target filename to look for. [default: README.md]

  -r --recursive
    Inject to all target files

  -y --dry
    Do not save the updated files, just show what will happen

  -h --help
    Show this help

Parameters:
  DIR
    The directory containing markdown files

Examples:
  madman nav
  madman nav path/to/docs --force --marker toc
  madman nav path/to/docs --dry -v -d2
```

<!-- nav-help --></details>


### Generate README files with H1

<!-- readme -->

```
$ madman readme
Usage:
  madman readme DIR [--dry]
  madman readme (-h|--help)
```

<!-- readme -->

<details><summary>Show full usage</summary><!-- readme-help -->

```
$ madman readme --help
Create README in all qualified sub directories

This command generates README.md files in all subdirectories. Each file will
receive an H1 caption with the name of the folder it resides in. This command is
designed to assist in preparing a folder for table of contents injection.

Usage:
  madman readme DIR [--dry]
  madman readme (-h|--help)

Options:
  -y --dry
    Only show what will be created, don't make any changes

  -h --help
    Show this help

Parameters:
  DIR
    The directory containing markdown files

Examples:
  madman readme .
  madman readme path/to/docs --dry
```

<!-- readme-help --></details>


[1]: https://github.com/DannyBen/madness
