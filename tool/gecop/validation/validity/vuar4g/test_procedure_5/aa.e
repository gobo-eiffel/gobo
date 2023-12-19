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
		do
			b.f (2)
		end

end
