indexing

	description:

		"EiffelBase CONTAINER class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class CONTAINER [G]

inherit

	DS_CONTAINER [G]
		rename
			is_empty as empty
		undefine
			empty
		end

	ANY
		-- Give back their default implementation
		-- to `copy' and `is_equal'.

feature -- Status report

	has (v: G): BOOLEAN is
			-- Does structure include `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		deferred
		ensure
			not_found_in_empty: Result implies not empty
		end

	object_comparison: BOOLEAN
			-- Must search operations use `equal' rather than `='
			-- for comparing references? (Default: no, use `='.)

	changeable_comparison_criterion: BOOLEAN is
			-- May `object_comparison' be changed?
			-- (Answer: yes by default.)
		do
			Result := True
		end

feature -- Status setting

	compare_objects is
			-- Ensure that future search operations will use `equal'
			-- rather than `=' for comparing references.
		require
			changeable_comparison_criterion
		do
			object_comparison := True
		ensure
			object_comparison
		end

	compare_references is
			-- Ensure that future search operations will use `='
			-- rather than `equal' for comparing references.
		require
			changeable_comparison_criterion
		do
			object_comparison := False
		ensure
			reference_comparison: not object_comparison
		end

feature -- Conversion

	linear_representation: LINEAR [G] is
			-- Representation as a linear structure
		deferred
		end

feature -- Element change

	put (v: G) is
			-- Ensure that structure includes `v'.
			--| This feature has been added here to simulate
			--| repeated inheritance in descendant classes as
			--| found in the original EiffelBase classes.
		require
			extendible: extendible
		deferred
		ensure
			item_inserted: has (v)
		end

	extendible: BOOLEAN is
			-- May new items be added?
		deferred
		end

end -- class CONTAINER
