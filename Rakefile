# require "bundler/gem_tasks"
# require "rspec/core/rake_task"
#
# RSpec::Core::RakeTask.new(:spec)
#
# task :default => :spec


require_relative "lib/database"
require_relative "lib/csv_reader"
require_relative "lib/sql/create_table"
require_relative "lib/sql/insert"

task default: :setup

desc "Create tables used in sqlite"
task :setup do
  connection = CsvToSQLite::Database.new().connect
  csv_table  = CsvToSQLite::CsvReader.load_file './spec/test_files/test_file.csv'
  CsvToSQLite::SQL::CreateTable.new(name: 'persons', csv_table: csv_table, connection: connection).run
  CsvToSQLite::SQL::Insert.new(name: 'persons', csv_table: csv_table, connection: connection).run
end
