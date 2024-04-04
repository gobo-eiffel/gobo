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
			a_c.f ("EE")
			print ("EE middle f%N")
			a_b.f ("EE")
			print ("EE end f%N")
		end

end
