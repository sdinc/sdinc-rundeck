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
