class AA

create

	make

feature

	make
		local
			c: CC
			i: INTEGER
		do
			create c
			i := c (5)
			print ("Failed")
		end

end
