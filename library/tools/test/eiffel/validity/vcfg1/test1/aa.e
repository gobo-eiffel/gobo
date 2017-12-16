class AA

create

	make

feature

	make
		local
			b: BB
			d: DD
		do
			create d
			create b
			print (b.item)
		end

end -- class AA
