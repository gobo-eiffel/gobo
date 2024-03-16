class DD

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
			print ("DD start f%N")
			{EXECUTION_ENVIRONMENT}.sleep (50_000_000)
			a_b.f (1)
			print ("DD middle f%N")
			{EXECUTION_ENVIRONMENT}.sleep (50_000_000)
			a_c.g ("DD")
			{EXECUTION_ENVIRONMENT}.sleep (150_000_000)
			print ("DD end f%N")
		end

end
