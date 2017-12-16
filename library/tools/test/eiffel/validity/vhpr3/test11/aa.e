class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			b.f
			print (b.item)
		end

end -- class AA
