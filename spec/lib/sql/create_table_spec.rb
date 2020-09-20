require_relative "../../../lib/csv_reader"
require_relative "../../../lib/sql/create_table"
require_relative "../../../lib/database"

RSpec.describe CsvToSQLite::SQL::CreateTable do

  before :each do
    connection = CsvToSQLite::Database.new.connect
    csv_table = CsvToSQLite::CsvReader.load_file 'spec/test_files/test_file.csv'
    @table_maker = CsvToSQLite::SQL::CreateTable.new name: "some_table", csv_table: csv_table, connection: connection
  end

  after :each do
    File.delete './data.sqlite3'
  end

  describe '#create_statement' do
    it 'is expected to return a string with initial create table statement' do
      expect(@table_maker.create_statement).to match "CREATE TABLE IF NOT EXISTS some_table"
    end
  end

  describe '#columns' do
    it 'is expected to generate all columns sql' do
      expect(@table_maker.columns).to match "Id INTEGER,Name TEXT,Age INTEGER,birth_date DATE,Amount FLOAT,is_cool BOOLEAN,some_time DATETIME"
    end
  end

  describe '#sql' do
    it 'is expected to return a string with complete sql statement' do
      expect(@table_maker.sql).to match "CREATE TABLE IF NOT EXISTS some_table ( Id INTEGER,Name TEXT,Age INTEGER,birth_date DATE,Amount FLOAT,is_cool BOOLEAN,some_time DATETIME );"
    end
  end

end
