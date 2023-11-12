class AA

create

	make

feature

	make
		do
			f (1)
		end
			
	f (x: INTEGER)
		do
			separate g as x do
				print ("Failed")
			end
		end

	g: separate STRING
		do
			create Result.make (0)
		end

end
