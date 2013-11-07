module Exporter
  class Document
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def to_file(path)
      raise 'must override this method in subclass'
    end

    def to_stream(path)
      raise 'must override this method in subclass'
    end
  end
end