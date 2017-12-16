class AA

create

	make

feature

	make
		local
			b: BOOLEAN
		do
			f (1)
			b := g ("gobo")
		end
		
	f alias "()" (i: INTEGER)
		do
		end
		
	g alias "()" (a: ANY): BOOLEAN
		do
		end

end
