class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
			s1: SPECIAL [BB]
			s2: SPECIAL [CC]
		do
			create b
			create s1.make_filled (b, 1)
			g (s1, 5)
			h (s1, 6)
			create s2.make_filled (c, 1)
			g (s2, 7)
			hc (s2, 8)
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

	hc (s: SPECIAL [CC]; i: INTEGER)
		local
			c: CC
		do
			c := s.item (0)
			c.f (i)
			print (s.item (0).bar)
			print ("%N")
		end	
		
end
