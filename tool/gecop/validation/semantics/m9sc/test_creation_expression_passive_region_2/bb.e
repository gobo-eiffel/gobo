class BB

create

	make

feature

	make
		do
			attr := 1
			{EXECUTION_ENVIRONMENT}.sleep (500_000_000)
			print ("End of BB.make%N")
		end

	f: BOOLEAN
		do
			print ("B.invariant%N")
			Result := attr > 0
		end

	attr: INTEGER

invariant

	f

end
