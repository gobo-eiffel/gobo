class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			print (b.item.count)
		end

end -- class AA
