class AA

create

	make

feature

	make
		local
			c: ANY
			d: ANY
		do
			c := {STRING_8} "gobo"
			d := {STRING_32} "gobo"
			if c ~ d then
				print ("Failed")
			else
				print ("Passed")
			end
		end
		
end
