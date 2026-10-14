class AA

create

	make

feature

	make
		local
			b: TYPE [ANY]
		do
			b := {AA}
			inspect b
			when {ANY} then
				print ("Failed")
			when {AA} then
				print ("Passed")
			when {STRING_8} then
				print ("Failed")
			else
				print ("Failed")
			end
		end

end
