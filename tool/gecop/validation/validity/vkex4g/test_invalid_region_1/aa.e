class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			b := create <ANY> {separate BB}.make
		end

end
