class AA

create

	make

feature

	make
		local
			b: STRING_8
		do
			b := "a"
			inspect b
			when {AA}.f then
			else
			end
			print ("Failed")
		end

	f: STRING_8
		once
			Result := "a"
		ensure
			class
		end

end
