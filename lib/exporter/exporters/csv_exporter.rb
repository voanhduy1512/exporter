module Exporter
  class CsvExporter < Exporter

    def process(data, options)

      raise TypeError.new unless is_active_record?(data, options)

      columns = options[:columns] || data[0].class.attribute_names

      data = CSV.generate do |csv|
        csv << columns
        data.each do |d|
          csv << d.attributes.values_at(*columns)
        end
      end

      CsvDocument.new(data)
    end

  end
end
