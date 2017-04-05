# Intuit Test

Three problems from an Intuit job test

## Problem 1
Write a method to replace all spaces in a string with ‘%20’

## Problem 2
How would you design a stack which, in addition to push and pop, also has a function min which returns the lowest integer value in the list.? Push, pop and min should all operate in O(1) time. The values in the stack are integers.


## Problem 3
Imagine a (literal) stack of plates. If the stack gets too high, it might topple. Therefore, in real life, we would likely start a new stack when the previous stack exceeds some threshold. Implement a data structure SetOfStacks that mimics this. SetOfStacks should be composed of several stacks, and should create a new stack once the previous one exceeds capacity. SetOfStacks.push() and SetOfStacks.pop() should behave identically to a single stack (that is, pop() should return the same values as it would if there were just a single stack).

# Programming Language and libraries used to solve the problems

  - Ruby 2.4.0 @ Ubuntu 16.10 64-bits

Main libraries:
  - rspec 3.5.0

### Running the codes
Each problem has its own file. So I created problem1.rb, problem2.rb, and problem3.rb

- Execute the following codes in the project's root folder
```sh
$ rspec problem1.rb
```

```sh
$ rspec problem2.rb
```

```sh
$ rspec problem3.rb
```
