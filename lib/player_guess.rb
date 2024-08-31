# player_guess.rb
# frozen_string_literal: true

# Class setup to take care and manage player input.
class PlayerGuess
  # rubocop: disable Metrics/MethodLength
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
  # rubocop: enable Metrics/MethodLength
end
