class BB

create

	make

feature

	make
		do
		end

	f: ANY
		local
			c: CC
		do
			c.set_name ("eiffel")
			Result := c
		end

end
