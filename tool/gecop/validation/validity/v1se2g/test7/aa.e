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
			across h as x loop
				separate g as x do
					print ("Failed")
				end
			end
		end

	g: separate STRING
		do
			create Result.make (0)
		end

	h: STRING
		do
			Result := "gobo"
		end

end
