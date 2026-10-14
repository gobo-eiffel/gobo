class AA

create

	make

feature

	make
		local
			b: INTEGER_32
		do
			b := 11111
			inspect b
			when {INTEGER_8} 11111 then
			else
			end
			print ("Failed")
		end
	
end
