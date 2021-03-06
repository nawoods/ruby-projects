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

    c -= 26 if c > max
    return_message += c.chr
  end
  return_message
end