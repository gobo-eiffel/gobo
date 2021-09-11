class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			b.c.copy (5)
			print (b.c)
			print ("%N")
		end
		
end
