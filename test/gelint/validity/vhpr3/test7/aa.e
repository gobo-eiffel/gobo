class AA

create

	make

feature

	make is
		local
			b: BB
		do
			create b
			b.f
			print (b.item.item.generating_type)
		end

end -- class AA
