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
			c := b
			c.f
		end

end -- class AA
