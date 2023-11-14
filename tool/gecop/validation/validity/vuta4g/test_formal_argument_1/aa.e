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

	g (x: separate BB)
		do
			x.f
		end

end
