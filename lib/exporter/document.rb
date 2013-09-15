module Exporter
  class Document
    attr_reader :data

    def initialize(data)
      @data = data
    end
    
    def to_file(path)
      raise NotImplementedError.new("You must implement this to_file method.")
    end
  end
end