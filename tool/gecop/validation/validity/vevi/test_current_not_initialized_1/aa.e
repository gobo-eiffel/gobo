class AA

create

	make

feature

	make
		local
			a: AA
		do
			a := Current
			a.f
			b := "Eiffel"
			print ("Failed")
		end

	b: STRING

	f
		local
			c: BOOLEAN
		do
			c := b.is_empty
		end

end
