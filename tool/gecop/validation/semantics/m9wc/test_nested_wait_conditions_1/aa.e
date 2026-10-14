class AA

create

	make

feature
		
	make
		local
			b: separate BB
		do
			create b.make
			create c.make
			f (b)
		end

	c: separate CC

	f (b: separate BB)
		require
			foo: b.is_valid (c)
		do
			print ("Passed")
		end

end
