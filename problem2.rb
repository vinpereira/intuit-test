# Stack class - My design uses an array with limited actions
class Stack
	def initialize
		@stack = []
	end

	def push(element)
		if element.is_a? Integer
			@stack.push(element)

			@stack
		else
			exit(false) # Exit if element is not an Integer
		end
	end

	def pop
		@stack.pop

		@stack
	end

	def min
		@stack.min
	end

	# Method that print an array as a sequence of integer numbers
	def show
		@stack.join(' ')
	end
end # end-class


### Testing with RSpec ###
require 'rspec'

describe 'Stack test' do
	# Using before(:all) with caution... I thought about it ;)
	before(:all) do
		@stack_test = Stack.new
	end

	it 'push a not Integer element should break' do
		begin
			@stack_test.push(2.5)
		rescue SystemExit => e
			expect(e.status).to eq 1
		end
	end

	it 'pushes some elements to stack' do
		@stack_test.push(3)
		@stack_test.push(6)
		@stack_test.push(1)
		@stack_test.push(8)

		expect(@stack_test.show).to eq '3 6 1 8'
	end

	it 'should have min equal to 1' do
		expect(@stack_test.min).to eq 1
	end

	it 'should pop a couple of elements' do
		2.times { @stack_test.pop }

		expect(@stack_test.show).to eq '3 6'
	end

	it 'should have min equal to 3' do
		expect(@stack_test.min).to eq 3
	end
end # end-describe
