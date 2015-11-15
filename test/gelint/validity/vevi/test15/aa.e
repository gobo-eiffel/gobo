class AA

create

	make

feature

	make
		do
			create b.make (Current)
		end
		
	b: BB
	
	f
		local
			s: ANY
		do
			s := b.out
		end
		
end
