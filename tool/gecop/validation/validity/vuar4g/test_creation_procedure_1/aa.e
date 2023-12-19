class AA

create

	make

feature

	make
		do
			f
		end

	f
		local
			b: separate BB
			c: CC
		do
			c.set_name ("eiffel")
			create b.make (c)
		end

end
