indexing

	description:

		"Linear structure searchers";

	library:    "Gobo Eiffel Structure Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

deferred class DS_LINEAR_SEARCHER [G]

inherit

	DS_SEARCHER [G]

feature -- Status report

#ifdef VE
--| [VE 2.0g - 24 May 1997]
--| VE compiler crashes because of 'like anchor'.
	has (a_container: DS_LINEAR [G]; v: G): BOOLEAN is
#else
	has (a_container: like container; v: G): BOOLEAN is
#endif
			-- Does `a_container' include `v'?
		local
#ifdef VE
--| [VE 2.0g - 24 May 1997]
--| VE compiler crashes because of 'like anchor'.
			a_cursor: DS_LINEAR_CURSOR [G]
#else
			a_cursor: like cursor
#endif
		do
			a_cursor := a_container.new_cursor
			a_cursor.start
			search_forth (a_cursor, v)
			Result := not a_cursor.after
		end

feature -- Measurement

#ifdef VE
--| [VE 2.0g - 24 May 1997]
--| VE compiler crashes because of 'like anchor'.
	occurrences (a_container: DS_LINEAR [G]; v: G): INTEGER is
#else
	occurrences (a_container: like container; v: G): INTEGER is
#endif
			-- Number of times `v' appears in `a_container'
		local
#ifdef VE
--| [VE 2.0g - 24 May 1997]
--| VE compiler crashes because of 'like anchor'.
			a_cursor: DS_LINEAR_CURSOR [G]
#else
			a_cursor: like cursor
#endif
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

#ifdef VE
--| [VE 2.0g - 24 May 1997]
--| VE compiler crashes because of 'like anchor'.
	search_forth (a_cursor: DS_LINEAR_CURSOR [G]; v: G) is
#else
	search_forth (a_cursor: like cursor; v: G) is
#endif
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
