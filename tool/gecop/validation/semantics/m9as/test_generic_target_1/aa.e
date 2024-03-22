class AA

create

	make

feature

	make
		local
			b1: BB [CC]
			c1: CC
			b2: BB [separate CC]
			c2: separate CC
		do
			print ("AA before b1.f%N")
			create c1.make
			create b1.make (c1)
			b1.f
			print ("AA after b1.f%N")
			print ("AA before b2.f%N")
			create c2.make
			create b2.make (c2)
			b2.f
			print ("AA after b2.f%N")
		end

end
