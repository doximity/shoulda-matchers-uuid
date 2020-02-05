# shoulda-matchers-uuid

The shoulda-matchers gem does not currently support MYSQL uuid columns.  This extends it to allow validating uuids in models. [See current PR to fix](https://github.com/thoughtbot/shoulda-matchers/pull/1159)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shoulda-matchers-uuid'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shoulda-matchers-uuid

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/codenamev/shoulda-matchers-uuid. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/codenamev/shoulda-matchers-uuid/blob/master/CODE_OF_CONDUCT.md).


## Code of Conduct

Everyone interacting in the Shoulda::Matchers::Uuid project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/codenamev/shoulda-matchers-uuid/blob/master/CODE_OF_CONDUCT.md).
