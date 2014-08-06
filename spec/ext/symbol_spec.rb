require 'spec_helper'

describe Symbol do
	describe '.to_underscored_s' do
		it 'underscores and converts to string' do
			expect(:Series25.to_underscored_s).to eq('series25')
			expect(:JamesAndrewKerr.to_underscored_s).to eq('james_andrew_kerr')
			expect(:SpacePref.to_underscored_s).to eq('space_pref')
		end
	end
end