class AA

create

	make

feature

	make
		do
			(create {separate BB}.make).f
		end

end
