class AA

create

	make

feature

	make
		local
			a: detachable ANY
		do
			a := Void
			if a = Void then
				print ("Passed")
			else
				print ("Failed")
			end
		end
		
end
