require 'spec_helper'

describe Series25::Base do
  describe '#method_missing' do
    let(:base) { Series25::Base.new(Nokogiri::XML::Document.new)}

   context 'missing space_reservations' do
      it 'returns empty array' do
        expect(base.space_reservations).to eq([])
      end
   end

   context 'missing truly unknown method' do
      it 'raises an error' do
        expect{base.james_the_great}.to raise_error(NoMethodError)
      end
   end
  end
end