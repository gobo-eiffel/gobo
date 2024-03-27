class AA

create

	make

feature

	make
		local
			b: separate BB [STRING]
		do
			create b.make
			f (b)
		end

	f (b: separate BB [STRING])
		local
			c: CC [STRING]
			d: DD [STRING]
		do
			d.set_name ("eiffel")
			create c.make (d)
			b.g (c)
		end

end
