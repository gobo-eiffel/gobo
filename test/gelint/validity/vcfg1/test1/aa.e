class AA

create

	make

feature

	make is
		local
			b: BB
			d: DD
		do
			create d
			create b
			print (b.item)
		end

end -- class AA
