class AA

create

	make

feature

	make
		local
			s: detachable STRING
		do
			if f then
				b := "Gobo"
			else
				s := "Eiffel"
			end
			print ("Failed")
		end

	b: STRING

	f: BOOLEAN
		do
			Result := 1 /= 1
		end

end
