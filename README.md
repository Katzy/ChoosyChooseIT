# ChoosyChooseIt

This is a user polling App.  It allows users who are indecisive to create a poll about anything.  Users may upload a photo if they want.  They enter a description, add the emails to whom they want to receive the poll and click create button.  An email will be sent with a link to the poll, where users and/or guests who have the link may vote.  

## Install

Fork this repository
Download to your desktop or your preferred directory
In terminal

cd desktop/choosychoosit

bundle install --without production

Environments and outside sources you need to set up

.env file

You'll need to make a .env file under root directory to hold the env variables.
Under desktop/choosychoosit cp .env.example .env

## Database

You'll need to set up postgres database on your local machine

brew update

brew install postgresql

For more detailed installation guide, <a href="http://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/" target="_blank">here</a>

## Faceboook login setup

This app uses facebook login for user authentication.
The .env file include the FACEBOOK_APP_ID and FACEBOOK_APP_SECRET for a fb_login app development version, it should work out of box. If for some reason it stopped working, you can follow instructions here to set up a new facebook login app.

## Dragonfly

This app uses dragonfly for photo processing.
gem install dragonfly

## Dragonfly-s3_data_store

This app uses dragonfly-s3-data-store as adaptor for dragonfly + Amazon S3
gem install dragonfly-s3_data_store

## Amazon AWS S3

This app uses Amazon S3 for photo storage. You'd need to set up a seperate amazon S3 account. AWS allows free account and usage.

Register a free account if you don't have one yet. Make a bucket to store photos just for this app.

After logging in S3, generate ACCESS KEY ID and SECRET ACCESS KEY under Services -> IAM -> Users -> your username -> Security Credentials

Retrieve the following information:

Your AMAZON S3 BUCKET NAME, as a string.
Your S3 ACCESS KEY ID
Your S3 SECRET ACCESS KEY
Your S3 Bucket AWS ASSET HOST URL (this can be found by going bucket -> Properties, it looks something like https://choosychoosit.s3.amazonaws.com)

Enter the those information to the appropiate matching lines in your .env file

## Friendly-id

This app uses Friendly-id for slugs in the place of poll id #'s as the link.  It creates a user friendly, more visually asthetic link to click.  It also allows for search of a poll using it's primary key without having to worry about creating your own `to_param` method.


## Sendgrid for email

This app uses Sendgrid for email in production on Heroku.
Visit Heroku site, register a free account and retrieve USERNAME and PASSWORD, input those values in your .env file.
Up and running locally

Create empty database by running bundle exec rake db:setup
Generate secrets.yml file by running bundle exec rake secret:create_file
Run the database migration by running bundle exec rake db:migrate
