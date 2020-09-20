require_relative "../../../lib/sql/insert"
require_relative "../../../lib/database"
require_relative "../../../lib/sql/create_table"


RSpec.describe CsvToSqlite::SQL::Insert do

  before :each do
    @connection = CsvToSqlite::Database.new.connect
    csv_table = CsvToSqlite::CsvReader.load_file 'spec/test_files/test_file.csv'
    CsvToSqlite::SQL::CreateTable.new(name: "persons", csv_table: csv_table, connection: @connection).run
    CsvToSqlite::SQL::Insert.new(name: "persons", csv_table: csv_table, connection: @connection).run
  end

  after :each do
    File.delete './data.sqlite3'
  end

  describe '#run' do
    it 'is expected to create data present on csv file' do
      result = @connection.execute("Select count(1) from persons")
      expect(result).to match [[4]]
    end
  end


end
