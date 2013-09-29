module Exporter
  class Document
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def to_file(path)
      File.open(path, 'w') {|f| f.write(@data) }
    end
  end
end