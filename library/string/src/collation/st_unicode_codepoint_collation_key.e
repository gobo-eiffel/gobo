note

	description:

		"Collation keys for Unicode code-point collation"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_UNICODE_CODEPOINT_COLLATION_KEY

inherit

	ST_COLLATION_KEY

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_string: STRING)
			-- Create a new collation key.
		require
			a_string_not_void: a_string /= Void
		do
				-- Clone `a_string' in case it is altered later.
			source := STRING_.cloned_string (a_string)
		ensure
			source_set: STRING_.same_string (source, a_string)
		end

feature -- Access

	source: STRING
			-- Associated string

feature -- Comparison

	three_way_comparison (other: like Current): INTEGER
			-- Comparison of `Current' with `other'
		do
				-- This implementation directly compares the source values,
				-- so it is not any more efficient to use this class than
				-- to compare the strings directly
			Result := STRING_.three_way_comparison (source, other.source)
		end

end
