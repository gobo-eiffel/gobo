class BB

create

	make

feature

	make
		do
		end

	c: CC assign set_c

	set_c (a_c: CC)
		do
			c := a_c
			print ("Failed")
		end

end
