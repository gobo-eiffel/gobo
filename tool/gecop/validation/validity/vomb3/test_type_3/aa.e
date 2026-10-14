class AA

create

	make

feature

	make
		local
			b: TYPE [ANY]
		do
			b := {READABLE_STRING_8}
			inspect b
			when {READABLE_STRING_8} then
			when {STRING_8} .. {COMPARABLE} then
			else
			end
			print ("Failed")
		end
	
end
