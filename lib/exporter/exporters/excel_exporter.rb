require 'spreadsheet'

module Exporter
  class ExcelExporter < Exporter

    def process(data, options)

      validate data, options

      if options[:columns]
        columns = options[:columns]
      else
        columns = data[0].class.attribute_names
      end

      book = Spreadsheet::Workbook.new
      sheet = book.create_worksheet
      sheet.name = options[:sheet_name] || 'sheet1'
      sheet.row(0).concat columns
      data.each_with_index do |row, index|
        sheet.row(index+1).concat row.attributes.values_at(*columns)
      end
      ExcelDocument.new(book)
    end

    private
    def validate(data, options)
      return if data.kind_of? ActiveRecord::Relation 
      return if data.kind_of?(Array) && (data[0].kind_of?(ActiveRecord::Base) || options[:columns])
      raise TypeError.new 
    end
  end
end
