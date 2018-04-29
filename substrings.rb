def substrings(message, dictionary)
  result_hash = {}
  message_words = message.downcase.gsub(/[^\w\s]/,'').split(' ')
  message_words.each do |message_word|
    dictionary.each do |dictionary_word|
      dictionary_word.downcase!
      dictionary_word.gsub!(/[^\w\s]/,'')
      (1 + message_word.length - dictionary_word.length).times do |i|
        if message_word[i, dictionary_word.length] == dictionary_word
          if result_hash.key?(dictionary_word)
            result_hash[dictionary_word] += 1
          else
            result_hash[dictionary_word] = 1
          end
        end
      end
    end
  end
  
  result_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)