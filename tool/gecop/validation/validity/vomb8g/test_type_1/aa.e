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
			inspect b
			when {detachable separate STRING_8} then
			else
			end
			print ("Failed")
		end
	
end
