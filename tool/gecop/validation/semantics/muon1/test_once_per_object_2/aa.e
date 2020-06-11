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
			b1.execute
			create b2.make ("b2")
			b2.execute
		end
		
end
