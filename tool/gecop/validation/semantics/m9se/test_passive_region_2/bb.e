class BB

create

	make

feature

	make
		do
		end

	g
		local
			c: separate CC
		do
			create <NONE> c.make
			print ("Calling BB.x%N")
			x (c)
		end

	x (c: separate CC)
		do
			print ("BB.x%N")
			c.h
			print ("Failed")
		end

end
