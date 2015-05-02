# ibge-search
Web service to search informations about brazilian cities

How to use
==========

send a `GET` http request to `/city_name` or `/init_city_name` ex: `/salvador` or `/sal`, the app return a json data with cities and your informations.

Obs: Send request without special character. 

Run
===

To test app run this command `jruby -S main.rb`

Deploy tomcat
=============

this command create the .war file to deploy on tomcat `jruby -S warble`
