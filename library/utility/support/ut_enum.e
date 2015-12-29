note

        description:

                "Enumerated type skeleton"

        library: "Gobo Eiffel Utility Library"
        copyright: "Copyright (c) 2015, Eric Bezault and others"
        license: "MIT License"

deferred class UT_ENUM[G]

inherit

        ANY -- Needed for SE 2.1b1.

feature {NONE}
	-- Initialization

	make(selected: G)
		require
			selected_not_void: selected /= Void
		do
			item := selected
	end


feature
	-- Access

	item: G


feature {}

	members: ARRAY [G]
		deferred
	end

invariant
	item_is_valid: members.contains (item)

end
