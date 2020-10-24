require "csv_to_sqlite/version"
require_relative "./database"
require_relative "./csv_reader"
require_relative "./sql/create_table"
require_relative "./sql/insert"
require_relative "./argument_handler_service"

module CsvToSqlite
  # class Error < StandardError; end

  class CsvToSQLite

    def initialize argv
      @args = argv
    end

    def run
      method = CsvToSqlite::ArgumentHandlerService.new(@args).call
      self.convert(@args[1]) unless method.nil?
    end

    def convert file_path
      connection = CsvToSqlite::Database.new().connect
      csv_table  = CsvToSqlite::CsvReader.new(file_path).load_file
      table_name = file_path.split("/").last.split(".csv").first
      CsvToSqlite::SQL::CreateTable.new(name: table_name, csv_table: csv_table, connection: connection).run
      CsvToSqlite::SQL::Insert.new(name: table_name, csv_table: csv_table, connection: connection).run
    end

  end

end
