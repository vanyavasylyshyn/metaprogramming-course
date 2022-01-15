puts 'Exercise: Implement Struct class from Standard Ruby Library'

class ConStruct
  def self.new(*constructor_args, &block) # not working with initialize
    Class.new do
      define_method 'initialize' do |*args|
        constructor_args.each_with_index do |key, index|
          instance_variable_set("@#{key}", args[index])
        end
      end

      define_method '[]' do |key|
        instance_variable_get( "@#{key}")
      end

      define_method '[]=' do |key, value|
        instance_variable_set( "@#{key}", value)
      end

      # attr_accessor *constructor_args
      constructor_args.each do |key|
        define_method "#{key}" do
          instance_variable_get( "@#{key}")
        end

        define_method "#{key}=" do |value|
          instance_variable_set( "@#{key}", value)
        end
      end

      if block_given?
        class_eval &block
      end
    end
  end
end

Product = ConStruct.new(:id, "name") do
  def to_s
    "<#{self.class} id:#{id} name:'#{name}'>"
  end
end

obj = Product.new(123, "Ruby Book")

puts 'Task 1'
puts obj.name                                # => "Ruby Book"
puts obj["name"] = "Ruby Video Course"       # => "Ruby Video Course"
puts obj[:name]                              # => "Ruby Video Course"

puts 'Task 2'
puts Product.new(123, "Ruby Book").to_s