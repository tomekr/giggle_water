[![Build Status](https://travis-ci.org/tomekr/giggle_water.svg?branch=master)](https://travis-ci.org/tomekr/giggle_water)

![Giggle Water](https://github.com/tomekr/giggle_water/blob/master/public/giggle.jpg)

Giggle Water
================

Giggle Water is a cocktail recipe application that tracks the
ingredients in your bar and tells you the recipes that you can make with
those ingredients.

Currently the database has all of the cocktails in the PDT Cocktail
book.


Development
-----------

Getting your development enviornment setup for the first time:

1. Clone this repository and `cd` into the giggle_water directory
1. Run the `bundle install` command
1. You will need to create a `database.yml` file, run `touch
   config/database.yml` and put in the default sqlite configuration:

  ```yaml
  default: &default
    adapter: sqlite3
    pool: 5
    timeout: 5000

  development:
    <<: *default
    database: db/development.sqlite3

  test:
    <<: *default
    database: db/test.sqlite3

  production:
    <<: *default
    database: db/production.sqlite3
  ```

1. Run the `rake db:migrate` command
1. Run the `rake db:seed` command (This populates the database with
   recipes from the PDT cocktail book)
1. From here you can start the web server by using the `rails server`
   command.
1. Navigate to [http://localhost:3000](http://localhost:3000) (Note: you can login with the
   account found in `config/secrets.yml`)

Features
--------

Features are currently tracked at [https://www.pivotaltracker.com/n/projects/1360904](https://www.pivotaltracker.com/n/projects/1360904)

License
-------
GPLv3

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.2
- Rails 4.2.2
