module Exporter
  class ExcelDocument < Document
    def to_file(path)
      @data.write path
    end
  end
end