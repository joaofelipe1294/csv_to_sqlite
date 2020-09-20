module CsvToSQLite::SQL

  class Insert
    
    def initialize connection:, csv_table:, name:
      @connection = connection
      @csv_table = csv_table
      @name = name
    end

    def run
      columns = @csv_table.headers.sort
      @csv_table.by_row.each do |row|
        values = columns.map { |column| row[column] }
        question_marks = ("?," * columns.size).chop!
        @connection.execute("INSERT INTO #{@name} (#{columns.join(',')}) VALUES (#{question_marks})", values)
      end
    end

  end

end