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
			{EXECUTION_ENVIRONMENT}.sleep (200_000_000)
			print ("middle DD.g%N")
			separate c as cc do
				a := cc.f
			end
			print ("end DD.g%N")
		end

	y: BOOLEAN
		do
			print ("DD.y%N")
		end

end
