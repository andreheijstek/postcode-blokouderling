class Csv_reader

  require 'csv'

  def initialize(filename)
    @filename = filename
  end

  def read
    CSV.read @filename, {:headers => false, :col_sep => ';', :encoding => 'ISO-8859-1'}
  end
end
