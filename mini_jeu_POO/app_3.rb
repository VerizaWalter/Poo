require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " -------------------------- "
puts "|  Super jeu Poo M/car     |"
puts " -------------------------- "


puts 'Entrez votre nom'
puts name_player = gets.chomp
my_game = Game.new(name_player)

while my_game.is_still_ongoing? == true do

  my_game.show_players
  my_game.menu
  puts "select your action choice"
  action = gets.chomp.to_s
  puts
  my_game.menu_choice(action)
  my_game.enemies_attack
end

my_game.end
