class BB

create

	make

feature

	make
		local
			c: separate CC
			d: separate DD
		do
			create c.make
			create d.make (c)
			f (d)
			{SCHEDULER}.wait_for_value (2)
			print ("Calling BB.g...%N")
			g (c, d)
			{SCHEDULER}.set_value (4)
		end

	f (d: separate DD)
		do
			d.g
		end

	g (c: separate CC; d: separate DD)
		local
			a: BOOLEAN
		do
			print ("BB.g%N")
			{SCHEDULER}.set_value (3)
			a := c.x
			a := d.y
		end

end
