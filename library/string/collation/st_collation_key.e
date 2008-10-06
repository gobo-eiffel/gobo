indexing

	description:

		"Objects that represent STRINGs for comparison"

	remark: "If two STRINGs are equal, then their collation keys are equal, and vice versa."
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_COLLATION_KEY

inherit

	HASHABLE

	KL_IMPORTED_ANY_ROUTINES

feature -- Access

	source: STRING is
			-- Associated string
		deferred
		ensure
			source_string_not_void: Result /= Void
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := source.hash_code
		end

feature -- Comparison

	three_way_comparison (other: like Current): INTEGER is
			-- Comparison of `Current' with `other'
		require
			other_key_not_void: other /= Void
			same_type: ANY_.same_types (Current, other)
		deferred
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end

end
