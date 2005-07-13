class AA

create

	make

feature

	make is
		local
			b: BB
		do
			create b
			print (b.item)
		end

end -- class AA
