class AA

create

	make

feature

	make
		local
			b1: BB
			b2: BB
		do
			create b1.make ("b1")
			b1.launch
			b1.join
			create b2.make ("b2")
			b2.launch
			b2.join
		end
		
end
