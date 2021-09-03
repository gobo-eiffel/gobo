class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
			t1: TUPLE [b: BB]
			t2: TUPLE [b: CC]
		do
			create b
			t1 := [b]
			g (t1, 5)
			h (t1, 6)
			t2 := [c]
			g (t2, 7)
			hc (t2, 8)
		end

	g (t: TUPLE [b: BB]; i: INTEGER)
		do
			t.b.f (i)
			print (t.b.bar)
			print ("%N")
		end

	h (t: TUPLE [b: BB]; i: INTEGER)
		local
			b: BB
		do
			b := t.b
			b.f (i)
			print (t.b.bar)
			print ("%N")
		end		

	hc (t: TUPLE [b: CC]; i: INTEGER)
		local
			b: CC
		do
			b := t.b
			b.f (i)
			print (t.b.bar)
			print ("%N")
		end			
end
