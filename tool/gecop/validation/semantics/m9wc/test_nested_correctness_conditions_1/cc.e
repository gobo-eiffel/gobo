class CC

create

	make

feature

	make
		do
		end

	is_valid (b: BB): BOOLEAN
		require
			bar: b.is_valid (Current)
		do
			Result := True
			print ("CC.is_valid: ")
			print (Result)
			print ("%N")
		end

end