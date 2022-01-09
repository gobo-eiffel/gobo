class AA

create

	make

feature

	make
		local
			c: detachable ANY
			d: detachable STRING
		do
			c := "gobo"
			d := Void
			if c /= d then
				print ("Passed")
			else
				print ("Failed")
			end
		end
		
end
