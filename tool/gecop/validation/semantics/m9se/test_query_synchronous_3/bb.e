class BB

inherit

	ISE_SCOOP_RUNTIME

create

	make

feature

	make
		do
			pin_to_thread
		end

	g: INTEGER
		local
			c: CC
		do
			create c.make
			Result := c.z
		end

end
