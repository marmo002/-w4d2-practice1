
def card_count(string)

  # if string.length > 52
  #   return false
  # end
  return false unless string.length < 52

  cards = string.chars

  count = 0
  heights = 0
  lows = 0

  cards.each do |card|

    case card
    when /[TJKQA]/
      count -= 1
      heights += 1
    when /[23456]/
      count += 1
      lows += 1
    end

    if heights > 4 || lows > 4
      puts "casino is cheating"
      return false
    end

  end

  count
end

puts card_count('K2T6AAAAA')
puts "-------------------"
puts card_count('798TT23')
puts "-------------------"
puts card_count('235T2')
puts "-------------------"
