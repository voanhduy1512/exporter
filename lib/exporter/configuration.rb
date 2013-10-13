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

    def index(data, default_value, method)
      @exporters.keys.each do |key|
        return method.call(key) if data.kind_of?(key)
      end
      default_value
    end

    def can_export?(data, export_type)
      can_export_proc = Proc.new{|key| @exporters[key][export_type].present?}
      index(data, false, can_export_proc)
    end

    def exporter(data, export_type)
      exporter_proc = Proc.new {|key| @exporters[key][export_type]}
      index(data, nil, exporter_proc)
    end

  end
end
