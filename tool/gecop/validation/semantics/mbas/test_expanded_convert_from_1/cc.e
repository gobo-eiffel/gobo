expanded class CC

inherit

	ANY
		redefine
			copy
		end
		
create

	default_create,
	make_from_b
	
convert

	make_from_b ({BB})

feature

	make_from_b (b: BB)
		do
			value := 8
			print ("converted from BB%N")
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
			print ("CC copied%N")
		end

end
