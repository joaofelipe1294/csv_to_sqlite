require_relative "../../lib/csv_reader"

RSpec.describe CsvToSQLite::CsvReader do

  describe '#load_file' do
    context 'when file_path is invalid' do
      it 'is expected to throw exception "File path invalid"' do
        expect {
          CsvToSQLite::CsvReader.load_file 'some/invalid/path'
        }.to raise_error(Errno::ENOENT)
      end
    end
    context 'when file_path is valid' do
      it 'is expected to return a CsvTable object' do
        csv_table = CsvToSQLite::CsvReader.load_file 'spec/test_files/test_file.csv'
        expect(csv_table).to be_a(CSV::Table)
      end
    end
  end

end
