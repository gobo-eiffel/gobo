class BB [reference G -> separate CC]

create

	make

feature

	make (c: G)
		do
			item := c
			create dd.make
		end

	item: G

	dd: separate DD

	f
		do
			g (item, dd)
		end

	g (c: G; d: separate DD)
		do
			d.h (c)
		end

end
