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
			d := "go" + "bo"
			if c /= d then
				print ("Passed")
			else
				print ("Failed")
			end
		end
		
end
