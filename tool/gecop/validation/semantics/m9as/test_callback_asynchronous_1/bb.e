class BB

create

	make

feature

	make (a: separate AA)
		do
			attr := a
		end
	
	attr: separate AA

	g
		do
			{EXECUTION_ENVIRONMENT}.sleep (1_000_000_000)
			separate attr as a do
				a.h
			end
			print ("End of BB.g%N")
		end

end
