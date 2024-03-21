class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			b := create <NONE> {separate BB}.make
		end

end
