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
			print (b.item)
		end

end -- class AA
