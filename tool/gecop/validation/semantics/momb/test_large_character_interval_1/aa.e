class AA

create

	make

feature

	make
		local
			b: CHARACTER_32
		do
			b := 'z'
			inspect b
			when 'a' then
				print ("Failed")
			when 'b' .. '🝝' then
				print ("Passed")
			else
				print ("Failed")
			end
		end

end
