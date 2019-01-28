require 'erb'

kids_data         = File.read('data/kids-data.txt')
naughty_letter    = File.read('templates/naughty_sample_letter.txt.erb')

kids_data.each_line do |kid|

  kid_data = kid.split

  name        = kid_data[0]
  behavior    = kid_data[1]
  toys        = kid_data[2..7]

  next unless behavior == "naughty"

  infraction   = kid.split('|')[-1].strip
  picked_toy   = toys.delete(toys.sample)
  kaleidoscope = toys.delete('Kaleidoscope')

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  # puts letter_text
  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
