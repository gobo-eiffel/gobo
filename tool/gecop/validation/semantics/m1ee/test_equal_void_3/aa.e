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
			if c = d then
				print ("Failed")
			else
				print ("Passed")
			end
		end
		
end
