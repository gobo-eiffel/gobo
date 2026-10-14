class AA

create

	make

feature

	make
		local
			b: INTEGER_32
		do
			b := 10
			inspect b
			when {INTEGER_8} 10 then
			when {INTEGER_16} 10 then
			else
			end
			print ("Failed")
		end
	
end
