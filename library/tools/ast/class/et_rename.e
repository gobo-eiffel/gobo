indexing

	description:

		"Eiffel rename pairs"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_RENAME

creation

	make

feature {NONE} -- Initialization

	make (o: like old_name; n: like new_name) is
			-- Create a new rename pair.
		require
			o_not_void: o /= Void
			n_not_void: n /= Void
		do
			old_name := o
			new_name := n
		ensure
			old_name_set: old_name = o
			new_name_set: new_name = n
		end

feature -- Access

	old_name: ET_FEATURE_NAME
			-- Old name

	new_name: ET_FEATURE_NAME
			-- New name

invariant

	old_name_not_void: old_name /= Void
	new_name_not_void: new_name /= Void

end -- class ET_RENAME
