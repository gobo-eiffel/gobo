class AA

create

	make

feature

	make
		local
			b: BB [separate CC]
			c: separate CC
		do
			print ("AA before b.f%N")
			create c.make
			create b.make (c)
			b.f
			print ("AA after b.f%N")
		end

end
