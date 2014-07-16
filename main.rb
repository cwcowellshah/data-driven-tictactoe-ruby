require_relative 'big_data'
require_relative 'board'
require_relative 'controller'

TRAINING_GAMES = 1000

if __FILE__ == $0
  big_data = BigData.new
  controller = Controller.new
  TRAINING_GAMES.times do
    board = Board.new
    controller.play(board, big_data)
  end
  puts "Trained on #{TRAINING_GAMES} games."
  puts "BigData has #{big_data.get_big_data_one_player(:X).num_boards} boards for X and #{big_data.get_big_data_one_player(:O).num_boards} boards for Y."
end
