class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.f
			print ("b ")
			print (b.attr)
			print ("%N")
			b.g
			print ("b ")
			print (b.attr)
			print ("%N")
		end
		
end
