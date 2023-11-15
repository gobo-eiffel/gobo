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

	g (b: detachable separate BB)
		do
			if attached b as x then
				x.f
			end
		end

end
