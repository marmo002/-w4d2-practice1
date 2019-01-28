require 'erb'

price = 8.75

line_1 = "Bill: That will cost you $<%= price %> plus taxes, ma'am."
line_2 = "Pritma: How much is it with taxes?"
line_3 = "Bill: That will be $<%= (price * 1.13).round 2 %> ma'am!."

line_1_erb_instance = ERB.new(line_1)

puts
puts line_1_erb_instance.result
puts
puts line_2
puts
puts ERB.new(line_3).result
puts
