puts 'Exercise 1: Implement Object.tap method'

class Object
  def tap
    yield self if block_given?

    self
  end
end

(1..10)                     .tap {|x| puts "original: #{x.inspect}"}         # original: 1..10
       .to_a                .tap {|x| puts "array: #{x.inspect}"}            # array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
       .select {|x| x%2==0} .tap {|x| puts "evens: #{x.inspect}"}            # evens: [2, 4, 6, 8, 10]
       .map {|x| x*x}       .tap {|x| puts "squares: #{x.inspect}"}          # squares: [4, 16, 36, 64, 100]

puts
puts 'Exercise 2: Improve Object.tap method'

class Object
  def tap(&block)
    instance_eval &block # instance_eval { block.call } - not working

    self
  end
end

class MyClass
  def initialize
    @var = "instance var"
  end

  def foo
    "MyClass#foo"
  end
end

obj = MyClass.new
result = obj.tap { puts "Variable: #{@var}" }.foo  # Outputs: "Variable: instance var" and returns: "MyClass#foo"
puts result