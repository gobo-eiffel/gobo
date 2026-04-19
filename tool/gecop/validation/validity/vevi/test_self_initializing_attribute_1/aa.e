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

	b: detachable STRING

	f (a: detachable STRING)
		do
		end

end
