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
			when {COMPARABLE} .. {STRING_8} then
			else
			end
			print ("Failed")
		end

end
