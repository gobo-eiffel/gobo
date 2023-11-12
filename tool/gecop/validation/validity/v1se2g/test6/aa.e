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
			if attached h as x then
				separate g as x do
					print ("Failed")
				end
			end
		end

	g: separate STRING
		do
			create Result.make (0)
		end

	h: detachable STRING
		do
			Result := "gobo"
		end

end
