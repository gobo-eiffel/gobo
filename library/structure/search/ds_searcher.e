indexing

	description:

		"Structure searchers"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SEARCHER [G]

feature -- Status report

	has (a_container: DS_SEARCHABLE [G]; v: G): BOOLEAN is
			-- Does `a_container' include `v'?
		require
			a_container_not_void: a_container /= Void
		deferred
		ensure
			not_empty: Result implies not a_container.is_empty
		end

feature -- Measurement

	occurrences (a_container: DS_SEARCHABLE [G]; v: G): INTEGER is
			-- Number of times `v' appears in `a_container'
		deferred
		ensure
			positive: Result >= 0
			has: a_container.has (v) implies Result >= 1
		end

end -- class DS_SEARCHER
