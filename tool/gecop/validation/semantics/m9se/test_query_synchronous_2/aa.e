class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			f (b)
		end

	f (b: separate BB)
		local
			i: INTEGER
		do
			i := b.g
		end

end
