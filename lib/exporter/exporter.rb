module Exporter
  class Exporter
    def self.export(data, options)
      document = process(data, options)
      raise TypeError.new('process method must return an Document object') unless document.kind_of? Document
      document
    end

    protected
    def self.process(data, options)
      raise NotImplementedError.new("You must implement this process method.")
    end
  end
end