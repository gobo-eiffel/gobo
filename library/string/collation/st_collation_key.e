indexing

	description:
	
		"Objects that represent STRINGs for comparison."
	
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class ST_COLLATION_KEY

inherit

	ANY -- Needed for SE 2.1b1.

	HASHABLE

		-- If two STRINGs are equal, then their
		--  collation keys are equal, and vice versa.

feature -- Access

	source: STRING is
			-- String which `Current' represents
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
			same_implementation: generating_type.is_equal (other.generating_type)
		deferred
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end

end

	
