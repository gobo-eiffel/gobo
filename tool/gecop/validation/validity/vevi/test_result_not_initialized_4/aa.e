class AA

create

	make

feature

	make
		do
			print ("Failed")
		end

	f: STRING
		local
			s: STRING
		attribute
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
