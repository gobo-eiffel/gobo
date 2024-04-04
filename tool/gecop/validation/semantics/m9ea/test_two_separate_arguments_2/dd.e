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
			a_b.f (1)
			{EXECUTION_ENVIRONMENT}.sleep (150_000_000)
			a_c.f (1)
		end

end
