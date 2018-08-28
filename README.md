# Taw

[![Build Status](https://travis-ci.org/shime/taw.svg?branch=master)](https://travis-ci.org/shime/taw)

**T**ime **A**go in **W**ords helper for non Rails projects.
No dependencies. No assumptions about your codebase. Minimalistic, ~80 SLOC.

## Usage

```ruby
require "taw"

Taw.time_ago_in_words(Time.now - 60 * 60 * 2) + " ago"
# => "2 hours ago"

Taw.time_ago_in_words(Time.now - 63) + " ago"
# => "1 minute and 3 seconds ago"

Taw.time_ago_in_words(Time.now - 60 * 60 * 2 - 63) + " ago"
# => "2 hours and 1 minute and 3 seconds ago"

Taw.time_ago_in_words(Time.now - 0.5) + " ago"
# => "a moment ago"

Taw.time_ago_in_words(Time.now - 60 * 60 * 26 - 63, approx: 1) + " ago"
# => "1 day ago"

Taw.time_ago_in_words(Time.now - 60 * 60 * 26 - 63, approx: 2) + " ago"
# => "1 day and 2 hours ago"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'taw'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install taw

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Taw project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/shime/taw/blob/master/CODE_OF_CONDUCT.md).

## License

[MIT](/LICENSE)
