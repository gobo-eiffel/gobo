expanded class DD

inherit

	CC
		redefine
			copy
		end

feature

	copy (other: like Current)
		do
			value := other.value
			print ("DD copied%N")
		end
		
end
