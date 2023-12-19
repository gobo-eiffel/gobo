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
			d: DD
		do
			d.set_name ("eiffel")
			c.set_d (d)
			b.f (c)
		end

end
