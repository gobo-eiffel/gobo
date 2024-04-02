class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make (Current)
			n (b)
		end

	n (b: separate BB)
		do
			b.m
		end

	g
		local
			c: CC
		do
			create c.make
			c.z
		end

end
