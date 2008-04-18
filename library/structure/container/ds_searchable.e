indexing

	description:

		"Data structures that can be searched"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_SEARCHABLE [G]

inherit

	DS_CONTAINER [G]

	KL_IMPORTED_ANY_ROUTINES
		undefine
			copy, is_equal
		end

feature -- Status report

	has (v: G): BOOLEAN is
			-- Does container include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		ensure
			not_empty: Result implies not is_empty
		end

	has_void: BOOLEAN is
			-- Does container include Void?
		local
			v: G
		do
			if v = Void then
				Result := has (v)
			end
		ensure
			not_empty: Result implies not is_empty
		end

	same_items (v, u: G): BOOLEAN is
			-- Are `v' and `u' considered equal?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		do
			if equality_tester /= Void then
				Result := equality_tester.test (v, u)
			else
				Result := (v = u)
			end
		end

	same_equality_tester (other: DS_SEARCHABLE [G]): BOOLEAN is
			-- Does container use the same comparison
			-- criterion as `other'?
		require
			other_not_void: other /= Void
		do
			Result := ANY_.equal_objects (equality_tester, other.equality_tester)
		end

	equality_tester_settable (a_tester: like equality_tester): BOOLEAN is
			-- Can `set_equality_tester' be called with `a_tester'
			-- as argument in current state of container?
			-- (Default answer: True.)
		do
			Result := True
		end

feature -- Measurement

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in container
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		ensure
			positive: Result >= 0
			has: has (v) implies Result >= 1
		end

feature -- Access

	equality_tester: KL_EQUALITY_TESTER [G]
			-- Equality tester;
			-- A void equality tester means that `='
			-- will be used as comparison criterion.

feature -- Setting

	set_equality_tester (a_tester: like equality_tester) is
			-- Set `equality_tester' to `a_tester'.
			-- A void equality tester means that `='
			-- will be used as comparison criterion.
		require
			equality_tester_settable: equality_tester_settable (a_tester)
		do
			equality_tester := a_tester
		ensure
			equality_tester_set: equality_tester = a_tester
		end

end
