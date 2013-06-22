# Slugg

[![Gem version](https://badge.fury.io/rb/slugg.png)](https://rubygems.org/gems/slugg)
[![Build Status](https://secure.travis-ci.org/artemeff/slugg.png)](https://travis-ci.org/artemeff/slugg)

Make safety urls from strings

## Installation

Add this line to your application's Gemfile:

    gem 'slugg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slugg

## Usage

```ruby
require 'slug'

Slugg.new "generate url, please"
# => "generate-url-please"

# Slugg.make is alias to Slugg.new
Slugg.make "generate url, please"
# => "generate-url-please"

# you may provide some options
Slugg.make "generate url, please", separator: "_"
# => "generate_url_please"

Slugg.make "generate url, please", stripper: "please"
# => "generate-url"

Slugg.make "strip 100$", stripper: /\d/
# => "strip"

# and you may use instance
slugg = Slugg::Sanitizer.new separator: "_"
slugg.safe "make url"
# => "make_url"

slugg.options[:separator] = "-"
slugg.safe "make url"
# => "make-url"

# options
{
  separator: '-', # define custom separator
  stripper: ''    # strip text, allows String and Regexp
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
