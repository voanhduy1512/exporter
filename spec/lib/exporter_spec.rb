require "spec_helper"

describe Exporter do
  before(:all) do
    FactoryGirl.create(:user)
  end
  let(:data){ User.all }
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
