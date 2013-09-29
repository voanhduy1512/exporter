require 'CSV'
module Exporter
  class CsvExporter < Exporter
    def self.process(data, options)

      raise TypeError.new('data must be an array') unless data.class.eql? Array
      raise TypeError.new('Data must be an ActiveRecord') unless data[0].kind_of? ActiveRecord::Base

      if options[:columns]
        columns = options[:columns]
      else
        columns = data[0].class.attribute_names
      end

      CSV.generate do |csv|
        csv << columns
        data.each do |d|
          csv << d.attributes.values_at(*columns)
        end
      end
    end
  end
end