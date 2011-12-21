require 'yaml'
##################################################


def build_pop()
	tribes = {}
	puts "How many tribes in the valley?"
	pop = gets.to_i	
	pop.times do |i|
		this_tribe = {}
		puts "Name?"
		name = gets.chomp()
		this_tribe[:name] = name
		puts "Got it; the honorable #{this_tribe[:name]}"

		strategies = ["Hx", "Do", "Rt", "By", "Pr"]
		
		#puts "Strategy?"
		#strat = gets.chomp()
		strat = strategies[rand(5)]
		this_tribe[:strat] = strat
		case this_tribe[:strat] 
		when "Hx"
			this_tribe[:name] = "\e[31m" + this_tribe[:name]
		when "Do"
			this_tribe[:name] = "\e[36m" + this_tribe[:name]
		when "Rt"
			this_tribe[:name] = "\e[32m" + this_tribe[:name]
		when "By"
			this_tribe[:name] = "\e[33m" + this_tribe[:name]
		else
			this_tribe[:name] = "\e[35m" + this_tribe[:name]
			
		end
		
		puts "Good luck, #{this_tribe[:strat]}"
		
	
		this_tribe[:status] = 0
		
		tribes[i] = this_tribe
		
	end
    return tribes
end

stuff = build_pop()
puts stuff
File.open('tribes.yml', 'w') {|f| f.puts(stuff.to_yaml) }