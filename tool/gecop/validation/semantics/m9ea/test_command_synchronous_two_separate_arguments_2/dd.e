class DD

create

	make

feature

	make (a_c: separate CC)
		do
			c := a_c
		end

	c: separate CC

	g
		local
			b: separate BB
		do
			create b.make (c)
			h (b)
		end

	h (a_b: separate BB)
		do
			f (a_b, c)
		end

	f (a_b: separate BB; a_c: separate CC)
		do
			a_b.f ("DD")
			print ("DD middle f%N")
			a_c.f ("DD")
			print ("DD end f%N")
		end

end
