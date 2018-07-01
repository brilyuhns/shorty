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



## So far we have:
- /short_urls/new allows user to enter the url
- /short_urls/create creates the short_url object
- /short_url/{id} redirects to the original url
- /short_url/{invalid id} shows a 404 page
- Specs for new and create short_url
- Show an info page with the short url once created


## Next steps:
- Replace id with a hash code
- Make sure all specs pass
- Clean up the unused code

## Id to hashcode
### Save code to db or not
- If code is in db, we have to handle for uniqueness. If we have a lot of records, we would have to search by code for all those.
- Saving in the db allows us to extend such that user can assign a code to the url.

### HashIds
- We can but don't need to store it in db. The code will be unique always. 
- Cannot allow user to enter a custom code. If we allow user created codes, we would have to save code to db, search by code and add validation for uniqueness ourselves. 


### Solution I am going with
Add code field to the short_urls table with an index and uniqueness constraint. Use SecureRandom to generate a code for url. There is a #urlsafe_base64 method that seems ideal.
Postgres integer range is between -2,147,483,648 and +2,147,483,6476. 6 characters secure random hash should give 68719476736 codes which should be enough for now. Just to be safe I will use 8 characters.



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
