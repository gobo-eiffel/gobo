class AA

create

	make

feature

	make
		local
			b: separate BB
			y: separate BB
		do
			create b.make
			separate b as x do
				y := x
				y.f
			end
		end

end
