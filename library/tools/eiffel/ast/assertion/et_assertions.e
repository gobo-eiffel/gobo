indexing

	description:

		"Eiffel assertion lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_ASSERTIONS

inherit

	ET_AST_NODE

feature -- Access

	assertions: DS_ARRAYED_LIST [ET_ASSERTION]
			-- Assertions

	last: ET_ASSERTION is
			-- Last assertion inserted in `assertions'
		require
			not_empty: not is_empty
		do
			Result := assertions.last
		ensure
			last_not_void: Result /= Void
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is there no assertions in `assertions'?
		do
			Result := assertions.is_empty
		end

feature -- Element change

	put_last (an_assertion: ET_ASSERTION) is
			-- Add `an_assertion' to assertions.
		require
			an_assertion_not_void: an_assertion /= Void
		do
			assertions.force_last (an_assertion)
		ensure
			one_more: assertions.count = old assertions.count + 1
			assertion_added: assertions.last = an_assertion
		end

invariant

	assertions_not_void: assertions /= Void
	no_void_assertion: not assertions.has (Void)

end -- class ET_ASSERTIONS
