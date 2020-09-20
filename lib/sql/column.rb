module CsvToSQLite::SQL

  class Column
    
    def initialize csv_table:
      @csv_table = csv_table
    end

    def sql_for column
      @data = @csv_table[column][0..2]
      if int?
        type = "INTEGER"
      elsif float?
        type = "FLOAT" 
      elsif boolean?
        type = "BOOLEAN"
      elsif datetime?
        type = "DATETIME"
      elsif date?
        type = "DATE"
      else
        type = "TEXT"
      end
      "#{column} #{type},"
    end

    def int?
      meta_comparing :Integer
    end

    def float?
      meta_comparing :Float
    end

    def boolean?
      match_cases = @data.map do |value| 
        return true if value == 't' or value == 'f' or value == 'true' or value == 'false'
        return false
      end
      match_cases.all { |value| value == true }
    end

    def date?
      match_cases = @data.map do |value| 
        begin 
          Date.parse value
          return true unless value.include? ":"
          return false
        rescue ArgumentError
          return false
        end
      end
      match_cases.all { |value| value == true }
    end

    def datetime?
      match_cases = @data.map do |value| 
        begin 
          DateTime.parse value
          return true if value.include? ":"
          return false
        rescue ArgumentError
          return false
        end
      end
      match_cases.all { |value| value == true }
    end

    def meta_comparing type
      match_cases = @data.map do |value| 
        begin 
          method = Kernel.method(type)
          method.call value
          return true
        rescue ArgumentError
          return false
        end
      end
      match_cases.all { |value| value == true }
    end

  end

end