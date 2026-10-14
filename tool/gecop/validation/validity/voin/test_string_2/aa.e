class AA

create

	make

feature

	make
		local
			b: STRING_32
		do
			b := "c"
			inspect b
			when "dΩ" .. "a" then
			else
			end
			print ("Failed")
		end

end
