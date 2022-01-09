class AA

create

	make

feature

	make
		local
			c: ANY
			d: ANY
		do
			create {CC} c.make (4)
			create {DD} d.make (4)
			if c /= d then
				print ("Passed")
			else
				print ("Failed")
			end
		end
		
end
