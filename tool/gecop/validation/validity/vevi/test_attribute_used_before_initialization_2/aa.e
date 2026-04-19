class AA

create

	make

feature

	make
		do
			f
			b := "Eiffel"
			print ("Failed")
		end

	b: STRING

	f
		do
			g (b)
		end

	g (a: STRING)
		do
		end

end
