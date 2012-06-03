#Concepts used : metaprogramming - adding accessors (getter/setter) using metaprogramming 
class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s
		attr_reader attr_name
		attr_reader attr_name + "_history"
		class_eval %Q{
						def #{attr_name}=(value)
							@#{attr_name} = value
							
							if @#{attr_name}_history.nil?
								@#{attr_name}_history = Array.new
								@#{attr_name}_history << nil	
							end
							@#{attr_name}_history << value
						end
					}
	end
end 

class Foo
	attr_accessor_with_history :bar
end


#Concepts used : open classes, method_missing 
class Numeric
	@@currency_conversion_table = 
				   {
					 'dollar' => {'dollar' => 1,'yen' => 79, 'euro' => 78, 'rupee' => 55}, # i.e 1 dollar = 79 yen and so on..
					 'yen'=> {'dollar'=> 0.013 ,'yen' => 1, 'euro' => 0.0103, 'rupee' => 0.713},
					 'euro'=> {'dollar' => 1.292,'yen' => 96.95, 'euro' => 1, 'rupee' => 68.01},
					 'rupee'=> {'dollar'=> 0.019,'yen' => 1.45, 'euro' => 1.404, 'rupee' => 1} # i.e 1 rupee = 0.019 dollar and so...
					}
	
	
	def method_missing(method_id)
		@from_currency = method_id.to_s.gsub(/s$/,'')
		
		if @@currency_conversion_table.has_key?(@from_currency)
			self
		else
			super
		end
	end
	
	def in(currency)
		to_currency = currency.to_s.gsub(/s$/,'')			
		currency_conversion = @@currency_conversion_table[@from_currency]
		self * currency_conversion[to_currency]
	end	
end


#Concepts used : open classes
class String
	def palindrome?
		words = self.gsub(/\W/, '').downcase
		words == words.reverse
	end
end


#Concepts used : mixin
module Enumerable
	def palindrome?
		values = self.to_a       # no mater what enumerable you get, first convert it to array, so that we can use the reverse method
		values == values.reverse		
	end
end
