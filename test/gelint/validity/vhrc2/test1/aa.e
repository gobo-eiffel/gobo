class AA

creation

	make

feature

	make is
		local
			b: BB
		do
			create b
			b.g
			b.h
		end

end -- class AA
