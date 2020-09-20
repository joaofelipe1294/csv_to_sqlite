require "csv"

module CsvToSQLite

  class CsvReader

    def self.load_file file_path
      CSV.parse(File.read(file_path), headers: true, col_sep: ';')
    end

  end

end