module Exporter
  class Configuration
    def initialize
      @processors = Hash.new
    end

    def register(data_type, export_type, processor)
      @processor[data_type][export_type] = processor
    end

    def can_process?(data_type, export_type)
      (@processor[data_type] && @processor[data_type][export_type]) ? true : false
    end

    def get_processor(data_type, export_type)
      @processor[data_type][export_type]
    end
  end
end