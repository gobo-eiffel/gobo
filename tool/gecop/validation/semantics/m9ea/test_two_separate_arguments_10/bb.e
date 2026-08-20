class BB

create

	make

feature

	make
		local
			d: separate DD
		do
			create cc.make
			create d.make (cc)
			f (d)
			{EXECUTION_ENVIRONMENT}.sleep (100_000_000)
			print ("Calling BB.g...%N")
			g (d)
			{SCHEDULER}.set_value (2)
		end

	cc: separate CC

	f (d: separate DD)
		do
			d.g
		end

	g (d: separate DD)
		do
			d.h
			print ("Calling BB.h...%N")
			h (cc, d)
		end

	h (c: separate CC; d: separate DD)
		local
			a: BOOLEAN
		do
			print ("BB.h%N")
			a := c.x
			a := d.y
		end

end
