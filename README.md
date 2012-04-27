# Redness

Simple data structures for Redis-backed Ruby applications

### Description

Redness extends the redis-rb client library with useful data structures. It provides higher-level access
to Redis than the client library while remaining more composable and minimal than a full-featured ORM.

### Installation
``
  gem install redness
``

### Getting Started
```ruby
  require 'redis'
  require 'json'
  require 'redness'

  $redis = Redis.new

  RedJSON.set("foo", {:foo => ["bar", "baz", "buzz"]})
  #=> "OK"
  RedJSON.get("foo")
  #=> {"foo"=>["bar", "baz", "buzz"]}

  RedList.get("users:1:viewers")
  #=> [1]
  RedList.add("users:1:viewers", 2)
  #=> 2
  RedList.get("users:1:viewers")
  #=> [2, 1]
  RedList.add("users:1:viewers", 2)
  #=> 2
  RedList.get("users:1:viewers")
  #=> [2, 2, 1]
```

### Copyright

Copyright (c) 2012 HowAboutWe. See LICENSE.txt for further details.
