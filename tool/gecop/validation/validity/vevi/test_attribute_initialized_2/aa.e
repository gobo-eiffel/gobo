class AA

create

	make

feature

	make
		do
			b := "Eiffel"
			print ("Passed")
		end

	b: STRING
		attribute
		ensure
			not_empty: not Result.is_empty
		end

end
