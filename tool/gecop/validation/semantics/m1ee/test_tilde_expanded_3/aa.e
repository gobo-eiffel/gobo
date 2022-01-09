class AA

create

	make

feature

	make
		local
			c: ANY
			d: ANY
		do
			c := 4
			d := 4
			if c ~ d then
				print ("Passed")
			else
				print ("Failed")
			end
		end
		
end
