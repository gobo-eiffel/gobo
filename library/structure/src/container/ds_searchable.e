﻿note

	description:

		"Data structures that can be searched"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"

deferred class DS_SEARCHABLE [G]

inherit

	DS_CONTAINER [G]

feature -- Status report

	has (v: G): BOOLEAN
			-- Does container include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		ensure
			not_empty: Result implies not is_empty
		end

	has_void: BOOLEAN
			-- Does container include Void?
		local
			v: detachable G
		do
			if not ({G}).is_attached and then attached {DS_SEARCHABLE [detachable G]} Current as l_current and then v = Void then
				Result := l_current.has (v)
			end
		ensure
			not_empty: Result implies not is_empty
		end

	same_items (v, u: G): BOOLEAN
			-- Are `v' and `u' considered equal?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		do
			if attached equality_tester as l_equality_tester then
				Result := l_equality_tester.test (v, u)
			else
				Result := (v = u)
			end
		end

	same_equality_tester (other: DS_SEARCHABLE [G]): BOOLEAN
			-- Does container use the same comparison
			-- criterion as `other'?
		require
			other_not_void: other /= Void
		do
			Result := equality_tester ~ other.equality_tester
		end

	equality_tester_settable (a_tester: like equality_tester): BOOLEAN
			-- Can `set_equality_tester' be called with `a_tester'
			-- as argument in current state of container?
			-- (Default answer: True.)
		do
			Result := True
		end

feature -- Measurement

	occurrences (v: G): INTEGER
			-- Number of times `v' appears in container
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		ensure
			positive: Result >= 0
			has: has (v) implies Result >= 1
		end

feature -- Access

	equality_tester: detachable KL_EQUALITY_TESTER [G]
			-- Equality tester;
			-- A void equality tester means that `='
			-- will be used as comparison criterion.

feature -- Setting

	set_equality_tester (a_tester: like equality_tester)
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
