class DD

create

	make

feature

	make (a_b: separate BB)
		do
			b1 := other_b (a_b)
			b2 := other_b (a_b)
		end
	
	b1, b2: separate BB

	other_b (a_b: separate BB): separate BB
		do
			Result := a_b.other
		end

	g
		do
			f (b1, b2)
		end

	f (a_b1: separate BB; a_b2: separate BB)
		do
			a_b1.f ("DD")
			print ("DD middle f%N")
			a_b2.f ("DD")
			print ("DD end f%N")
		end

end
