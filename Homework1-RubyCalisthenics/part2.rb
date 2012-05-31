class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	raise NoSuchStrategyError unless game[0][1] =~  /[PSR]/i && game[1][1] =~ /[PSR]/i
	
	game[0][1] if game[0][1] == 'P' && game[1][1] == 'R' #but then what if [0][1] is R and [1][1] is P
	
	 		
	
end	

rps_game_winner([ [ "Armando", "S" ], [ "Dave", "P" ] ])




#	game.each do |player|
#		 	raise NoSuchStrategyError unless player[1] =~ /[PSR]/i
#	end


#winner = game.select { |player|
#					
#			 }
#	print winner
