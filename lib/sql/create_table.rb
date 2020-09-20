require_relative './column'
require_relative '../database'

module CsvToSqlite::SQL

  class CreateTable

    def initialize name:, csv_table:, connection:
      @connection = connection
      @name = name
      @csv_table = csv_table
    end

    def run
      puts "========== Creating table #{@name} =========="
      @connection.execute sql
      puts "=================================================="
    end

    def sql
      "#{create_statement} ( #{columns} );"
    end

    def create_statement
      "CREATE TABLE IF NOT EXISTS #{@name}"
    end

    def columns
      @column_generator = CsvToSqlite::SQL::Column.new(csv_table: @csv_table)
      columns_sql = @csv_table.headers.map do |column|
        @column_generator.sql_for column
      end
      columns_sql.join.chop
    end

  end

end
