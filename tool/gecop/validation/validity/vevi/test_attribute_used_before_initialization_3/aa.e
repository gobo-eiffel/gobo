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
			True
		end

	f (a: STRING)
		do
		end

end
