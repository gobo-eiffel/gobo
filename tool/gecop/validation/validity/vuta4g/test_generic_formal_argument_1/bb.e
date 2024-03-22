class BB [G -> separate CC]

create

	make

feature

	make (c: G)
		do
			cc := c
		end

	cc: G

	f
		do
			g (cc)
		end
		
	g (c: G)
		do
			c.h
		end

end
