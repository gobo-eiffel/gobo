expanded class BB

inherit

	ANY
		redefine
			default_create
		end

create

	default_create

feature

	default_create
		local
			c: BB
		do
			c := Current
			s := "Eiffel"
		end

	s: separate STRING

end
