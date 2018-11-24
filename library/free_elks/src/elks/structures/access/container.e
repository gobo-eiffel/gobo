note
	description: "[
		Data structures of the most general kind,
		used to hold zero or more items.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: access;
	access: membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CONTAINER [G]

inherit
	ITERABLE [G]

feature -- Access

	has (v: G): BOOLEAN
			-- Does structure include `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		deferred
		ensure
			not_found_in_empty: Result implies not is_empty
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no element?
		deferred
		end

	empty: BOOLEAN
			-- Is there no element?
		obsolete
			"ELKS 2000: Use `is_empty' instead. [2017-05-31]"
		do
			Result := is_empty
		end

	object_comparison: BOOLEAN
			-- Must search operations use `equal' rather than `='
			-- for comparing references? (Default: no, use `='.)

	changeable_comparison_criterion: BOOLEAN
			-- May `object_comparison' be changed?
			-- (Answer: yes by default.)
		do
			Result := True
		end

feature -- Status setting

	compare_objects
			-- Ensure that future search operations will use `equal'
			-- rather than `=' for comparing references.
		require
			changeable_comparison_criterion: changeable_comparison_criterion
		do
			object_comparison := True
		ensure
			object_comparison
		end

	compare_references
			-- Ensure that future search operations will use `='
			-- rather than `equal' for comparing references.
		require
			changeable_comparison_criterion: changeable_comparison_criterion
		do
			object_comparison := False
		ensure
			reference_comparison: not object_comparison
		end

feature -- Conversion

	linear_representation: LINEAR [G]
			-- Representation as a linear structure
		deferred
		end

feature {NONE} -- Measurement

	estimated_count_of (other: ITERABLE [G]): INTEGER
			-- Estimated number of elements in `other`.
		do
			if attached {FINITE [G]} other as f then
				Result := f.count
			elseif attached {READABLE_INDEXABLE [G]} other as r then
				Result := r.upper - r.lower + 1
			end
		ensure
			instance_free: class
			non_negative_result: Result >= 0
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
