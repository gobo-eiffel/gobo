class AA

create

	make

feature

	make
		do
			f (b)
			b := "Eiffel"
			print ("Passed")
		end

	b: STRING
		attribute
			Result := "Gobo"
		end

	f (a: STRING)
		do
		end

end
