class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			g (b, True)
			g (b, False)
		end

	g (b: separate BB; x: BOOLEAN)
		local
			c: separate CC
			i: NATURAL_16
		do
			create c.make
			i := (if x then b else c end).f
		end

end
