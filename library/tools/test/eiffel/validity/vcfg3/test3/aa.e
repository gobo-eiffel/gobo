class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			if b.item /= Void then
				print (b.item.item)
			end
		end

end -- class AA
