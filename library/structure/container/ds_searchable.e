indexing

	description:

		"Structures that can be searched"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SEARCHABLE [G]

inherit

	DS_CONTAINER [G]

feature -- Access

	searcher: DS_SEARCHER [G]
			-- Structure searcher

feature -- Setting

	set_searcher (a_searcher: like searcher) is
			-- Set `searcher' to `a_searcher'.
		require
			a_searcher_not_void: a_searcher /= Void
		do
			searcher := a_searcher
		ensure
			searcher_set: searcher = a_searcher
		end

feature -- Status report

	has (v: G): BOOLEAN is
			-- Does structure incluse `v'?
			-- (Use `searcher''s comparison criterion.)
		do
			Result := searcher.has (Current, v)
		ensure
			not_empty: Result implies not is_empty
		end

feature -- Measurement

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in structure
			-- (Use `searcher''s comparison criterion.)
		do
			Result := searcher.occurrences (Current, v)
		ensure
			positive: Result >= 0
			has: has (v) implies Result >= 1
		end

invariant

	searcher_not_void: searcher /= Void

end -- class DS_SEARCHABLE
