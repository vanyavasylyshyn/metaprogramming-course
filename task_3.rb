puts 'Exercise: Build custom DSL to generate HTML'

class HTML < BasicObject
  def initialize(&block)
     @html = ""

     instance_eval(&block)
  end

  def to_s
    @html
  end

  private

  def method_missing(tag, *args, &block)
    properties = ""

    properties = args.shift.map { |p| p.join("=") } * " " if args.first.is_a? ::Object::Hash

    @html << "<#{tag} #{properties}>"
    if block
      instance_eval(&block)
    else
      @html << "#{args.first}"
    end
    @html << "</#{tag}>"
  end
end

html = HTML.new do
  h2 "Why is Arbre awesome?"

  ul id: "nav", class: "list" do
    li "The DOM is implemented in ruby"
    li "You can create object oriented views"
    li "Templates suck"
    p "Same shiiiit every day"
  end
end

puts html.to_s