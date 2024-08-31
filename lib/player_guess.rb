# player_guess.rb
# frozen_string_literal: true

class PlayerGuess
  def player_guess
    print 'Input letter: '
    input = gets.chomp.downcase.delete('^a-zA-Z')

    if input == 'exitgame'
      puts "\nThank you for playing!\n\n"
      exit
    elsif %w[savegame loadgame].include?(input)
      input
    elsif input.length > 1
      puts "\nInput should be one letter. Please try again.\n\n"
      player_guess
    else
      input
    end
  end
end
