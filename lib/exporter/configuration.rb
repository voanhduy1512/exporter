module Exporter
  class Configuration
    def initialize
      @exporters = Hash.new
    end

    def register(data_type, export_type, exporter)
      if @exporters[data_type].nil?
        @exporters[data_type] = {export_type => exporter}
      else
        @exporters[data_type][export_type] = exporter
      end
    end

    def can_export?(data, export_type)
      @exporters.keys.each do |key|
        if data.kind_of? key
          return true
        end
      end
      return false
    end

    def exporter(data, export_type)
      @exporters.keys.each do |key|
        if data.kind_of? key
          return @exporters[key][export_type]
        end
      end
      return nil
    end
  end
end
