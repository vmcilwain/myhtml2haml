# Myhtml2haml

A [html2haml](https://github.com/haml/html2haml) wrapper for converting html templates to haml templates.

## Disclaimer

`use at your own risk!` I am not responsible if anything goes wrong while using this gem. If you are not sure it will work for you, install it on a vagrant vm and give it a try there. The Vagrantfile that is in this repo will take care of configuring a useable vm.

## Usage

`myhtml2haml` - displays the help menu

`myhtml2haml convert` - safe file conversion (does not delete original files

`myhtml2haml covert --pattern=[.erb|.html]` - Converts files with `.html.erb` extension to `.html.haml`

> Will match .erb, .html.erb, .html, and .rhtml

> Alias `-p` for `--pattern`

`myhtml2haml covert --dir_prefix` - Converts files appending parent directory name to the converted files

> Given the file app/index.html.erb the output would be app/app_index.html.haml

> Alias `-d` for `--dir_prefix`

`myhtml2haml convert --obliviate=true` - Dangerous conversion (deletes original files)

> Alias `-o` for `--obliviate`

`myhtml2haml reset` - Remove ALL haml files BE CAREFULL!!!!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'myhtml2haml'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install myhtml2haml

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Releasing
To release a new version,
* update the version number in `version.rb`
* tag the the code `git tag v1.0.0`
* push the tag `git push --tags`
* then run `bundle exec rake build`
* `gem push pkg/myhtml2haml-version`

Which will push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vmcilwain/myhtml2haml. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
