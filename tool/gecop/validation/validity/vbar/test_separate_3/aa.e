class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.make
			g (b)
		end

	g (b: separate BB)
		local
			y: BB
		do
			if attached {BB} b as x then
				y := x
				y.f
			end
		end

end
