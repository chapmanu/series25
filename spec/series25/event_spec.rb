require 'spec_helper'

# @note Chapman University uses custom_attributes_ids as follows:
# 	12 is contact_name, 13 is contact_phone, 14 is contact_email

describe Series25::Event do
	subject(:event) { @event ||= Series25::Event.new(single_event_xml) }

	it 'assigns to variable event_id'          do; expect(event.event_id)           .to eq("78389"); end
	it 'assigns to variable event_name'        do; expect(event.event_name)         .to eq("50 YEAR CLUB MEMORIAL SERVICE"); end
	it 'assigns to variable alien_uid'         do; expect(event.alien_uid)          .to eq(""); end
	it 'assigns to variable event_priority'    do; expect(event.event_priority)     .to eq("0"); end
	it 'assigns to variable event_title'       do; expect(event.event_title)        .to eq("50 Year Club Memorial Service"); end
	it 'assigns to variable favorite'          do; expect(event.favorite)           .to eq("F"); end
	it 'assigns to variable node_type'         do; expect(event.node_type)          .to eq("E"); end
	it 'assigns to variable node_type_name'    do; expect(event.node_type_name)     .to eq("event"); end
	it 'assigns to variable start_date'        do; expect(event.start_date)         .to eq("2014-05-23"); end
	it 'assigns to variable end_date'          do; expect(event.end_date)           .to eq("2014-05-23"); end
	it 'assigns to variable event_type_id'     do; expect(event.event_type_id)      .to eq("52"); end
	it 'assigns to variable event_type_name'   do; expect(event.event_type_name)    .to eq("Religious/Spiritual"); end
	it 'assigns to variable state'             do; expect(event.state)              .to eq("2"); end
	it 'assigns to variable state_name'        do; expect(event.state_name)         .to eq("Confirmed"); end
	it 'assigns to variable version_number'    do; expect(event.version_number)     .to eq("6"); end
	it 'assigns to variable event_locator'     do; expect(event.event_locator)      .to eq("2014-AAELYZ"); end
	it 'assigns to variable parent_id'         do; expect(event.parent_id)          .to eq("60435"); end
	it 'assigns to variable cabinet_id'        do; expect(event.cabinet_id)         .to eq("60434"); end
	it 'assigns to variable cabinet_name'      do; expect(event.cabinet_name)       .to eq("SPRING 2014"); end
	it 'assigns to variable registration_url'  do; expect(event.registration_url)   .to eq(""); end
	it 'assigns to variable last_mod_user'     do; expect(event.last_mod_user)      .to eq("dlowe"); end
	it 'assigns to variable last_mod_dt'       do; expect(event.last_mod_dt)        .to eq("2014-05-20T16:26:31-07:00"); end
	it 'assigns to variable creation_dt'       do; expect(event.creation_dt)        .to eq("2014-05-15T17:18:21-07:00"); end
	it 'assigns to variable organizations'     do; expect(event.organizations)      .to include(Series25::Organization); end
	it 'assigns to variable profiles'          do; expect(event.profiles)           .to include(Series25::Profile); end
	it 'assigns to variable event_texts'       do; expect(event.event_texts)        .to include(Series25::EventText); end
	it 'assigns to variable categories'        do; expect(event.categories)         .to include(Series25::Category); end
	it 'assigns to variable event_histories'   do; expect(event.event_histories)    .to include(Series25::EventHistory); end
	it 'assigns to variable custom_attributes' do; expect(event.custom_attributes)  .to include(Series25::CustomAttribute); end
	it 'assigns to variable approvals'         do; expect(event.approvals)          .to include(Series25::Approval); end

	describe '#custom_attribute_value' do
		it 'returns value' do
			expect(event.custom_attribute_value(12)).to eq("Jennifer Heatley")
			expect(event.custom_attribute_value(13)).to eq("714-628-7289")
			expect(event.custom_attribute_value(14)).to eq("heatley@chapman.edu")
		end
	end

	describe '#has_recurrences?' do
		context 'with multiple reservations' do
			it 'returns true' do
				expect(Series25::Event.new(recurring_event_xml).has_recurrences?).to eq(true)
			end
		end

		context 'with one reservation' do
			it 'returns false' do
				expect(Series25::Event.new(single_event_xml).has_recurrences?).to eq(false)
			end
		end

		context 'with no reservations' do
			it 'returns false' do
				expect(Series25::Event.new(no_reservations_event_xml).has_recurrences?).to eq(false)
			end
		end
	end

	describe '#event_text' do
		it 'returns the description (id = 1)' do
			expect(event.event_text(1)).to be_a(Series25::EventText)
		end

		it 'cant find the id' do
			expect(event.event_text(400)).to eq(nil)
		end
	end

	describe '#event_text_text' do
		it 'returns the description #1' do
			expect(event.event_text_text(1)).to eq("<strong></strong>50 Year Club Memorial Service<br><p><em>Honor the memory of classmates who are no longer with us at this celebration of life</em></p>")
		end

		it 'returns the event note' do
			expect(event.event_text_text(2)).to eq("One Goose neck mic on lectern for speaking\nChapel table down in front of dais\nChapel lectern down in front of dais\nOne 6' table out for placement by chapel staff")
		end

		it 'cant find the id' do
			expect(event.event_text_text(400)).to eq(nil)
		end
	end

	describe '#requirements' do
		it 'returns an array or requirements' do
			event = Series25::Event.new(event_with_requirements_xml)
			expect(event.requirements).to include(Series25::Requirement)
			expect(event.requirements.size).to eq(6)
		end
	end
end