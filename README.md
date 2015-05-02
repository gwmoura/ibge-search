# ibge-search
Web service to search informations about brazilian cities

How to use
==========

send a `GET` http request to `/city_name` or `/init_city_name` ex: `/salvador` or `/sal`, the app return a json data with cities and your informations.

Obs: Send request without special character. 

Test and run
============

To test app run this commands:

Runing with jruby

1. `jruby -S bundle install`

2. `jruby -S main.rb`

Runing with just ruby

1. `bundle install`

2. `ruby main.rb` 

Deploy on tomcat
================

this command create the .war file to deploy on tomcat `jruby -S warble`
