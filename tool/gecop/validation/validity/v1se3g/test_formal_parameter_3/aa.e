class AA

create

	make

feature

	make
		local
			b: BB [CC]
			c: CC
		do
			create c.make
			create b.make (c)
			b.f
		end

end
