class AA

create

	make

feature

	make
		local
			c: CC
			d: CC
		do
			create c.make (4)
			create d.make (4)
			if c.standard_is_equal (d) then
				print ("Passed")
			else
				print ("Failed")
			end
		end
		
end
