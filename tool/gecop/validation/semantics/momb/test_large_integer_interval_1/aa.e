class AA

create

	make

feature

	make
		local
			b: INTEGER_32
		do
			b := 50
			inspect b
			when -1 then
				print ("Failed")
			when 1 .. 1_000_000_000 then
				print ("Passed")
			else
				print ("Failed")
			end
		end

end
