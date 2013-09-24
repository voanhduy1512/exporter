module Exporter
  class CsvExporter < Exporter
    def process(data, options)
      raise TypeError.new('data must be an array') unless data.class.eql? Array
      columns = options[:columns] || data[0].class.attribute_names
      CSV.generate do |csv|
        csv << columns
        data.each do |d|
          csv << d.attributes.values_at(*columns)
        end
      end
    end
  end
end