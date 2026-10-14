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
			when {INTEGER_8} .. {NUMERIC}, {INTEGER_32} then
				print ("Failed")
			when {STRING_8} .. {COMPARABLE} then
				print ("Passed")
			when {AA} then
				print ("Failed")
			else
				print ("Failed")
			end
		end

end
