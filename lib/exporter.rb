require 'active_record'
require "csv"
require "exporter/version"
require "exporter/configuration"
require "exporter/document"
require "exporter/exporter"
require "exporter/documents/csv_document"
require 'exporter/documents/excel_document'
require "exporter/exporters/csv_exporter"
require "exporter/exporters/excel_exporter"

module Exporter
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.export(data, export_type, options={})
    exporter = @configuration.exporter(data, export_type)
    if exporter
      exporter.export(data, options)
    else
      raise ArgumentError.new("Not support this data type: #{data.class} ")
    end
  end
end

Exporter.configuration.register(Array, :csv, Exporter::CsvExporter)
Exporter.configuration.register(ActiveRecord::Relation, :csv, Exporter::CsvExporter)

Exporter.configuration.register(Array, :excel, Exporter::ExcelExporter)
Exporter.configuration.register(ActiveRecord::Relation, :excel, Exporter::ExcelExporter)
