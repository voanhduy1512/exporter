require "spec_helper"

describe Exporter do
  let(:data){
    [
      Exporter::User.create(:name => 'aaa', :email => 'aaa@aaa.aaa'),
      Exporter::User.create(:name => 'bbb', :email => 'bbb@bbb.bbb')
    ]
  }
  describe '.export' do
    context ':csv' do
      it 'return an Exporter::Document' do
        document = Exporter.export(data, :csv)
        expect(document).to be_kind_of(Exporter::Document)
      end
    end

    context ':excel' do
      it 'return an Exporter::Document' do
        document = Exporter.export(data, :excel)
        expect(document).to be_kind_of(Exporter::Document)
      end
    end
  end
end