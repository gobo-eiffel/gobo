class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			g (b, 1)
			g (b, 2)
		end

	g (b: separate BB; x: INTEGER)
		local
			c: separate CC
			i: NATURAL_16
		do
			create c.make
			i := (inspect x when 1 then b when 2 then c end).f
		end

end
