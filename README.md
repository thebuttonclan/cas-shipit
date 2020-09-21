[![Maintainability](https://api.codeclimate.com/v1/badges/b353e4e5606941eec4db/maintainability)](https://codeclimate.com/github/bcgov/cas-shipit/maintainability)

# README

This project is a test and only a test. Use at your own peril...

## Set up in Openshift namespace

Before triggering the first build, you need to run `make create_secrets`, as the RAILS_MASTER_KEY is required to build assets
**TODO**: figure out how to use a dummy RAILS_MASTER_KEY in the build step

# Run Locally

## Setup Credentials

  - Run `EDITOR='<preferred editor> --wait' rails credentials:edit` to edit credentials file
  - Follow guide at https://github.com/Shopify/shipit-engine/blob/master/docs/setup.md to set credentials and github app

## Start App Locally

  - In terminal, run `redis-server` to start redis server
  - In another terminal, run `pg_ctl` to start postgres
  - In another terminal, run `rails exec sidekiq` to start sidekiq
  - In another terminal, run `rails server` to start app

## Docker-compose

  - Run `RAILS_MASTER_KEY=<master key> docker-compose up`
  - If this is your first time starting the server, initialize the database with `docker-compose run app bundle exec rake db:create`

# Deploying

## Circleci

Setup a user on AWS with permissions to push and pull to ECS, and give them permissions on the eks cluster. 
Use their credentials to setup the following environment variables in circleci:

  - ACCESS_KEY_ID:          users access key id
  - AWS_CLUSTER_NAME        name of the eks cluster to install shipit on
  - AWS_ECR_ACCOUNT_URL     account url without repo name, e.g 555555555555.dkr.ecr.<cluster-region>.amazonaws.com
  - AWS_ECR_REPO_NAME       name of ecr repo to contain images
  - AWS_REGION              region eks cluster is in
  - SECRET_ACCESS_KEY       user secret access key

Merging into the deploy branch will trigger remaking the docker image, saving it in ecr with a new tag (using the git commit hash),
and redeploy it via helm into the eks cluster.