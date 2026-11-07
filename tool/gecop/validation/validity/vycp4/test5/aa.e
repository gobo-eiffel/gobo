class AA

create

	make

feature

	make
		local
			b: BB
			c1: CC [STRING]
			c2: CC [ANY]
		do
			create c1
			b := c1
			create c2
			b := c2
			print ("Passed")
		end

end
