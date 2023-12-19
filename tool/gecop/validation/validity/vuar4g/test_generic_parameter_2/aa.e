class AA

create

	make

feature

	make
		local
			b: BB [DD]
			c: separate CC [DD]
			d: DD
		do
			d.set_name ("eiffel")
			create b.make (d)
			create c.make
			b.g (c)
		end

end
