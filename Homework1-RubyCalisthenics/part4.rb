class Dessert
	def initialize(name, calories)
		@name = name
		@calories = calories
	end

	def name
		@name
	end
	
	def name= value
		@name = value
	end
	
	def calories
		@calories
	end
	
	def calories= value
		@calories = value
	end
	
	def healthy?
		if @calories < 200 then
			true
		else
			false
		end		
	end		
	
	def delicious?
		true
	end	
end


class JellyBean < Dessert
	def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor
	end

	def flavor
		@flavor
	end
	
	def flavor= value
		@flavor = value
	end
	
	def delicious?
		if @flavor.downcase == "black licorice" then
			false
		else
			true
		end	
	end
end
