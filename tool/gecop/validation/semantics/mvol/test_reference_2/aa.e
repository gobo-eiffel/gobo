class AA

create

	make

feature

	make
		local
			b: BB
		do
			create {CC} b
			if attached {CC} b as a then
				if a = b then
					print ("Passed")
				else
					print ("Failed")
				end
			else
				print ("Failed")
			end
		end
		
end
