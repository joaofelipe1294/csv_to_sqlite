# CsvToSqlite3

CsvToSqlite3 is a gem that aims to work as a executable like rake or bundler, it servs as a Sqlite3 database generator from csv files. It is used to create and insert all data from one or more csv files to the same Sqlite3 database.

The ideia comes from a specific cenario when I needed to run complex sql queries on a huge database, and once I was afraid to run it directly in prolduction and it impacts in the operation I chose to run simples selects (select * from some_table when created_at > some_date) from each table used on my query, export to csv files than create a specific ruby script that create a sqlite3 database and run the inserts, thereby i can run any havy query on my local computer without generate any impact in the operation.

Once this cenario is quite common I decided to rewrite the script to work with any csv file exported from any table.

## Installation

Installed with gem:

    $ gem install csv_to_sqlite3

## Usage

Once the gem is installed it is aviable the command "csv_to_sqlite", to generate a new database you need to run on terminal "csv_to_sqlite path/to/file.csv'". It will create a file named data.sqlite3 and create a table with name equal to file name, case the table already exists it will only insert all data from this file.

    $ csv_to_sqlite stores.csv

By running the command above it will be generated a database data.sqlite3 with a table named stores with all data included. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joaofelipe1294/csv_to_sqlite3.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
