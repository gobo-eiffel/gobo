class AA

create

	make

feature

	make
		local
			b: BB
		do
			b := create <NONE> {BB}.make
		end

end
