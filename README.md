# shoulda-matchers-uuid

This is a patch to shoulda-matchers that allows the uniqueness validation matchers to work with MySQL UUIDs.  The current shoulda-matchers gem incorrectly increments UUID values when they are set as `binary` types (when using the [mysql-binuuid-rails gem](https://github.com/nedap/mysql-binuuid-rails)).

See [the original shoulda-matchers PR](https://github.com/thoughtbot/shoulda-matchers/pull/1159) that is likely not going to make it through.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shoulda-matchers-uuid'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shoulda-matchers-uuid

## Usage

That's it!  Use shoulda-matchers as usual to validate uniqueness of UUIDs.

## Development

Pre-requisite: `brew install mysql`, or whatever version of MySQL you prefer. We use this in our tests to verify that the full integration works as expected.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/doximity/shoulda-matchers-uuid. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/doximity/shoulda-matchers-uuid/blob/master/CODE_OF_CONDUCT.md).


## Code of Conduct

Everyone interacting in the Shoulda::Matchers::Uuid project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/doximity/shoulda-matchers-uuid/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0).
