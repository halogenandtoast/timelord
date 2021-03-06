# Timelord
[![Code Climate](https://codeclimate.com/github/halogenandtoast/timelord.png)](https://codeclimate.com/github/halogenandtoast/timelord)
[![Build Status](https://travis-ci.org/halogenandtoast/timelord.svg?branch=mm-matchers)](https://travis-ci.org/halogenandtoast/timelord)

Timelord parses dates out of strings. The string itself can contain non-date text - for instance: "Call Matt on Tuesday"
will return a date object for the upcoming Tuesday.

## Usage

```ruby
require 'timelord'
Timelord.parse("Tuesday").to_s # "2011-01-04"
Timelord.parse("On Tuesday go for a walk").to_s # "2011-01-04"
```


For more examples, check out the [spec](https://github.com/halogenandtoast/timelord/blob/master/spec/timelord_spec.rb)

## Date format

The default date format is the international format. 11/01 is January 11th.

To use the american date format pass in :american as the second parameter

```ruby
Timelord.parse("11/01").to_s # "2011-01-11"
Timelord.parse("11/01", format: :american) # "2011-11-01"
```

## In the future

As of version 0.0.1 all dates without a year automatically choose the next occurrence of that date. If there is demand
for the ability to retrieve previous dates, then the functionality will be added.
