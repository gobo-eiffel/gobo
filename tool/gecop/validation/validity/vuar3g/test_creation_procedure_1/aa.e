class AA

create

	make

feature

	make
		do
			f
		end

	f
		local
			b: separate BB
		do
			create b.make (Current)
		end

end
