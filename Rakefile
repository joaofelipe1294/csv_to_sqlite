# require "bundler/gem_tasks"
# require "rspec/core/rake_task"
#
# RSpec::Core::RakeTask.new(:spec)
#
# task :default => :spec


# require_relative "lib/database"
# require_relative "lib/csv_reader"
# require_relative "lib/sql/create_table"
# require_relative "lib/sql/insert"

require_relative "lib/csv_to_sqlite"

task default: :convert

desc "Create tables used in sqlite"
task :convert do
  CsvToSqlite::CsvToSQLite.new.convert(ARGV[1])
end
