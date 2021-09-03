class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			g (b, 5)
			h (b, 6)
		end

	g (b: BB; i: INTEGER)
		do
			b.c.f (i)
			print (b.c.bar)
			print ("%N")
		end

	h (b: BB; i: INTEGER)
		local
			c: CC
		do
			c := b.c
			c.f (i)
			print (b.c.bar)
			print ("%N")
		end		
		
end
