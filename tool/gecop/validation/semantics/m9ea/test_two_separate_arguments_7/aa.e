class AA

create

	make

feature

	make
		local
			b: separate BB
			c: separate CC
			d: separate DD
			e: separate EE
		do
			create b.make
			create c.make
			create d.make (b, c)
			create e.make (other_c (c))
			f (d)
			g (e)
		end

	f (d: separate DD)
		do
			d.g
		end

	g (e: separate EE)
		do
			e.g
		end

	other_c (c: separate CC): separate CC
		do
			Result := c.other
		end

end
