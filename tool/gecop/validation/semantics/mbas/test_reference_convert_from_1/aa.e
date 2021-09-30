class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
		do
			create b
			print ("## conversion expected%N")
			c := b
			print ("##%N")
		end
		
end
