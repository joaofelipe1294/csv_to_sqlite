require "tty-progressbar"

module CsvToSqlite::SQL

  class Insert

    def initialize connection:, csv_table:, name:
      @connection = connection
      @csv_table = csv_table
      @name = name
    end

    def run
      columns = @csv_table.headers.sort
      bar = TTY::ProgressBar.new("Inserting data [:bar] :percent", total: @csv_table.by_row.count)
      @csv_table.by_row.each do |row|
        values = columns.map { |column| row[column] }
        question_marks = ("?," * columns.size).chop!
        @connection.execute("INSERT INTO #{@name} (#{columns.join(',')}) VALUES (#{question_marks})", values)
        bar.advance(1)
      end
      bar.finish
    end

  end

end
