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
			print ("Failed")
		end

	b: STRING

	f (a: AA)
		local
			c: BOOLEAN
		do
			c := a.b.is_empty
		end

end
