class AA

creation

	make

feature

	make is
		local
			b: BB
		do
			!! b
			if b.item /= Void then
				print (b.item.item)
			end
		end

end -- class AA
