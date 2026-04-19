class AA

create

	make

feature

	make
		do
			if f then
				b := "Gobo"
			else
				b := "Eiffel"
			end
			print ("Passed")
		end

	b: STRING

	f: BOOLEAN
		do
			Result := 1 /= 1
		end

end
