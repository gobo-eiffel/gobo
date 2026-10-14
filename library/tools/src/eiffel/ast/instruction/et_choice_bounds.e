note

	description:

		"Eiffel choice interval bounds of inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CHOICE_BOUNDS

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no value in `Current`?
		deferred
		end

	overlaps (other: ET_CHOICE_BOUNDS): BOOLEAN
			-- Does `other` contain values of `Current`?
		require
			other_not_void: other /= Void
		deferred
		end

end
