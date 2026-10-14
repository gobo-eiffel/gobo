class AA

create

	make

feature

	make
		local
			s: separate STRING_8
			b: separate TYPE [detachable separate ANY]
		do
			create s.make (0)
			separate s as ss do
				b := ss.generating_type
			end
			separate b as sb do
				inspect sb
				when {detachable STRING_8} then
					print ("Passed")
				else
				end
			end
		end
	
end
