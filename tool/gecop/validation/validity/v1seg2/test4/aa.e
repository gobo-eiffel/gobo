class AA

create

	make

feature

	make
		do
			f
		end
			
	f
		local
			x: INTEGER
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
