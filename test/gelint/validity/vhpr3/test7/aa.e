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
			print (b.item.item.generating_type)
		end

end -- class AA
