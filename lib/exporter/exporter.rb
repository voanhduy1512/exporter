module Exporter
  class Exporter
    def self.export(data, options)
      document = exporter.process(data, options)
      raise TypeError.new('process method must return an Document object') unless document.kind_of? Document
      document
    end

    def self.exporter
      @exporter ||= self.new
    end

    protected
    def process(data, options)
      raise NotImplementedError.new("You must implement this process method.")
    end

    def is_active_record?(data, options)
      (data.kind_of? ActiveRecord::Relation) || (data.kind_of?(Array) && data[0].kind_of?(ActiveRecord::Base))
    end
  end
end