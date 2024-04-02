class BB

create

	make

feature

	make
		do
		end

	g
		local
			c: CC
		do
			create c.make
			c.z
		end

	h
		do
			print ("Passed")
		end

end
