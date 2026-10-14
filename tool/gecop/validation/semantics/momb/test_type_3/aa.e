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
			when {INTEGER_32}, {INTEGER_8} .. {NUMERIC} then
				print ("Failed")
			when {COMPARABLE} .. {ANY}, {READABLE_STRING_8} then
				print ("Passed")
			when {AA} then
				print ("Failed")
			else
				print ("Failed")
			end
		end

end
