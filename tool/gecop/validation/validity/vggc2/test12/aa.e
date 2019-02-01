class AA

create

	make

feature

	make
		local
			b: BB [CC, CC]
			c: CC
		do
			create b
			create c
			b.f (c)
		end

end
