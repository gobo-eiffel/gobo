indexing

	description:

		"Structure searchers";

	library:    "Gobo Eiffel Structure Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

deferred class DS_SEARCHER [G]

feature -- Status report

	has (container: DS_SEARCHABLE [G]; v: G): BOOLEAN is
			-- Does `container' include `v'?
		require
			container_not_void: container /= Void
		deferred
		ensure
			not_empty: Result implies not container.is_empty
		end

feature -- Measurement

	occurrences (container: DS_SEARCHABLE [G]; v: G): INTEGER is
			-- Number of times `v' appears in `container'
		deferred
		ensure
			positive: Result >= 0
			has: container.has (v) implies Result >= 1
		end

end -- class DS_SEARCHER
