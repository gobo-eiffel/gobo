class AA

creation

	make

feature

	make is
		local
			b: BB
			c: CC
		do
			!! b
			b.f1
			b.f2
			c := b
			c.f
		end

end -- class AA
