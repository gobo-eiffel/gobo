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
			b.f1
			b.f2
			c := b
			c.f
		end

end -- class AA
