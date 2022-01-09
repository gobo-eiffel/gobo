class AA

create

	make

feature

	make
		local
			c: STRING
			d: STRING
		do
			c := "gobo"
			d := c
			if c /= d then
				print ("Failed")
			else
				print ("Passed")
			end
		end
		
end
