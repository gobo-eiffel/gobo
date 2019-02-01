class AA

create

	make

feature

	make
		local
			b: BB [CC]
			c: CC
		do
			create c.make (2)
			create b
			b.f (c)
		end

end
