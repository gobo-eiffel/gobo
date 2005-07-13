class AA

create

	make

feature

	make is
		local
			b: BB
			c: CC
		do
			create b
			c := b
			c.f
		end

end -- class AA
