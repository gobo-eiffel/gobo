class AA

creation

	make

feature

	make is
		local
			b: BB
		do
			!! b
			print (b.item.count)
		end

end -- class AA
