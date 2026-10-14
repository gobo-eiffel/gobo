class BB

inherit

	ANY
		redefine
			default_create
		end

create

	default_create

feature

	default_create
		once
			attr := 1
		end

	attr: INTEGER

end
