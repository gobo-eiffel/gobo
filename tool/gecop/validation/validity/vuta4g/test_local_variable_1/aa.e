class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			b.f
		end

end
