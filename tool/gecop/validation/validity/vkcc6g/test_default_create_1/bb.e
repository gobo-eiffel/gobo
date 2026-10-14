once class BB

inherit

	ANY
		redefine
			default_create
		end

feature

	default_create
		once
		ensure then
			class
		end

end
