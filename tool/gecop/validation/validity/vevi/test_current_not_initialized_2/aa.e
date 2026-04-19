class AA

create

	make

feature

	make
		local
			a: AA
			s: STRING
		do
			a := Current
			s := "Gobo"
			s.do_nothing
			b := "Eiffel"
			print ("Failed")
		end

	b: STRING

end
