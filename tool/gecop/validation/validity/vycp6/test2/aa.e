class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
		do
			create c
			b := c
			print ("Failed")
		end

end
