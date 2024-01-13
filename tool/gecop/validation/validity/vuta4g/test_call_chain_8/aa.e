class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			separate b as x do
				x.c.f
			end
		end

end
