expanded class CC

inherit

	BB
		redefine
				copy
		end

feature

	copy (other: like Current)
		do
			value := other.value
			print ("CC copied%N")
		end
		
end
