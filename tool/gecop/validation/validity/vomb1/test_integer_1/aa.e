class AA

create

	make

feature

	make
		local
			b: INTEGER_32
		do
			b := -1
			inspect b
			when {NATURAL_8} -1 then
			else
			end
			print ("Failed")
		end
	
end
