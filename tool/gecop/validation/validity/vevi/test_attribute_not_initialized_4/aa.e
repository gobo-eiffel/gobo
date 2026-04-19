class AA

create

	make

feature

	make
		do
			print ("Failed")
		end

	b: STRING
		attribute
		ensure
			Result /= "Gobo"
		end

end
