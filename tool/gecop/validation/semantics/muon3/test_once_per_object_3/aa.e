class AA

create

	make

feature

	make
		local
			b: BB
			c1: CC
			c2: CC
		do
			create b
			print ("First call to f%N")
			create c1.make (b)
			c1.launch
			c1.join
			print ("Second call to f%N")
			create c2.make (b)
			c2.launch
			c2.join
		end
		
end
