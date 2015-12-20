vanilla-forums-api
==========================
[![Code Climate](https://codeclimate.com/github/corthmann/vanilla-forums-api/badges/gpa.svg)](https://codeclimate.com/github/corthmann/vanilla-forums-api)
[![Test Coverage](https://codeclimate.com/github/corthmann/vanilla-forums-api/badges/coverage.svg)](https://codeclimate.com/github/corthmann/vanilla-forums-api/coverage)

Connect Ruby applications with the Vanilla forums Platform

Installation
-------------
You can install this gem by using the following command:
```
gem install vanilla-forums-api
```
or by adding the the following line to your Gemfile.
```
gem 'vanilla-forums-api'
```

Configuration
-------------
```
require 'vanilla-forums-api'
VanillaForumsAPI.configure do |config|
    config.endpoint = 'https://yoursite.vanillaforums.com'
    config.access_token = '123'
end
```

Using the API
-------------
Get a list of categories:
```
require 'vanilla-forums-api/models/category'
categories = VanillaForumsAPI::Category.find_all
categories = VanillaForumsAPI::Category.find_all(page = 2)
```
Get the category with a given id
```
require 'vanilla-forums-api/models/category'
category = VanillaForumsAPI::Category.find_by_id(11)
```

API Support
-------------
The following APIs are supported:

API | Gem Version | Official Documentation
--- | --- | ---
categories | 1.0.0 | http://docs.vanillaforums.com/api/categories/
comments | 1.0.0 | http://docs.vanillaforums.com/api/comments/
forum administration | 1.0.0 | http://docs.vanillaforums.com/api/forum-administration/
role | 1.0.0 | http://docs.vanillaforums.com/api/roles/
