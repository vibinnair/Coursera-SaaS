class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	
	player1 = game[0]
	player2 = game[1] 	
	player1_strategy = game[0][1]
	player2_strategy = game[1][1]
	#list of against whom can a person loose. i.e s can only loose against r, p can only loose against s and r can only loose against p  
	can_only_loose_against_rule = {:s => :r, :p => :s, :r => :p} 
	
	raise NoSuchStrategyError unless player1_strategy =~  /[PSR]/i && player2_strategy =~ /[PSR]/i
	
	if(player1_strategy == player2_strategy)
		player1
	elsif (player1_strategy.downcase.to_sym == can_only_loose_against_rule[player2_strategy.downcase.to_sym]) #Checking if player1 is the person against whom player2 can loose  
		player1
	else
		player2	
	end  	
end	


def rps_tournament_winner(tournament)
	
	while true do
		tournament	= tournament.flatten
	
		if(tournament.length > 4) then
			tournament = tournament.each_slice(2).each_slice(2).to_a
			tournament = tournament.map{|game| rps_game_winner(game)}
		else
			game = tournament.each_slice(2).to_a
			return rps_game_winner(game)
		end
	end			
end	
