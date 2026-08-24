class AA

create

	make

feature
		
	make
		local
			b: BB
		do
			create b.make
			create c.make
			f (b)
		end

	c: CC

	f (b: separate BB)
		require
			foo: b.is_valid (c)
		do
			print ("Passed")
		end

end
