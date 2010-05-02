class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
		do
			create b
			c := b
			c.f
		end

end -- class AA
