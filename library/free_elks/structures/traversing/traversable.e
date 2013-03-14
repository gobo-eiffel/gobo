note
	description: "[
		Structures for which there exists a traversal policy
		that will visit every element exactly once.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: traversable, traversing;
	access: cursor;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class
	TRAVERSABLE [G]

inherit

	CONTAINER [G]

feature -- Access

	item: G
			-- Item at current position
		require
			not_off: not off
		deferred
		end

feature -- Status report

	off: BOOLEAN
			-- Is there no current item?
		deferred
		end

feature -- Cursor movement

	start
			-- Move to first position if any.
		deferred
		end

feature -- Iteration


	do_all (action: PROCEDURE [ANY, TUPLE [G]])
			-- Apply `action' to every item.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_exists: action /= Void
		do
			linear_representation.do_all (action)
		end

	do_if (action: PROCEDURE [ANY, TUPLE [G]];
	 test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item that satisfies `test'.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_exists: action /= Void
			test_exists: test /= Void
			-- test.is_pure
		do
			linear_representation.do_if (action, test)
		end

	there_exists (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `test' true for at least one item?
		require
			test_exists: test /= Void
			-- test.is_pure
		do
			Result := linear_representation.there_exists (test)
		end

	for_all (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `test' true for all items?
		require
			test_exists: test /= Void
			-- test.is_pure
		do
			Result := linear_representation.for_all (test)
		end

invariant

	empty_constraint: is_empty implies off

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
