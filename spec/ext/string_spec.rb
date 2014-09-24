require 'spec_helper'

describe String do
	describe '#s25_pluralize' do
		it 'pluralizes special words' do
			expect('event'.s25_pluralize).to eq('events')
			expect('category'.s25_pluralize).to eq('categories')
			expect('idiot'.s25_pluralize).to eq('idiots')
			expect('event_history'.s25_pluralize).to eq('event_histories')
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

	describe '#to_s25_class' do
		it 'creates a class constant from a string' do
			expect('event'.to_s25_class).to eq(Series25::Event)
			expect('Category'.to_s25_class).to eq(Series25::Category)
			expect('takedown_profile'.to_s25_class).to eq(Series25::TakedownProfile)
		end
	end

	describe '#s25_singularize' do
		it 'singularizes properly' do
			expect('events'.s25_singularize).to eq('event')
			expect('categories'.s25_singularize).to eq('category')
			expect('idiots'.s25_singularize).to eq('idiot')
			expect('event_histories'.s25_singularize).to eq('event_history')
		end
	end
end