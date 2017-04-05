# Stack class
class Stack < Struct.new(:next, :data)
end

# SetOfStack class - It control N stacks
class SetOfStacks
  	attr_reader :limit, :stack_set_count

  	def initialize(limit)
	    @limit = limit
	    @stack = nil
	    @stack_set = []
	    @stack_set_count = 0
	    @stack_elements = 0
  	end

  	def push(data)
    	@stack = check_which_stack_to_push

	    unless @stack.nil?
    	  	@stack = Stack.new(@stack, data)
    	else
      		@stack_set_count += 1
      		@stack = Stack.new(nil,data)
    	end

    	@stack_elements += 1

    	@stack
  	end

	def pop
	    @stack = check_which_stack_to_pop(@limit)

	    return nil if @stack.nil?

	    result = @stack.data
	    @stack = @stack.next
	    @stack_elements -= 1

	    result
	end

	def top
    	@stack.data
  	end

	private

	def check_which_stack_to_push
	    if @stack_elements == @limit
		    @stack_set[@stack_set_count] = @stack
	    	@stack = nil
	       	@stack_elements = 0
	    end

	    @stack
	end

  	def check_which_stack_to_pop(limit)
    	if @stack_elements == 0
      		@stack_set_count -= 1
      		@stack = @stack_set[@stack_set_count]
      		@stack_elements = limit
    	end

    	@stack
  	end
end # end-class


### Testing with RSpec ###
require 'rspec'

describe SetOfStacks do
  	before do
    	@stack_test = SetOfStacks.new(5)
  	end

  	it "creates a new stack" do
    	expect(@stack_test.limit).to eq 5
  	end

  	it "adds a new element to the stack" do
    	@stack_test.push(3)

	    expect(@stack_test.top).to eq 3
  	end

  	it "adds four elements to the stack" do
    	@stack_test.push(3)
    	@stack_test.push(2)
    	@stack_test.push(7)
    	@stack_test.push(1)

    	expect(@stack_test.top).to eq 1
  	end

  	it "adds a new stack when elements greater than limit" do
    	@stack_test.push(3)
    	@stack_test.push(2)
    	@stack_test.push(7)
    	@stack_test.push(1)
    	@stack_test.push(6)
    	@stack_test.push(9)

    	expect(@stack_test.top).to eq 9
    	expect(@stack_test.stack_set_count).to eq 2
  	end

  	it "pop out the last element from stack" do
    	@stack_test.push(5)

    	expect(@stack_test.pop).to eq 5
  	end

  	it "returns nil when pop out all elements from stack" do
    	@stack_test.push(3)
    	@stack_test.push(2)
    	@stack_test.push(7)
    	@stack_test.push(1)

    	4.times { @stack_test.pop }

    	expect(@stack_test.pop).to be_nil
  	end
end # end-describe
