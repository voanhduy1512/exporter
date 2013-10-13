require "spec_helper"

describe Exporter do

  before(:all) {FactoryGirl.create(:user)}

  let(:data){ User.all }

  describe '.export' do
    context 'ActiveRecord::Relation' do
      it 'can export to csv' do
        expect(Exporter.configuration.can_export?(data, :csv)).to eql(true)
      end

      it 'can export to excel' do
        expect(Exporter.configuration.can_export?(data, :excel)).to eql(true)
      end

      it 'can\'t export not register type' do
        expect(Exporter.configuration.can_export?(data, :some_weird_type)).to eql(false)
      end

      context ':csv' do
        it 'return an Exporter::Document subclass' do
          document = Exporter.export(data, :csv)
          expect(document).to be_kind_of(Exporter::Document)
        end

        it 'write to file correct' do
          document = Exporter.export(data, :csv)
          document.to_file('dummy.csv')
          content = File.read('dummy.csv')
          expect(content.length).to eql(document.data.length)
          File.delete('dummy.csv')
        end
      end

      context ':excel' do
        it 'return an Exporter::Document subclass' do
          document = Exporter.export(data, :excel)
          expect(document).to be_kind_of(Exporter::Document)
        end

        it 'write to file correct' do
          document = Exporter.export(data, :excel)
          document.to_file('dummy.xls')
          content = Spreadsheet.open('dummy.xls')
          expect(content.worksheet(0).last_row_index).to eql(document.data.worksheet(0).last_row_index)
          expect(content.worksheet(0).row(1)).to eql(document.data.worksheet(0).row(1))
          File.delete('dummy.xls')
        end
      end
    end
  end
end
