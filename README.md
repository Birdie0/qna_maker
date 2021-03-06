# QnAMaker

[![Gem](https://img.shields.io/gem/v/qna_maker.svg)](https://rubygems.org/gems/qna_maker)
[![Gem](https://img.shields.io/gem/dt/qna_maker.svg)](https://rubygems.org/gems/qna_maker)
[![Build Status](https://travis-ci.org/Birdie0/qna_maker.svg?branch=master)](https://travis-ci.org/Birdie0/qna_maker)
[![Inline docs](https://inch-ci.org/github/Birdie0/qna_maker.svg?branch=master&style=shields)](https://inch-ci.org/github/Birdie0/qna_maker)
[![Maintainability](https://codeclimate.com/github/Birdie0/qna_maker/badges/gpa.svg)](https://codeclimate.com/github/Birdie0/qna_maker/maintainability)

:warning: **Repo is no longer maintained!** :warning:

API wrapper for [QnA Maker](https://qnamaker.ai)

## [QnA API docs](https://westus.dev.cognitive.microsoft.com/docs/services/58994a073d9e04097c7ba6fe)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qna_maker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qna_maker

## Usage

```ruby
require 'qna_maker'

client = QnAMaker::Client.new('kb_id' , 'subscription_key')
#=> #<QnAMaker::Client @knowledgebase_id="kb_id", @subscription_key="subscription_key", ...>

answers = client.generate_answer('hi')
#=> [#<QnAMaker::Answer @answer="hello", @questions=["hi"], @score=100.0>]

answers.first.answer
#=> "hello"
```

## Development status

Gem is under active development! It isn't finished yet!

### Todo list

* [x] Methods
  * [x] **POST** - Create Knowledge Base
  * [x] **DELETE** - Delete Knowledge Base
  * [x] **GET** - Download Alterations
  * [x] **GET** - Download Knowledge Base
  * [x] **POST** - Generate answer
  * [x] **PUT** - Publish Knowledge Base
  * [x] **PATCH** - Train Knowledge Base
  * [x] **PATCH** - Update Alterations
  * [x] **PATCH** - Update Knowledge Base
* [x] Documentation
* [ ] Tests

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Birdie0/qna_maker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the QnAMaker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Birdie0/qna_maker/blob/master/CODE_OF_CONDUCT.md).
