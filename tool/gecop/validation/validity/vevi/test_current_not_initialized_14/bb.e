class BB

create

	make

feature

	make (a: AA)
		local
			c: CC
			b: BOOLEAN
		do
			create c.make (a)
			b := c = c
		end

	is_valid: BOOLEAN
		do
			Result := True
		end

end
