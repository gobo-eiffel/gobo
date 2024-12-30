class AA

create

	make

feature

	make
		local
			c: separate CC
			d: separate DD
		do
			create c.make
			create d.make (c)
			f (d)
		end

	f (d: separate DD)
		do
			d.g
		end

end
