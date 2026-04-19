class AA

create

	make

feature

	make
		local
			a: AA
		do
			a := Current
			f (a)
			b := "Eiffel"
			print ("Passed")
		end

	b: STRING

	f (a: AA)
		do
		end

end
