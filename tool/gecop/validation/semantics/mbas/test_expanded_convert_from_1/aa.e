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
			print ("## conversion and copy expected%N")
			c := b
			print ("##%N")
		end
		
end
