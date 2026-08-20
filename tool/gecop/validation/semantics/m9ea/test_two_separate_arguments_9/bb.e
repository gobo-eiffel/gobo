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
			{EXECUTION_ENVIRONMENT}.sleep (100_000_000)
			print ("Calling BB.g...%N")
			g (c, d)
			{SCHEDULER}.set_value (2)
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
			a := c.x
			a := d.y
		end

end
