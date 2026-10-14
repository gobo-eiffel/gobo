once class BB

create

	f, g

feature

	f
		once
			print ("BB.f%N")
			a := "gobo"
		end

	g
		once
			print ("BB.g%N")
			a := "eiffel"
		end

	a: STRING

end
