# player_guess.rb
# frozen_string_literal: true

class PlayerGuess
  def initialize
    @player_guess = player_guess
  end

  def player_guess
    print 'Input letter: '
    gets.chomp.downcase
  end
end
