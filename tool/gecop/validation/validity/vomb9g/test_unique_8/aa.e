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
			when f then
				print ("Passed")
			when -1 then
				print ("Failed")
			else
				print ("Failed")
			end
		end
	
	f: INTEGER = unique
	
end
