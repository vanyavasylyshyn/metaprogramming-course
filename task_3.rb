puts 'Exercise: Build custom DSL to generate HTML'

class HTML
  def initialize

  end

  def to_s

  end
end

html = HTML.new do
  h2 "Why is Arbre awesome?"

  ul do
    li "The DOM is implemented in ruby"
    li "You can create object oriented views"
    li "Templates suck"
  end
end

puts html.to_s