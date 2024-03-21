class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create <NONE> b.make
		end

end
