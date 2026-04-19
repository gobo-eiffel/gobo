class AA

create

	make

feature

	make
		do
			if f then
				g
			else
				h
			end
			print ("Passed")
		end

	b: STRING

	f: BOOLEAN
		do
			Result := 1 /= 1
		end

	g
		do
			b := "Gobo"
		end

	h
		do
			b := "Eiffel"
		end

end
