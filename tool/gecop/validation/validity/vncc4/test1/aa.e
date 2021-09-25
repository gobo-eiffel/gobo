class AA

create

	make

feature

	make
		local
			b1: BB [ANY]
			b2: BB [CHARACTER]
		do
			b1.set_attr ("1")
			print (b1.attr)
			print ("%N")
			b2.set_attr ('2')
			b1 := b2
			print (b1.attr)
			print ("%N")
		end
	
end
