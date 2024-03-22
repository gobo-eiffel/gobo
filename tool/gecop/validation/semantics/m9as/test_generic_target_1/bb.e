class BB [G -> separate CC]

create

	make

feature

	make (c: G)
		do
			item := c
		end

	item: G

	f
		do
			g (item)
		end

	g (c: G)
		do
			c.h
		end

end
