class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  

  
  def initialize(word)
    @word = word
    @guesses = ""
    @wrong_guesses = ""
  end
  
  def guess(letter)
    #debugger
    if !!(letter =~ /[A-Za-z]/)
   
      letter = letter.downcase
    else
      raise ArgumentError.new('bad letter')
    end
    if @word.include? letter
      if !(@guesses.include? letter)
        @guesses += letter
        return true
      else
        return false
      end
    
    else
      if !(@wrong_guesses.include? letter)
        @wrong_guesses += letter
        return true
      else
        return false
      end
    end
  end
  
  def word_with_guesses
    rtn_str = ''
    word_array = word.chars.to_a
    word_array.each do |x|

      if @guesses.include? x
        rtn_str+=x
      else
        rtn_str+='-'
      end
    end
    return rtn_str
  end
  
  def check_win_or_lose
    word = @word
    new_word = self.word_with_guesses
    if @wrong_guesses.length == 7
      return :lose
    elsif new_word == word
      return :win
    elsif new_word.include? '-'
      return :play
    end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  


end
