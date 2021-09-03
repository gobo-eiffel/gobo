class AA

create

	make

feature

	make
		local
			b: BB
			t1: TUPLE [b: BB]
			t2: TUPLE [b: BB; s: STRING]
		do
			t1 := [b]
			g (t1, 5)
			h (t1, 6)
			t2 := [b, "eiffel"]
			g (t2, 7)
			h (t2, 8)
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
		
end
