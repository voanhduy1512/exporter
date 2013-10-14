require 'spreadsheet'

module Exporter
  class ExcelExporter < Exporter

    def process(data, options)

      raise TypeError.new unless is_active_record?(data, options)

      columns = options[:columns] || data[0].class.attribute_names

      book = Spreadsheet::Workbook.new
      sheet = book.create_worksheet
      sheet.name = options[:sheet_name] || 'sheet1'
      sheet.row(0).concat columns
      data.each_with_index do |row, index|
        sheet.row(index+1).concat row.attributes.values_at(*columns)
      end

      ExcelDocument.new(book)
    end

  end
end
