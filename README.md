Shorty
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


## Objective:
1. Provide a simple web front which will take URL input and give back a shortened URL
2. When user access the short URL it should be redirected to full URL


## Design and thought process:
- Start with a simple API that accepts URL and returns a URL of the format https://domain/urls/{short-url}. 
- The API will save the url to a urls table
- `short-url` can be the id of the url in the database table
- Consider a hash instead of id as the next step. Its better to not show the id of an internal object.
- One approach to short url is given the same url, return the same `short-url`. But sometimes, we want different `short-url` for tracking. I am making an assumption that unique short url is not a requirement.

Ruby on Rails
-------------

This application requires:

- Ruby 2.5.1
- Rails 5.2.0

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
