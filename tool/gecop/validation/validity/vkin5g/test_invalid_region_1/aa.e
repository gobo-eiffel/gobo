class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create <ANY> b.make
		end

end
