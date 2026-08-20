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
			f (b, False)
		end

	f (b: separate BB; a: BOOLEAN)
		local
			b2: separate BB
		do
			if a then
				create b2.make
				g (b2)
			else
				b.f
				g (b)
				b.h
			end
		end

	g (b: separate BB)
		require
			foo: b.is_valid
		do
			b.g
		end

end
