class AA

create

	make

feature

	make
		local
			c: CC
			d: DD
		do
			create c.make (4)
			create d.make (4)
			if c ~ d then
				print ("Failed")
			else
				print ("Passed")
			end
		end
		
end
