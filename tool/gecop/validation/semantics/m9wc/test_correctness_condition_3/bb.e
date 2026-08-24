class BB

create

	make

feature

	make
		do
		end

	is_valid: BOOLEAN
		do
			Result := value > 0
			print ("BB.is_valid: ")
			print (Result)
			print ("%N")
		end

	value: INTEGER

	set_value (a: INTEGER)
		do
			value := a
		end

	f
		do
			print ("BB.f%N")
		end

	g
		do
			print ("BB.g%N")
		end

	h
		do
			print ("BB.h%N")
		end

end
