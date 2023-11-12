class AA

create

	make

feature

	make
		do
			f
		end
			
	f
		do
			separate h as x do
				separate g as x do
					print ("Failed")
				end
			end
		end

	g: separate STRING
		do
			create Result.make (0)
		end

	h: separate STRING
		do
			create Result.make (0)
		end

end
