class AA

create

	make

feature

	make
		do
			separate f as x, g as x do
				print ("Failed")
			end
		end
			
	f: separate STRING
		do
			create Result.make (0)
		end

	g: separate STRING
		do
			create Result.make (0)
		end	

end
