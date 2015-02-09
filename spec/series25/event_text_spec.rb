require 'spec_helper'

describe Series25::EventText do
	subject(:event) { @event ||= Series25::Event.new(single_event_xml) }
	
	describe "#text" do
		it 'returns the html string' do
			expect(event.event_texts[0].text).to eq("<strong></strong>50 Year Club Memorial Service<br><p><em>Honor the memory of classmates who are no longer with us at this celebration of life</em></p>")
		end
	end
end