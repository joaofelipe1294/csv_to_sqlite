module CsvToSqlite
  class ArgumentHandlerService

    def initialize argv
      @argv = argv
    end

    def call
      return empty if @argv.empty?
      return help if @argv.include? "-h"
      :convert
    end

    def help
      puts "Run csv_lto_sqlite3 is easy!"
      puts "To convert a csv file into a sqlite3 database you just need to run the follow command from the same directory of the csv file:"
      puts "csv_to_sqlite your_csv_file.csv"
      puts "==============================="
      puts "-t <table-name> -> parameter used to set wich table will be created/used"
      puts "Some customisations will be aviable on next versions :)"
      nil
    end

    def empty
      puts "Run 'csv_to_sqlite -h' to receive some help or csv_to_sqlite csv_file.csv to generate a SQLite3 database from a csv file."
      nil
    end

  end
end