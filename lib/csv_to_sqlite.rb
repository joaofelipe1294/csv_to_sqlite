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
      self.convert(@args.first) unless method.nil?
    end

    def convert file_path
      connection = CsvToSqlite::Database.new().connect
      csv_table  = CsvToSqlite::CsvReader.new(file_path).load_file
      CsvToSqlite::SQL::CreateTable.new(name: table_name, csv_table: csv_table, connection: connection).run
      CsvToSqlite::SQL::Insert.new(name: table_name, csv_table: csv_table, connection: connection).run
    end

    def table_name
      if @args.include? "-t"
        table_name_index = @args.find_index "-t"
        return @args[table_name_index + 1]
      else
        return csv_file_name.split("/").last.split(".csv").first
      end
    end

    def csv_file_name
      file_name = nil
      @args.each_with_index do |param, index|
        file_name = param if param.include? ".csv"
      end
      file_name
    end

  end

end
