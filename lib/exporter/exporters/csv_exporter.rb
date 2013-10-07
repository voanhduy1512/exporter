module Exporter
  class CsvExporter < Exporter

    def process(data, options)

      validate data, options

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