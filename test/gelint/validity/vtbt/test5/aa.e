class AA

creation

	make

feature

	make is
		local
			b: BB
		do
			create b
			print (b.item.count)
		end

end -- class AA
