class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
		do
			print ("B.f%N")
			create b
			g (b.f)
			print ("C.f%N")
			create c
			g (c.f)
		end

	g (a: detachable STRING)
		do
			if a = Void then
				print ("Void")
			else
				print (a)
			end
			print ("%N")
		end
		
end
