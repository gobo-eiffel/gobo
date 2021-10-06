class BB

feature
		
	value: INTEGER
	
	set_value (i: INTEGER)
		do
			value := i
		end

	f
		do
			value := value + 1
			print ("value = " + value.out + "%N")
		end

end
