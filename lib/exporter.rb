require "exporter/version"

module Exporter
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.export(data, export_type, options)
    exporter = @configuration.exporter(data.class, export_type)
    if exporter
      exporter.export(data, options)
    else
      raise ArgumentError.new("Not support this data type: #{data.class} ")
  end
end
