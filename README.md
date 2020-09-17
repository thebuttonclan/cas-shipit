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

Node needs the following permissions for ECR

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:BatchCheckLayerAvailability",
                "ecr:BatchGetImage",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetAuthorizationToken"
            ],
            "Resource": "*"
        }
    ]
}
```