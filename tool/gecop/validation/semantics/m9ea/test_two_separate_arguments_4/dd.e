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
			{SCHEDULER}.wait_for_value (1)
			f (b, c)
		end

	f (a_b: separate BB; a_c: separate CC)
		do
			{scheduler}.set_value (2)
			a_b.f ("DD")
			print ("DD middle f%N")
			{scheduler}.set_value (3)
			a_c.fd ("DD")
			print ("DD end f%N")
		end

end
