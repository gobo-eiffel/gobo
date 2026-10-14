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
			when {INTEGER_32} 300 then
			else
			end
			print ("Failed")
		end
	
end
