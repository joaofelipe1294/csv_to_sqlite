require "csv_to_sqlite/version"
require_relative "./database"
require_relative "./csv_reader"
require_relative "./sql/create_table"
require_relative "./sql/insert"

module CsvToSqlite
  # class Error < StandardError; end

  class CsvToSQLite

    def convert
      connection = CsvToSqlite::Database.new().connect
      csv_table  = CsvToSqlite::CsvReader.load_file './spec/test_files/test_file.csv'
      CsvToSqlite::SQL::CreateTable.new(name: 'persons', csv_table: csv_table, connection: connection).run
      CsvToSqlite::SQL::Insert.new(name: 'persons', csv_table: csv_table, connection: connection).run
    end

  end

end
