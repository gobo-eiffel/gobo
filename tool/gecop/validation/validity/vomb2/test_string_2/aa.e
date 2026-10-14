class AA

create

	make

feature

	make
		local
			b: STRING_32
		do
			b := "a"
			inspect b
			when {AA}.f then
			else
			end
			print ("Failed")
		end

	f: STRING_32
		once
			Result := "a"
		ensure
			class
		end

end
