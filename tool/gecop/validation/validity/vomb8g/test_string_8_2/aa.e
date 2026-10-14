class AA

create

	make

feature

	make
		local
			b: separate STRING_8
		do
			create b.make_from_separate ("b")
			separate b as sb do
				inspect sb
				when "b" then
					print ("Passed")
				else
				end
			end
		end
	
end
