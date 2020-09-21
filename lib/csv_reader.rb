require "csv"

module CsvToSqlite

  class CsvReader

    def initialize file_path
      @file_path = file_path
    end

    def load_file
      CSV.parse(File.read(@file_path), headers: true, col_sep: separator)
    end

    def separator
      first_line = File.open(@file_path) do |file|
        line = file.readline
        return ";" if line.include? ";"
        return "," if line.include? ","
      end
    end

  end

end
