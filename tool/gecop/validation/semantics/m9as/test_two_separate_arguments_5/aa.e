class AA

create

	make

feature

	make
		local
			b: separate BB
			d: separate DD
			e: separate EE
		do
			create b.make
			create d.make (b)
			create e.make (b)
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

end
