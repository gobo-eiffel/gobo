class AA

create

	make

feature

	make
		local
			b: separate BB
			i: INTEGER
		do
			create b.make
			i := f (b)
		end

	f (b: separate BB): INTEGER
		do
			Result := b.g
		end

end
