class Game
  attr_accessor :HumanPlayer , :Enemies

  def initialize (humanplayer)
    @humanplayer = HumanPlayer.new("#{humanplayer}",100,1)
    @player_1 = Player.new("Toliara", 10)  
    @player_2 = Player.new("Tamatave", 10)
    @player_3 = Player.new("Mahajanga", 10)  
    @player_4 = Player.new("Antsiranana", 10)
    @ennemies = [@player_1, @player_2, @player_3, @player_4]
	end

 def kill_player
    @ennemies.each { |player| 
    if (player.life_point <= 0)
      @ennemies.delete(player)
      puts "#{player.name} est mort"
    end
    } 
  end

   def is_still_ongoing?
    if @humanplayer.life_point > 0 && (@player_1.life_point > 0 || @player_2.life_point > 0 || @player_3.life_point > 0 || @player_4.life_point > 0)
      return true
    else
      return false
    end
  end
  def show_players
    puts
    @humanplayer.show_stats
    puts "2) #{@ennemies.size} enemies encore entrain de s'entretuer"
    puts
  end
   def menu
    command = 1
    puts "Que veux-tu faire ?"
    puts "a - chercher une meilleur arme"
    puts "s - se soigner"
    puts
    puts "Attaquer un enemies :"
    @ennemies.each {
    |player| puts "#{command} - #{player.name} a #{player.life_point} vies"
    command += 1
     }
        
  end
   def menu_choice(action)
    if action == "a"
      @humanplayer.search_weapon
        elsif action == "s"
      @humanplayer.search_health_pack
        elsif action == "1"
      @humanplayer.attack(@player_1)
        elsif action == "2"
      @humanplayer.attack(@player_2)
        elsif action == "3"
      @humanplayer.attack(@player_3)
        elsif action == "4"
      @humanplayer.attack(@player_4)
        else puts "Choisir une option a, s, 1, 2, 3 or 4"
    end
    
      kill_player
  end

   def enemies_attack 
    puts "Attack !"
      @ennemies.each { 
      |player| player.attack(@humanplayer)
        }
  end
def end
    if humanplayer.life_points > 0
      puts "Tu as gagné !"
    elsif humanplayer.life_points < 0
      puts "Bois un peu d'eau"
    end
  puts
  puts "Jeu terminé"
  puts
  end

 end