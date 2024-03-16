class EE

create

	make

feature

	make (a_b: separate BB; a_c: separate CC)
		do
			b := a_b
			c := a_c
		end
	
	b: separate BB

	c: separate CC

	g
		do
			f (b, c)
		end

	f (a_b: separate BB; a_c: separate CC)
		do
			{EXECUTION_ENVIRONMENT}.sleep (25_000_000)
			print ("EE start f%N")
			{EXECUTION_ENVIRONMENT}.sleep (25_000_000)
			a_c.f (2)
			{EXECUTION_ENVIRONMENT}.sleep (25_000_000)
			print ("EE middle f%N")
			{EXECUTION_ENVIRONMENT}.sleep (25_000_000)
			a_b.g ("EE")
			{EXECUTION_ENVIRONMENT}.sleep (150_000_000)
			print ("EE end f%N")
		end

end
