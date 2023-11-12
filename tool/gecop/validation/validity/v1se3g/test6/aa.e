class AA

create

	make

feature

	make
		do
			separate f as x do
				print ("Passed")
			end
		end

	f: separate STRING_32
		do
			create Result.make (0)
		end

end
