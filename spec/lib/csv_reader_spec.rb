require_relative "../../lib/csv_reader"

RSpec.describe CsvToSqlite::CsvReader do

  describe '#load_file' do
    context 'when file_path is invalid' do
      it 'is expected to throw exception "File path invalid"' do
        expect {
          CsvToSqlite::CsvReader.new('some/invalid/path').load_file
        }.to raise_error(Errno::ENOENT)
      end
    end
    context 'when file_path is valid' do
      it 'is expected to return a CsvTable object' do
        csv_table = CsvToSqlite::CsvReader.new('spec/test_files/test_file.csv').load_file
        expect(csv_table).to be_a(CSV::Table)
      end
    end
  end

  describe '#separator' do
    context 'when csv file separator is ,' do
      it 'is expected to return ;' do
        csv_reader = CsvToSqlite::CsvReader.new('spec/test_files/test_file.csv')
        expect(csv_reader.separator).to match ";"
      end
    end
    context 'when csv file separator is ,' do
      it 'is expected to return ,' do
        csv_reader = CsvToSqlite::CsvReader.new('spec/test_files/coma_example.csv')
        expect(csv_reader.separator).to match ","
      end
    end
  end

end
