class BB [G]

create

	make

feature

	make (a: G)
		local
			b: separate CC [G]
		do
			create b.make
			g (b, a)
		end

	g (b: separate CC [G]; a: G)
		local
			c: DD [G]
		do
			c.set_name (a)
			b.f (c)
		end

end
