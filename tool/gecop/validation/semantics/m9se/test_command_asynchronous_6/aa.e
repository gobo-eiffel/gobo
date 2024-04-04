class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			f1 (b)
			f2 (b)
		end

	f1 (b: separate BB)
		do
			b.g
		end

	f2 (b: separate BB)
		local
			i: INTEGER
		do
			i := b.h
		end

end
