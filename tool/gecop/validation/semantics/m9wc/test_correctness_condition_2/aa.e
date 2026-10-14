class AA

create

	make

feature
		
	make
		local
			b: BB
			c: separate BB
		do
			create b.make
			create c.make
			f (b, c)
		end

	f (b: separate BB; c: separate BB)
		require
			foo: b.is_valid
		do
			print ("Passed")
		end

end
