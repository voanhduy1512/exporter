module Exporter
  class Configuration
    def initialize
      @exporters = Hash.new
    end

    def register(data_type, export_type, exporter)
      @exporters[data_type] = {export_type => exporter}
    end

    def can_export?(data_type, export_type)
      @exporters[data_type] && @exporters[data_type][export_type]
    end

    def exporter(data_type, export_type)
      can_export?(data_type, export_type) ? @exporters[data_type][export_type] : nil
    end
  end
end