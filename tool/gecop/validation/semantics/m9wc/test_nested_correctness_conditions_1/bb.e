class BB

create

	make

feature

	make
		do
		end

	is_valid (c: CC): BOOLEAN
		require
			foo: c.is_valid (Current)
		do
			Result := True
			print ("BB.is_valid: ")
			print (Result)
			print ("%N")
		end

end
