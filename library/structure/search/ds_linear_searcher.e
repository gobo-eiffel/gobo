indexing

	description:

		"Linear structure searchers"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_LINEAR_SEARCHER [G]

inherit

	DS_SEARCHER [G]

feature -- Status report

	has (a_container: like container; v: G): BOOLEAN is
			-- Does `a_container' include `v'?
		local
			a_cursor: like cursor
		do
			a_cursor := a_container.new_cursor
			a_cursor.start
			search_forth (a_cursor, v)
			Result := not a_cursor.after
		end

feature -- Measurement

	occurrences (a_container: like container; v: G): INTEGER is
			-- Number of times `v' appears in `a_container'
		local
			a_cursor: like cursor
		do
			from
				a_cursor := a_container.new_cursor
				a_cursor.start
				search_forth (a_cursor, v)
			until
				a_cursor.after
			loop
				Result := Result + 1
				search_forth (a_cursor, v)
			end
		end

feature -- Search

	search_forth (a_cursor: like cursor; v: G) is
			-- Move to first position at or after `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `after' if not found.
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: a_cursor.is_valid
			not_cursor_off: not a_cursor.off or a_cursor.after
		deferred
		end

feature {NONE} -- Anchor types

	container: DS_LINEAR [G] is do end
	cursor: DS_LINEAR_CURSOR [G] is do end
			-- Anchor types

end -- class DS_LINEAR_SEARCHER
