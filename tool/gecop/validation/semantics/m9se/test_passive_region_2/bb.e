class BB

create

	make

feature

	make
		do
		end

	g
		local
			c: separate CC
		do
			create <NONE> c.make
			x (c)
		end

	x (c: separate CC)
		do
			c.h
		end

end
