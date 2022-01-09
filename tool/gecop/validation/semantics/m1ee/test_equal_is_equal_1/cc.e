expanded class CC

inherit

	ANY
		redefine
			is_equal
		end

create

	default_create,
	make
	
feature

	make (i: INTEGER)
		do
			value := i
		end
		
	value: INTEGER
	
	is_equal (a_other: like Current): BOOLEAN
		do
			print ("# CC.is_equal%N")
			Result := value = a_other.value
		end

end
