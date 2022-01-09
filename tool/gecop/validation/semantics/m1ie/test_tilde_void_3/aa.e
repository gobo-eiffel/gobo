class AA

create

	make

feature

	make
		local
			c: detachable ANY
			d: INTEGER
		do
			c := Void
			d := 4
			if c /~ d then
				print ("Passed")
			else
				print ("Failed")
			end
		end
		
end
