class BB

create

	make

feature

	make
		do
		end

	g: INTEGER
		do
			{EXECUTION_ENVIRONMENT}.sleep (200_000_000)
			print ("End of BB.g%N")
			Result := 5
		end

	h
		do
			{EXECUTION_ENVIRONMENT}.sleep (200_000_000)
			print ("End of BB.h%N")
		end

end
