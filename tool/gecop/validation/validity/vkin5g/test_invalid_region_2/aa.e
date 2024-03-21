class AA

create

	make

feature

	make
		local
			b: BB
		do
			create <ANY> b.make
		end

end
