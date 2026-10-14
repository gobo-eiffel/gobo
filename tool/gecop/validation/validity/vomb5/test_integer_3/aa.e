class AA

create

	make

feature

	make
		local
			b: INTEGER_8
		do
			b := 1
			inspect b
			when {INTEGER_32} 1 then
				print ("Passed")
			else
				print ("Failed")
			end
		end
	
end
