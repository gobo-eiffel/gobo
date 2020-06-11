class AA

create

	make

feature

	make
		local
			b1: BB
			b2: BB
		do
			print ("First call to f%N")
			create b1.make
			b1.launch
			b1.join
			print ("Second call to f%N")
			create b2.make
			b2.launch
			b2.join
		end
		
end
