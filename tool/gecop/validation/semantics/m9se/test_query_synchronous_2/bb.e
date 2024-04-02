class BB

create

	make

feature

	make
		do
		end

	g: INTEGER
		local
			c: separate CC
		do
			create c.make
			Result := x (c)
		end

	x (c: separate CC): INTEGER
		do
			Result := c.h
		end

end
