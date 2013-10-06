module Exporter
  class CsvExporter < Exporter

    def process(data, options)

      validate data

      if options[:columns]
        columns = options[:columns]
      else
        columns = data[0].class.attribute_names
      end

      data = CSV.generate do |csv|
        csv << columns
        data.each do |d|
          csv << d.attributes.values_at(*columns)
        end
      end

      CsvDocument.new(data)
    end

    private
    def validate(data)
      if data.kind_of?(Array) && data[0].kind_of?(ActiveRecord::Base)
        return
      end
      if data.kind_of? ActiveRecord::Relation
        return
      end
      raise TypeError.new
    end
  end
end