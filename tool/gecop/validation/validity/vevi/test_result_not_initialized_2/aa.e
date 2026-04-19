class AA

create

	make

feature

	make
		local
			s: STRING
		do
			s := f
			print ("Failed")
		end

	f: STRING
		local
			s: STRING
		do
			if g then
				Result := "Gobo"
			else
				s := "Eiffel"
			end
		end

	g: BOOLEAN
		do
			Result := 1 = 1
		end

end
