class AA

creation

	make

feature

	make is
		local
			b: BB
		do
			!! b
			b.g
			print (b.item2)
			b.f
		end

end -- class AA
