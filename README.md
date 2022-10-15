# README

**Testing**

**Create new valid array**
+ curl -X POST -d "dynamic_array[length]=15" http://localhost:3000/dynamic_arrays

**Try create new invalid array**
+ curl -X POST -d "dynamic_array[length]=9" http://localhost:3000/dynamic_arrays

**Get list of all array**

+ curl -X GET http://localhost:3000/dynamic_arrays

**Get largest range in array ID**
+ curl -X GET http://localhost:3000/dynamic_arrays/{:id}

Things you may want to cover:

* Ruby version

ruby-3.0.0 rails-7.0.4

* System dependencies

bundle install

* Configuration



* Database creation

rake db:create

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

rails s
