class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create <NONE> b.make
			f (b)
		end

	f (b: separate BB)
		do
			b.g
		end

end
