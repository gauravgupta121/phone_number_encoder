# PhoneNumberEncoder

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'phone_number_encoder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phone_number_encoder

## Usage

This gem can be used to convert the 10 digit numbers into possible combinations of letters.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gauravguptaa121/phone_number_encoder.

## Execution Log

```
~/projects/phone_number_encoder (master) $ bin/console
2.6.0 :001 > require 'benchmark'
 => true
2.6.0 :002 > puts Benchmark.measure { PhoneNumberEncoder::NumberEncoder.new.encoded_words(6686787825) }
  0.720749   0.027921   0.748670 (  0.749057)
 => nil
```

## Spec Execution Log

```
PhoneNumberEncoder::NumberEncoder
  Instance Methods
    #encoded_words
      should not accept invalid numbers
      should return possible words

PhoneNumberEncoder
  has a version number

Finished in 2.03 seconds (files took 0.22241 seconds to load)
3 examples, 0 failures
```
## Idea Behind Implementation

1. First of All get all the sets of sub-number in which a number can be divided.
2. Find the respective letters for each digit of sub-number.
3. Create the possible combination of words for each sub-number.
4. Compare each word with the dictionary and kept only those words which are present in the dictionary.
5. Now make the set of the sorted words for each number set.