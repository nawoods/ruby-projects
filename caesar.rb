def caesar_cipher(message, shift)
  shift = shift % 26
  return_message = ""
  message.each_byte do |c|
    if (c >= 97 && c <= 122)
      max = 122
      c += shift
    elsif (c >= 65 && c <= 90)
      max = 90
      c += shift
    else
      max = 200
    end
    
    if c > max
      c -= 26
    end
    
    return_message += c.chr
  end
  return_message
end

puts caesar_cipher("Hello there!", 13)
puts caesar_cipher("Uryyb gurer!", 13)
puts caesar_cipher("~*~*good*~*~", 28)
puts caesar_cipher("~*~*iqqf*~*~", -28)