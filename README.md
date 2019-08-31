# purrter

This is a twitter-like app mainly for cats, but if you're not a cat, you can use it too if you really want.

## Features:

* User authentication
* Creating Posts
* Updating User Profile
* Following and Unfollowing Users
* Responsive to mobile and tablet view

## Installing

### Prerequisites
1. Make sure you have downloaded the [latest version of ruby](https://www.ruby-lang.org/en/downloads/) (or at least the one specified in the Gemfile)
2. Make sure you have [PostgreSQL](https://www.postgresql.org/download/) installed on your computer
3. Do `ruby -v` to make sure that your ruby version is working correctly
4. Do `gem install rails`

### Installing
1. `git clone` this repository
2. Run `bundle install`
3. Log into your psql shell and run `CREATE DATABASE purrter_development;`
3. Run `rails db:migrate`
4. Run `rails s`
5. You should be good to go now
