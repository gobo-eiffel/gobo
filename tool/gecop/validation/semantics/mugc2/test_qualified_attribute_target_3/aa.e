class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
		do
			create b
			g (b, 5)
			h (b, 6)
			create c
			g (c, 7)
			h (c, 8)
		end

	g (b: BB; i: INTEGER)
		do
			b.d.f (i)
			print (b.d.bar)
			print ("%N")
		end

	h (b: BB; i: INTEGER)
		local
			d: DD
		do
			d := b.d
			d.f (i)
			print (b.d.bar)
			print ("%N")
		end	
			
end
