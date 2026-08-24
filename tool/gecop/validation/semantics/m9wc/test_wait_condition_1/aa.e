class AA

create

	make

feature
		
	make
		local
			b: separate BB
			c: separate CC
		do
			create b.make
			create c.make (b)
			separate c as cc do
				cc.f
			end
			f (b)
		end

	f (b: separate BB)
		require
			foo: b.is_valid
		do
			print ("Passed")
		end

end
