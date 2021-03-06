# RESTful API Example [![Build Status](https://travis-ci.org/mmkarim/restfull-api-example.svg?branch=master)](https://travis-ci.org/mmkarim/restfull-api-example)

# Intro

Its a small demonstration of a RESTfull API project on Rails 5. It contains one GET and one POST API. The Post API takes a valid url as form-param, parse the HTML response and store the contents of h1, h2 and h3 and the link, shows error message with invalid url. The GET API takes no param and shows the url and content that has been succesfully stored before. Both Api gives response in JSON format.

Live demonstration: https://damp-gorge-70863.herokuapp.com/documentation#/v1

# Gem / Technology used

1. PostgreSQL as database
2. Grape for Api framework
3. Active Model Serializer for serializing response data
4. Swagger for Api doucumentation
5. Rspec, Airborne for testing Api
6. Nokogiri for parsing HTML

For tutorial, check my blogpost: https://rails-magic.blogspot.com/2016/06/make-api-with-grape-and-swagger-gem.html

# Uses

1. Download the project and install all the gems.
2. Change the username and password in config/database.yml with your local PostgreSQL username and password.
3. Create the database(rake db:create) and migrate (rake db:migrate).
4. Start rails server (rails s). Normally your server should start on http://localhost:3000/ if no additional binding provided.
5. Go to http://localhost:3000/documentation for swagger documentation of our Api.
6. Click the v1 link and you should see our two APIs. Try, use, modify and enjoy.

# Project Structure

1. Our Api located inside app/controllers/api folder.
2. It has only one model Infomation(:url, :content) and its serializer will be found inside app/serializer folder.
2. All the test written using Rspec and located inside the spec/ folder. Try (bundle exec rspec) for running the test.








