class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			g (b)
		end

	g (b: separate BB)
		local
			c: CC
		do
			c.set_name ("eiffel")
			b.c := c
		end

end
