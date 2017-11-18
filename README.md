# Fried::Test

This gem provides a small text executable named `friest` which is just a
wrapper around `minitest/autorun`. You can run `friest` and it will run the
test suite automatically for any test found in the directory `test` with any
file ending with `_test.rb`.

## Philosophy

This gem is mainly a **philosophy** on how your tests should be written.
Tests API should be so simple that any Ruby developer can jump in and use it.

Here is how your tests should look:

```
require "test_helper"

class HelloWorldTest < Minitest::Spec
  def setup
    @text = "hello, world!"
  end

  it "uses text 'hello, world!'" do
    assert "hello, world!" == @text
  end
end
```

This is pure ruby. We don't use `def` because it feels more magical having
to prefix methods with `test_`, so `it` might as well do it. In addition,
pure text is much  more descriptive than a method with_underscores_in_name.

You are allowed to use only the following assertions:

- `assert`
- `refute`
- `assert_raises`

So that any junior can join your team and write tests immediately.
You are not allowed to use `describe` (it creates nested classes).

If you have to share tests between classes, use:

```
module MySharedTest
  it "has value equal to 0" do
    assert @value == 0
  end
end
```

and just `include MySharedTest` where needed.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fried-test'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fried-test

Then require **and activate** the gem in your `test_helper.rb`

```ruby
require "fried-test"
Fried::Test.activate
```

The "activation" is optional, it monkey patches `Module` class so that you can
use module to share tests.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Fire-Dragon-DoL/fried-test.
