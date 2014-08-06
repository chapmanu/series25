require 'spec_helper'

describe String do
	describe '#plural' do
		it 'pluralizes special words' do
			expect('event'.plural).to eq('events')
			expect('category'.plural).to eq('categories')
			expect('idiot'.plural).to eq('idiots')
			expect('event_history'.plural).to eq('event_histories')
		end
	end

	describe '#series25_object?' do
		context 'series25 class def exists' do
			it 'returns true' do
				expect('event'.series25_object?).to eq(true)
				expect('category'.series25_object?).to eq(true)
				expect('resource_pref'.series25_object?).to eq(true)
				expect('profile'.series25_object?).to eq(true)
				expect('takedown_profile'.series25_object?).to eq(true)
			end
		end
		context 'series25 class does not exists' do
			it 'returns false' do
				expect('awesome_event'.series25_object?).to eq(false)
			end
		end
	end

	describe '#to_class' do
		it 'creates a class constant from a string' do
			expect('event'.to_class).to eq(Series25::Event)
			expect('Category'.to_class).to eq(Series25::Category)
			expect('takedown_profile'.to_class).to eq(Series25::TakedownProfile)
		end
	end
end