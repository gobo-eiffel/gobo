class BB

create

	make

feature

	make (a_c: separate CC)
		do
			c := a_c
		end

	c: separate CC

	f (s: separate STRING)
		do
			print (create {STRING}.make_from_separate (s) + " calling BB.f%N")
			g
			{EXECUTION_ENVIRONMENT}.sleep (100_000_000)
		end

	g
		local
			b: separate BB
		do
			create b.make (c)
			x (b)
		end

	x (a_b: separate BB)
		do
			a_b.y
		end

	y
		do
			z (c)
		end

	z (a_c: separate CC)
		do
			a_c.f ("BB")
		end

end
