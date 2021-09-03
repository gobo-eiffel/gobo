class AA

create

	make

feature

	make
		local
			b: BB
			s: SPECIAL [BB]
		do
			create s.make_filled (b, 1)
			g (s, 5)
			h (s, 6)
		end

	g (s: SPECIAL [BB]; i: INTEGER)
		do
			s.item (0).f (i)
			print (s.item (0).bar)
			print ("%N")
		end

	h (s: SPECIAL [BB]; i: INTEGER)
		local
			b: BB
		do
			b := s.item (0)
			b.f (i)
			print (s.item (0).bar)
			print ("%N")
		end		
		
end
