class Player
  attr_accessor :name , :life_point

  	def initialize(name)
		@name = name
		@life_point = 10
	end

	def show_stats
		puts "#{@name} a #{life_point} de vie !"
	end
	def gets_damage(beat)
		@life_point = @life_point - beat

		if life_point <= 0
			puts "#{@name} a été tué !"
		end

	end
	
	def compute_damage
    return rand(1..6)
  	end
	
	def attacks(player) 
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damage = compute_damage
    puts "il lui inflige #{damage} points de dommages"
    player.gets_damage(damage)
  	end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

	def initialize(name)
    super(name)
      @life_point = 100
      @weapon_level = 1
    end
 
	def show_state
   		return "#{@name} a #{@life_point} points de vie et une arme de niveau #{weapon_level}"
	end

	def compute_damage
    	rand(1..6) * @weapon_level
	end

	def search_weapon
    weapon_level_new = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level_new}"

    	if weapon_level_new > @weapon_level
      @weapon_level = weapon_level_new
      puts "YOUHOU ! elle est meilleure que ton arme actuelle : tu la prends."
    	else
      puts "MERDE... elle n'est pas mieux que ton arme actuelle..."
    	end
  	end

  	def search_health_pack
    health_pack = rand(1..6)

    	if health_pack == 1
      puts "Tu n'as rien trouvé... "
    		elsif health_pack.between?(2, 5)
      @life_point += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    		elsif
      @life_point += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    	end

    	if @life_point > 100
      @life_point = 100
    	end
  end

end