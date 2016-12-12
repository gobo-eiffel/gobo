class AA

create

	make

feature

	make
		do
			create b1.make
			b1.f (Current)
			create b2.make
		end
		
	b1: BB

	b2: BB
		
end
