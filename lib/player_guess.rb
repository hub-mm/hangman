# player_guess.rb
# frozen_string_literal: true

class PlayerGuess
  def initialize
    @player_guess = player_guess
  end

  def player_guess
    print 'Input word: '
    gets.chomp.downcase
  end
end

word = PlayerGuess.new
