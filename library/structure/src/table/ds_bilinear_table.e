note

	description:

		"Tables that allow bilinear traversing"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_BILINEAR_TABLE [G, K]

inherit

	DS_TABLE [G, K]

	DS_BILINEAR [G]
		rename
			has as has_item,
			has_void as has_void_item
		redefine
			new_cursor
		end

feature -- Access

	key_for_iteration: K
			-- Key at internal cursor position
		require
			not_off: not off
		do
			Result := cursor_key (internal_cursor)
		end

	new_cursor: DS_BILINEAR_TABLE_CURSOR [G, K]
			-- New external cursor for traversal
		deferred
		end

feature {DS_BILINEAR_TABLE_CURSOR} -- Cursor implementation

	cursor_key (a_cursor: like new_cursor): K
			-- Key at `a_cursor' position
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
			a_cursor_not_off: not cursor_off (a_cursor)
		deferred
		end

end
