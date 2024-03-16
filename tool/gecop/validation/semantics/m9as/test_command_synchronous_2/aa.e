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
			s: STRING
		do
			create s.make (0)
			b.g (s)
		end

end
