class AA

create

	make

feature

	make
		local
			b: INTEGER_32
		do
			b := 1
			inspect b
			when {AA}.f then
			else
			end
			print ("Failed")
		end

	f: INTEGER_32
		once
			Result := 1
		ensure
			class
		end

end
