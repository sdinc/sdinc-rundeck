[![Build Status](https://travis-ci.org/sdinc/sdinc-rundeck.svg?branch=master)](https://travis-ci.org/sdinc/sdinc-rundeck)
[![Code Climate](https://codeclimate.com/github/sdinc/sdinc-rundeck/badges/gpa.svg)](https://codeclimate.com/github/sdinc/sdinc-rundeck)
[![Issue Count](https://codeclimate.com/github/sdinc/sdinc-rundeck/badges/issue_count.svg)](https://codeclimate.com/github/sdinc/sdinc-rundeck)
# sdinc-rundeck

Wrapper around the community rundeck cookbook

## Supported Platforms

### Tested And Validated On
- Ubuntu 14.04

## Usage

### sdinc-rundeck::default

Include `sdinc-rundeck` in your run_list.

```json
{
  "run_list": [
    "recipe[sdinc-rundeck::default]"
  ]
}
```

## Testing
rake with no parameters does a berks vendor

- rake ci:unit
  - rubocop
  - knife foodcritic
  - rspec
- rake ci:integration
  - kitchen test
