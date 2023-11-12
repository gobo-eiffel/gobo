class AA

create

	make

feature

	make
		do
			separate f as x do
				print ("Failed")
			end
		end
			
	f: STRING_32
		do
			create Result.make (0)
		end

end
