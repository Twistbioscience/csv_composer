# CsvComposer

Csv composer is a flexible and generic csv writer and exporter. Allows you to easily control whatever you 
want to do in each step of csv making, such as how to:
- iterate over the collection
- generate file header
- generate rows
- export final output

Easy to set up, just extend composer entities to create your own custom csv's or use the generic one.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csv_composer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install csv_composer

## Usage

Basic usage:

```ruby
    collection = [
      { id: 'element1', value: 'value1'},
      { id: 'element2', value: 'value2'},
      { id: 'element3', value: 'value3'}            
    ]
    
    exporter = CsvComposer::Generic.new
    exporter.compose(collection)
```

Where collection could be everything that includes Enumerable module (and implements each method).
This way you are able to implement your custom iterators.

## Custom csvs exporters
You can create your own custom exporters just extending CsvComposer::Base.

Override your own custom 'columns_mapping' to map every kind of object (in the collection) to csv value using lambdas:

```ruby
    def generic_lambda
      ->(item, key) { item[key] || '' }
    end
    
    def columns_mapping
      [
        { id: 'Id', key: :id, lambda: generic_lambda },
        { id: 'Value', key: :value, lambda: generic_lambda }
      ]
    end
``` 
Create and set your own custom Header processors extending 'CsvComposer::HeaderProcessors::Base' and your own custom 
ItemProcessors 'extending CsvComposer::ItemProcessors::Base'

Finally create and set your own custom file exporters extending 'CsvComposer::FileExporters::Base' to 
export csv to wherever location you want such as a file, upload it to the cloud, etc.  

Optionally you can send a second parameter to 'compose' method with a hash containing custom options that will be sent into
both header and item processor that you can use when overriding them. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Twistbioscience/csv_composer
