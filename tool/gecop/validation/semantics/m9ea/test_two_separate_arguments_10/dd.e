class DD

create

	make

feature

	make (a_c: separate CC)
		do
			c := a_c
		end
	
	c: separate CC

	g
		local
			a: BOOLEAN
		do
			print ("start DD.g%N")
			{SCHEDULER}.set_value (2)
			{SCHEDULER}.wait_for_value (3)
			print ("middle DD.g%N")
			separate c as cc do
				a := cc.f
			end
			print ("end DD.g%N")
		end

	h
		do
		end

	y: BOOLEAN
		do
			print ("DD.y%N")
		end

end
