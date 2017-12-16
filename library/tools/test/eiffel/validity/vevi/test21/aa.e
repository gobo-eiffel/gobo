class AA

create

	make

feature

	make
		do
			create {CC} b1.make
			b1.f (Current)
			create b2.make
		end
		
	b1: BB

	b2: BB
	
	f
		local
			s: ANY
		do
			s := b2.out
		end
		
end
