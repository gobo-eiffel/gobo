class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.make
			b.g
		end
		
end
