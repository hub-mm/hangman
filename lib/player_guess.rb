# player_guess.rb
# frozen_string_literal: true

class PlayerGuess
  def player_guess
    print 'Input letter: '
    gets.chomp.downcase
  end
end
