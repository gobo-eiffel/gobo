class AA

create

	make

feature

	make
		do
			f (b)
			b := "Eiffel"
			print ("Failed")
		end

	b: STRING
		attribute
		ensure
			Result /= "Gobo"
		end

	f (a: STRING)
		do
		end

end
