class AA

create

	make

feature

	make is
		local
			b: BB
		do
			create b
			b.g
			print (b.item1.generator)
			print (b.item2.generator)
			b.f
		end

end -- class AA
