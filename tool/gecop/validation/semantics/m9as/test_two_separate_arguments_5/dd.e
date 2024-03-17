class DD

create

	make

feature

	make (a_b: separate BB)
		do
			b := a_b
		end
	
	b: separate BB

	g
		do
			f (b, b)
		end

	f (a_b1: separate BB; a_b2: separate BB)
		do
			a_b1.f ("DD")
			print ("DD middle f%N")
			a_b2.f ("DD")
			print ("DD end f%N")
		end

end
