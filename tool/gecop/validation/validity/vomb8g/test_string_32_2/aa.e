class AA

create

	make

feature

	make
		local
			b: separate STRING_32
		do
			create b.make_from_separate ("Ω")
			separate b as sb do
				inspect sb
				when "Ω" then
					print ("Passed")
				else
				end
			end
		end
	
end
