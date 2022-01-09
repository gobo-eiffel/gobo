class AA

create

	make

feature

	make
		local
			c: INTEGER_32
			d: INTEGER_32
		do
			c := 4
			d := 4
			if c /~ d then
				print ("Failed")
			else
				print ("Passed")
			end
		end
		
end
