class BB

create

	make

feature

	make (a: separate STRING)
		do
			attr := 1
			{EXECUTION_ENVIRONMENT}.sleep (1_000_000_000)
			print ("End of B.make%N")
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
