
## Description

Rake task used to show statistic information for log file.
Logic split into several services to parse file, build statistics and provide result separately.

## Prerequisites

- RVM or rbenv
- Ruby 2.7.2

## Setup

Install ruby with rvm.

```bash
rvm install 2.7.2
```

Install dependencies.

```bash
ruby_app_dir ~> gem install bundler -v 1.16.2 -N
ruby_app_dir ~> bundle install
```

## Usage

Start rake task with path to file as parameter:

```bash
rake "show_statistics[spec/fixtures/webserver.log]"

```

## Tests and code analysis

Rspec tests, rubocop, reek:

```bash
ruby_app_dir ~> rspec
ruby_app_dir ~> rubocop
ruby_app_dir ~> reek

```

## What could be improved next

### Log::Entry
- validation if ip address is real (e.g 646.865.545.408 does not match standard)
- validation if page is really part of URL (no unexpected symbols, matches pattern)

### Statistics::Presenter
- pluralization in text depending on visits count

### Statistics::Aggregator
- catch errors and show pretty message
