note
	description: "[
		Collections of items, where each item may occur zero
		or more times, and the number of occurrences is meaningful.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: bag, access;
	access: membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class BAG [G] inherit

	COLLECTION [G]
		redefine
			extend
		end

feature -- Measurement

	occurrences (v: G): INTEGER
			-- Number of times `v' appears in structure
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		deferred
		ensure
			non_negative_occurrences: Result >= 0
		end

feature -- Element change

	extend (v: G)
			-- Add a new occurrence of `v'.
		deferred
		ensure then
				-- Commented due to the expensive nature of the check when inserting a new item
				-- in a containers with many items.
			-- one_more_occurrence: occurrences (v) = old (occurrences (v)) + 1
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
