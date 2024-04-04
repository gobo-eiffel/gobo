class EE

create

	make

feature

	make (a_c: separate CC)
		do
			c := a_c
		end
	
	c: separate CC

	g
		do
			f (c)
		end

	f (a_c: separate CC)
		do
			a_c.f ("EE")
			print ("EE end f%N")
		end

end
