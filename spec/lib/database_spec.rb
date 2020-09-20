require_relative '../../lib/database'

RSpec.describe CsvToSqlite::Database do

  describe '#create' do
    context 'when database has default name' do
      context 'when there isnt a file sqlite file' do
        it 'is expected to create a new sqlite file' do
          CsvToSqlite::Database.new.create
          expect(File).to exist('./data.sqlite3')
          File.delete './data.sqlite3'
        end
        it 'is expected to print "Creating database"' do
          expect {
            CsvToSqlite::Database.new.create
            File.delete './data.sqlite3'
          }.to output("Creating database\n").to_stdout
        end
      end
      context 'when there is a file with database name' do
        it 'is expected to puts "Database found"' do
          expect {
            File.open('./data.sqlite3', 'w')
            CsvToSqlite::Database.new.create
            File.delete './data.sqlite3'
          }.to output("Database found\n").to_stdout
        end
      end
    end
    context 'when database has custom name' do
      context 'when there isnt a file sqlite file' do
        it 'is expected to create a new sqlite file' do
          CsvToSqlite::Database.new(db_name: 'nerv_database.sqlite3').create
          expect(File).to exist('./nerv_database.sqlite3')
          File.delete './nerv_database.sqlite3'
        end
      end
    end
  end

end
