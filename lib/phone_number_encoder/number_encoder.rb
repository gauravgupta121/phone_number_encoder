module PhoneNumberEncoder

  class NumberEncoder

    extend Memoist

    FILE_PATH = File.join(File.dirname(__FILE__), '../../files/dictionary.txt')

    CORRESPONDING_LETTERS = {
      2 => ['a','b','c'],
      3 => ['d','e','f'],
      4 => ['g','h','i'],
      5 => ['j','k','l'],
      6 => ['m','n','o'],
      7 => ['p','q','r','s'],
      8 => ['t','u','v'],
      9 => ['w','x','y','z']
    }

    def encoded_words(number)
      return validation_message unless valid_number?(number)
      number = number.to_s
      final_solution = [] 
      all_10_word_combination = possible_words(number.to_i) & dictionary
      total_combinations(number).each do |word_array|
        word_array.tap do |x,y,z|
          first_array = possible_words(x.to_i) & dictionary
          second_array = possible_words(y.to_i) & dictionary
          first_array = first_array.product(second_array)
          if z
            third_array = possible_words(z.to_i) & dictionary
            first_array = first_array.product(third_array).select{|t| t.flatten!}
          end
          final_solution.concat(first_array)
        end
      end
      final_solution << all_10_word_combination
    end

    private

    def dictionary
      File.readlines(FILE_PATH).map{ |w| w.strip }
    end
    memoize :dictionary

    def three_word_combinations
      [3,3,4].permutation(3).to_a.uniq
    end

    def two_word_combinations
      combinations = []
      (3..7).each do |index|
        [].tap do |array|
          array << index
          array << 10 - index
          combinations << array
        end
      end
      combinations
    end

    def total_combinations(word)
      formatted_digits = []
      three_word_combinations.concat(two_word_combinations).each do |x,y,z|
        [].tap do |array|
          array << word[0..x-1]
          array << word[x..x+y-1]
          array << word[x+y..x+y+z-1] if z
          formatted_digits << array
        end
      end
      formatted_digits
    end

    def possible_words(number)
      array_1 = number_to_characters(number)
      combo_1 = array_1[0].product(*array_1[1..array_1.length]).map(&:join)
      combinations = []
      combo_1.each do |word|
        combinations << word.upcase
      end
      combinations
    end

    def number_to_characters(number)
      number.digits.reverse.map{ |digit| CORRESPONDING_LETTERS[digit] }
    end

    def valid_number?(number)
      number.is_a?(Integer) &&
      number > 0 &&
      number.to_s.length == 10 &&
      (number.digits & [0, 1]).empty?
    end

    def validation_message
      'Please input correct Number'
    end

  end

end