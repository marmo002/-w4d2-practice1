require 'erb'

kids_data         = File.read('data/kids-data.txt')
invoice_letter    = File.read('templates/invoice_letter.txt.erb')

def toy_price_cal(house_hold)

  result = case house_hold
    when  0..200000
     0
    when 200001..1999999
     100
    when 1000000..1000000000000000000
     1000
    end

  return result

end

kids_data.each_line do |kid|

  kid_data = kid.split

  address1      = kid_data[8] + " " + kid_data[9] + " " + kid_data[10]
  postal_code   = kid_data[11]
  house_hold    = kid_data[12]
  name          = kid_data[0]
  behavior      = kid_data[1]
  toys          = kid_data[2..7]

  toy_price     = toy_price_cal(house_hold.to_i)

  next unless toy_price > 0

  if behavior == "naughty"
    sub_total = toy_price
    toys.clear << "1 defective toy"
  else
    sub_total = toys.map { |toy|
      toy == "Kaleidoscope" ? nil : toy
    }.compact.length * toy_price
  end

  hst = (sub_total * 0.13)
  total = sub_total + hst

  bad_behaviour_message = "P.S. For a limited time get 25% off the best-seller by Ms. Claus, I’m Getting Nothing for Christmas: Raising Toy-Worthy Children in a Device-Driven World."

  filename      = 'letters/invoices/' + name + '.txt'
  letter_text   = ERB.new(invoice_letter, nil, '-').result(binding)

  # puts letter_text
  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
