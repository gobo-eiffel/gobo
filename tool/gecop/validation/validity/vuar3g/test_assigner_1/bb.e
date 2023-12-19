class BB

create

	make

feature

	make
		do
			name := "gobo"
		end

	name: STRING assign set_name

	set_name (a_name: STRING)
		do
			name := a_name
			print ("Failed")
		end

end
