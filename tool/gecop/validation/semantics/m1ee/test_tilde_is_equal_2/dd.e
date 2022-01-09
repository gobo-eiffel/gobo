class DD

inherit

	CC
		redefine
			is_equal
		end

create

	make
	
feature
	
	is_equal (a_other: like Current): BOOLEAN
		do
			print ("# DD.is_equal%N")
			Result := value = a_other.value
		end

end
