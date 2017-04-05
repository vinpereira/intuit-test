# Method that replaces spaces with %20
def string_replace(str)
	str.gsub!(' ', '%20')

	str
end


### Testing with RSpec ###
require 'rspec'

describe 'String Replace' do
	it 'replaces all spaces in a string with "%20"' do
		expected_str = 'Estou%20aqui%20tentando%20conseguir%20um%20emprego%20na%20Intuit'

		str = 'Estou aqui tentando conseguir um emprego na Intuit'
		actual_str = string_replace(str)
		
		expect(actual_str).to eq expected_str
	end
end
