class AA

create

	make

feature

	make
		local
			a: ANY
		do
			a := {ARRAY [REAL_64]} <<{INTEGER_8} 1>>
			print (a.generating_type)
		end
		
end
