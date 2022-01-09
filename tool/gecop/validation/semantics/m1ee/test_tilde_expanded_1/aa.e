class AA

create

	make

feature

	make
		local
			c: INTEGER_8
			d: CHARACTER_8
		do
			c := 4
			d := '%/4/'
			if c ~ d then
				print ("Failed")
			else
				print ("Passed")
			end
		end
		
end
