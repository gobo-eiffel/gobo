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
			if c /~ d then
				print ("Passed")
			else
				print ("Failed")
			end
		end
		
end
