class AA

creation

	make

feature

	make is
		local
			b: BB
		do
			!! b
			b.f
			print (b.item.item.count)
		end

end -- class AA
