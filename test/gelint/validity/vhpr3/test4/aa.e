class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			print (b.item.generating_type)
		end

end -- class AA
