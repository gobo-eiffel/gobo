class AA

create

	make

feature

	make
		local
			b: BB
		do
			b := create <ANY> {BB}.make
		end

end
