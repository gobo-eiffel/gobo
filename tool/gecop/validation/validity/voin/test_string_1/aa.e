class AA

create

	make

feature

	make
		local
			b: STRING_8
		do
			b := "c"
			inspect b
			when "d" .. "a" then
			else
			end
			print ("Failed")
		end

end
