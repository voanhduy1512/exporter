require "spec_helper"

describe Exporter do
  let(:data){
    [
      Exporter::User.create(:name => 'aaa', :email => 'aaa@aaa.aaa'),
      Exporter::User.create(:name => 'bbb', :email => 'bbb@bbb.bbb')
    ]
  }
  describe '.export' do
    it 'return an Exporter::Document' do
      document = Exporter.export(data, :csv)
      puts document.kind_of? Exporter::Document
      puts document.class
      expect(document).to be_kind_of(Exporter::Document)
    end
  end
end