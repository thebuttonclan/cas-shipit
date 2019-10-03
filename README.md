[![Maintainability](https://api.codeclimate.com/v1/badges/b353e4e5606941eec4db/maintainability)](https://codeclimate.com/github/bcgov/cas-shipit/maintainability)

# README

This project is a test and only a test. Use at your own peril...

## Set up in Openshift namespace

Before triggering the first build, you need to run `make create_secrets`, as the RAILS_MASTER_KEY is required to build assets
**TODO**: figure out how to use a dummy RAILS_MASTER_KEY in the build step
