class AA

create

	make

feature

	make
		local
			b: separate BB
			s: separate STRING
		do
			create b.make
			create s.make (0)
			print ("Before AA.f%N")
			f (b, s)
			print ("After AA.f%N")
		end

	f (b: separate BB; s: separate STRING)
		do
			b.g (s)
		end

end
