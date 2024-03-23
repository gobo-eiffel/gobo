class AA

create

	make

feature

	make
		local
			b: separate BB [DD]
		do
			create b.make
			f (b)
		end

	f (b: separate BB [DD])
		local
			c: CC [DD]
			d: DD
		do
			d.set_name ("eiffel")
			create c.make (d)
			b.g (c)
		end

end
