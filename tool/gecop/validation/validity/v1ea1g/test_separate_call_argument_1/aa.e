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
			a: ANY
		do
			c.set_name ("eiffel")
			a := c
			b.f (a)
		end

end
