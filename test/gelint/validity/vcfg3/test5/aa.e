class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			b.g
			print (b.item2)
			b.f
		end

end -- class AA
