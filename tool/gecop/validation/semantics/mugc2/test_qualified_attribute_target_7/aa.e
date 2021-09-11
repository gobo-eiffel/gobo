class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			b.c.set_item (5)
			print (b.c)
			print ("%N")
		end
		
end
