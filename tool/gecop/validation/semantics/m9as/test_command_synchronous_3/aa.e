class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			print ("Before AA.f%N")
			f (b)
			print ("After AA.f%N")
		end

	f (b: separate BB)
		local
			s1: STRING
			s2: separate STRING
		do
			create s1.make (0)
			s2 := s1
			b.g (s2)
		end

end
