require_relative '../../lib/database'

RSpec.describe CsvToSQLite::Database do

  describe '#create' do
    context 'when database has default name' do
      context 'when there isnt a file sqlite file' do
        it 'is expected to create a new sqlite file' do
          CsvToSQLite::Database.new.create
          expect(File).to exist('./spec/lib/data.sqlite3')
          File.delete './spec/lib/data.sqlite3'
        end
        it 'is expected to print "Creating database"' do
          expect {
            CsvToSQLite::Database.new.create
            File.delete './spec/lib/data.sqlite3'
          }.to output("Creating database\n").to_stdout
        end
      end
      context 'when there is a file with database name' do
        it 'is expected to puts "Database found"' do
          expect {
            File.open('./spec/lib/data.sqlite3', 'w')
            CsvToSQLite::Database.new.create
            File.delete './spec/lib/data.sqlite3'
          }.to output("Database found\n").to_stdout
        end
      end
    end
    context 'when database has custom name' do
      context 'when there isnt a file sqlite file' do
        it 'is expected to create a new sqlite file' do
          CsvToSQLite::Database.new(db_name: 'nerv_database.sqlite3').create
          expect(File).to exist('./spec/lib/nerv_database.sqlite3')
          File.delete './spec/lib/nerv_database.sqlite3'
        end
      end
    end
  end

end
