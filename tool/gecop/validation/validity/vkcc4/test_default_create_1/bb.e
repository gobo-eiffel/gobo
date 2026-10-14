class BB

inherit

	ANY
		redefine
			default_create
		end

feature

	default_create
		once
			attr := 1
		end

	attr: INTEGER

end
