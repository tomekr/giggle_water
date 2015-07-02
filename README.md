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
2. Run the `bundle install` command
3. You will need to create a `database.yml` file, run `touch
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

4. Run the `rake db:migrate` command
5. Run the `rake db:seed` command
6. From here you can start the web server by using the `rails server`
   command.
7. Navigate to http://localhost:3000 (Note: you can login with the
   account found in `config/secrets.yml`

License
-------
GPLv3

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.2
- Rails 4.2.2
