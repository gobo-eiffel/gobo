class AA

create

	make

feature

	make
		local
			b: BB [separate CC]
			c: separate CC
		do
			create c.make
			create b.make (c)
			b.f
		end

end
