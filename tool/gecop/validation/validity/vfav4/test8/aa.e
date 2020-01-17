class AA

create

	make

feature

	make
		local
			i: INTEGER
			c: CC
		do
			create c.make
			i := c (4)
			print ("Failed")
		end

end
