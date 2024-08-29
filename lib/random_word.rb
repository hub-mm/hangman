# random_word.rb
# frozen_string_literal: true

class RandomWord
  def initialize
    @random_word_file = File.readlines('google-10000-english-no-swears.txt')
    # @random_word = select_random_word
  end

  def select_random_word
    array_random_index = Array(0..10_000)

    loop do
      random_index = array_random_index.sample
      random_word = @random_word_file[random_index]

      if random_word.length.nil?
        select_random_word
      elsif random_word.length > 4 && random_word.length <= 12

        puts "#{random_word}"

        return random_word
      end
    end
  end
end
