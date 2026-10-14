class AA

create

	make

feature
		
	make
		local
			b: separate BB
			c: separate CC
			d: DD
		do
			create b.make
			create c.make (b)
			separate c as cc do
				cc.f
			end
			create d.make
			f (b, d)
		end

	f (b: separate BB; d: DD)
		require
			foo: b.is_valid or d.is_valid
		do
			print ("Passed")
		end

end
