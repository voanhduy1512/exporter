module Exporter
  class CsvDocument < Document
    def to_file(path)
      File.open(path, 'w') {|f| f.write(@data) }
    end
  end
end