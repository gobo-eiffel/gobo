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
			when 1 .. 2 then
			else
			end
			print ("Failed")
		end
	
end
