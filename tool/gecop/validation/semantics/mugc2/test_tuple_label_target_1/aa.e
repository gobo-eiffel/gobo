class AA

create

	make

feature

	make
		local
			b: BB
			t: TUPLE [b: BB]
		do
			t := [b]
			g (t, 5)
			h (t, 6)
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
