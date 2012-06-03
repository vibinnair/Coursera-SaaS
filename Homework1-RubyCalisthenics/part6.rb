class CartesianProduct
	include Enumerable
	
	def initialize(sequence1, sequence2)
		@sequence1 = sequence1
		@sequence2 = sequence2
	end	
	
	def each
		products = @sequence1.product(@sequence2)
		
		products.each{ |product|
			yield product
		} 
	end
end


#c = CartesianProduct.new([:a,:b], [1,2,3,4,5])
#c.each {|elt| p elt}
