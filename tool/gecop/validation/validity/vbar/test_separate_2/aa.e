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
			x: BB
		do
			x := b.f
		end

end
