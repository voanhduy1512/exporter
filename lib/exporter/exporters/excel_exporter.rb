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
      sheet1 = book.create_worksheet
      sheet1.name = options[:sheet_name] || 'sheet1'
      sheet1.row(0).concat columns
      data.each_with_index do |row, index|
        sheet1.row(index+1).concat row.attributes.values_at(*columns)
      end
      ExcelDocument.new(book)
    end

    private
    def validate(data, options)
      if data.kind_of? ActiveRecord::Relation
        return
      elsif data.kind_of?(Array) && (data[0].kind_of?(ActiveRecord::Base) || options[:columns])
        return
      else
        raise TypeError.new
      end
    end
  end
end