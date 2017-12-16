class AA

create

	make

convert

	to_cc: {CC}
	
feature

	make
		do
			create b.make (Current)
		end
		
	b: BB
	
	to_cc: CC
		local
			s: ANY
		do
			create Result
			s := b.out
		end
		
end
