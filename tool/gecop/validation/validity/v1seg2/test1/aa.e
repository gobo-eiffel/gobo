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
			
	f: separate STRING
		do
			create Result.make (0)
		end

	x
		do
		end	

end
