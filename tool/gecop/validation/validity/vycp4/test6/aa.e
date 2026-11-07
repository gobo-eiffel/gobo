class AA

create

	make

feature

	make
		local
			b: BB [ANY]
			c: CC [ANY]
		do
			create c
			b := c
			print ("Passed")
		end

end
