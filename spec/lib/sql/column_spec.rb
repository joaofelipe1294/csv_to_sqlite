require_relative "../../../lib/csv_reader"
require_relative "../../../lib/sql/column"

RSpec.describe CsvToSqlite::SQL::Column do

  describe '#sql_for' do
    before :each do
      csv_table = CsvToSqlite::CsvReader.load_file 'spec/test_files/test_file.csv'
      @column = CsvToSqlite::SQL::Column.new csv_table: csv_table
    end
    context 'when value is a integer' do
      it 'is expected to return "column INTEGER,"' do
        column_sql = @column.sql_for "Id"
        expect(column_sql).to match "Id INTEGER,"
      end
    end
    context 'when value is a float' do
      it 'is expected to return "column INTEGER,"' do
        column_sql = @column.sql_for "Amount"
        expect(column_sql).to match "Amount FLOAT,"
      end
    end
    context 'when value is a boolean' do
      it 'is expected to return "column BOOLEAN"' do
        column_sql = @column.sql_for "is_cool"
        expect(column_sql).to match "is_cool BOOLEAN"
      end
    end
    context 'when value is a date' do
      it 'is expected to return "column DATE"' do
        column_sql = @column.sql_for "birth_date"
        expect(column_sql).to match "birth_date DATE,"
      end
    end
    context 'when value is a datetime' do
      it 'is expected to return "column DATETIME"' do
        column_sql = @column.sql_for "some_time"
        expect(column_sql).to match "some_time DATETIME,"
      end
    end
    context 'when value is a string' do
      it 'is expected to return "column TEXT"' do
        column_sql = @column.sql_for "Name"
        expect(column_sql).to match "Name TEXT,"
      end
    end
  end

end
