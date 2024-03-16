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
			{EXECUTION_ENVIRONMENT}.sleep (25_000_000)
			f (b, c)
		end

	f (a_b: separate BB; a_c: separate CC)
		do
			print ("DD start f%N")
			a_b.f ("DD")
			print ("DD middle f%N")
			a_c.f ("DD")
			print ("DD end f%N")
		end

end
