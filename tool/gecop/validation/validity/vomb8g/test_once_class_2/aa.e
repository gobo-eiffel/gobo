class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.f
			separate b as sb do
				inspect sb
				when {BB}.f then
					print ("Passed")
				else
				end
			end
		end
	
end
