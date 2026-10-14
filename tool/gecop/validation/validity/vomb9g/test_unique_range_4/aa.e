class AA

create

	make

feature

	make
		local
			b: INTEGER
		do
			b := f
			inspect b
			when -2 .. -1 then
				print ("Failed")
			when {AA}.f .. {AA}.g then
				print ("Passed")
			else
				print ("Failed")
			end
		end
	
	f: INTEGER = unique
	g: INTEGER = unique
	
end
