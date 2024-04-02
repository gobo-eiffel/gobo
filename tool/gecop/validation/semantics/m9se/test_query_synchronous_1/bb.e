class BB

create

	make

feature

	make
		do
		end

	g: INTEGER
		local
			c: CC
		do
			create c.make
			Result := c.z
		end

end
