expanded class EE

inherit

	ANY
		redefine
			copy
		end

feature
		
	value: INTEGER
	
	set_value (i: INTEGER)
		do
			value := i
		end

	copy (other: like Current)
		do
			value := other.value
			print ("EE copied%N")
		end
		
end
