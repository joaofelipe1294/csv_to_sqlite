require_relative "../lib/csv_to_sqlite"

RSpec.describe CsvToSqlite do

  describe '#run' do
    context 'when argv is empty' do
      it 'should print some help' do
        expect {
          CsvToSqlite::CsvToSQLite.new(["csv_to_sqlite"]).run
        }.to output("Run 'csv_to_sqlite -h' to receive some help or csv_to_sqlite csv_file.csv to generate a SQLite3 database from a csv file.\n").to_stdout
      end
    end
    context 'when argv has -h' do
      it 'is expected to print help of text' do
          expect {
            CsvToSqlite::CsvToSQLite.new(["csv_to_sqlite", "-h"]).run
          }.to output("Run csv_lto_sqlite3 is easy!\nTo convert a csv file into a sqlite3 database you just need to run the follow command from the same directory of the csv file:\ncsv_to_sqlite your_csv_file.csv\n===============================\nSome customisations will be aviable on next versions :)\n").to_stdout
      end
    end    
    
  end

end
