require 'spec_helper'

describe Series25::Event do
	subject(:event) { Series25::Event.new(event_xml) }
	it 'tests things' do
		puts event
	end

	it 'assigns to variable event_id'          do; expect(event.event_id)           .to_not eq(nil); end
	it 'assigns to variable event_name'        do; expect(event.event_name)         .to_not eq(nil); end
	it 'assigns to variable alien_uid'         do; expect(event.alien_uid)          .to_not eq(nil); end
	it 'assigns to variable event_priority'    do; expect(event.event_priority)     .to_not eq(nil); end
	it 'assigns to variable event_title'       do; expect(event.event_title)        .to_not eq(nil); end
	it 'assigns to variable favorite'          do; expect(event.favorite)           .to_not eq(nil); end
	it 'assigns to variable node_type'         do; expect(event.node_type)          .to_not eq(nil); end
	it 'assigns to variable node_type_name'    do; expect(event.node_type_name)     .to_not eq(nil); end
	it 'assigns to variable start_date'        do; expect(event.start_date)         .to_not eq(nil); end
	it 'assigns to variable end_date'          do; expect(event.end_date)           .to_not eq(nil); end
	it 'assigns to variable event_type_id'     do; expect(event.event_type_id)      .to_not eq(nil); end
	it 'assigns to variable event_type_name'   do; expect(event.event_type_name)    .to_not eq(nil); end
	it 'assigns to variable state'             do; expect(event.state)              .to_not eq(nil); end
	it 'assigns to variable state_name'        do; expect(event.state_name)         .to_not eq(nil); end
	it 'assigns to variable version_number'    do; expect(event.version_number)     .to_not eq(nil); end
	it 'assigns to variable event_locator'     do; expect(event.event_locator)      .to_not eq(nil); end
	it 'assigns to variable parent_id'         do; expect(event.parent_id)          .to_not eq(nil); end
	it 'assigns to variable cabinet_id'        do; expect(event.cabinet_id)         .to_not eq(nil); end
	it 'assigns to variable cabinet_name'      do; expect(event.cabinet_name)       .to_not eq(nil); end
	it 'assigns to variable registration_url'  do; expect(event.registration_url)   .to_not eq(nil); end
	it 'assigns to variable last_mod_user'     do; expect(event.last_mod_user)      .to_not eq(nil); end
	it 'assigns to variable last_mod_dt'       do; expect(event.last_mod_dt)        .to_not eq(nil); end
	it 'assigns to variable creation_dt'       do; expect(event.creation_dt)        .to_not eq(nil); end
	it 'assigns to variable organizations'     do; expect(event.organizations)      .to_not eq(nil); end
	it 'assigns to variable profiles'          do; expect(event.profiles)           .to_not eq(nil); end
	it 'assigns to variable event_texts'       do; expect(event.event_texts)        .to_not eq(nil); end
	it 'assigns to variable categories'        do; expect(event.categories)         .to_not eq(nil); end
	it 'assigns to variable event_histories'   do; expect(event.event_histories)    .to_not eq(nil); end
	it 'assigns to variable custom_attributes' do; expect(event.custom_attributes)  .to_not eq(nil); end
	it 'assigns to variable approvals'         do; expect(event.approvals)          .to_not eq(nil); end
end