require 'rspec'
require_relative '../app/Csv_reader'

describe 'CSV reader' do

  it 'reads a csv file and recognises columns' do
    reader = Csv_reader.new ('postcode.csv')
    postcode_table = reader.read
    expect(postcode_table[1]).to eq(['2801AA', 'Sint Jan B', 'B', 'B-1', 'Jan de Wit', 'jpdewit@kpnplanet.nl'])

    hits = postcode_table.select{|x, _| x == '2801AA'}
    puts hits
  end
end
