class AA

inherit

	BB

create

	make
	
feature

	make
		local
			b: BOOLEAN
		do
			b := f (1)
			b := g ("gobo")
		end
		
	f alias "[]" (i: INTEGER): BOOLEAN
		do
		end

end
