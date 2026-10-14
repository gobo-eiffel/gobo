class AA

create

	make

feature

	make
		local
			b: CHARACTER
		do
			b := 'c'
			inspect b
			when 'd' .. 'a' then
			else
			end
			print ("Failed")
		end

end
