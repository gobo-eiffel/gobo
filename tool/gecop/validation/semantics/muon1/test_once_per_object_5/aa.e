class AA

create

	make

feature

	make
		local
			b1: BB
			b2: BB
		do
			create b1
			create b2
			print ("b1 is equal to b2: ")
			print (b1.is_equal (b2))
			print ("%N")
			print (b1.g)
			print ("%N")
			print ("b1 is equal to b2: ")
			print (b1.is_equal (b2))
			print ("%N")
			print (b1.f)
			print ("%N")
			print ("b1 is equal to b2: ")
			print (b1.is_equal (b2))
			print ("%N")
		end
		
end
