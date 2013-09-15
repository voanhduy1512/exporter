require "exporter/version"

module Exporter
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.export(data, export_type, options)
    if @configuration.can_process?(data.class, export_type)
      @configuration.get_processor.process(data, options)
    else
      raise ArgumentError.new("Not support this data type: #{data.class} ")
  end
end
