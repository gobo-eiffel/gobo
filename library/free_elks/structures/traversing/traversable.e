indexing

	description: "[
		Structures for which there exists a traversal policy
		that will visit every element exactly once.
		]"

	status: "See notice at end of class"
	names: traversable, traversing;
	access: cursor;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TRAVERSABLE [G]

inherit

	CONTAINER [G]

feature -- Access

	item: G is
			-- Item at current position
		require
			not_off: not off
		deferred
		end

feature -- Status report

	off: BOOLEAN is
			-- Is there no current item?
		deferred
		end

feature -- Cursor movement

	start is
			-- Move to first position if any.
		deferred
		end
		
feature -- Iteration

		
	do_all (action: PROCEDURE [ANY, TUPLE [G]]) is
			-- Apply `action' to every item.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead. 
		require
			action_exists: action /= Void
		do
			linear_representation.do_all (action)
		end

	do_if (action: PROCEDURE [ANY, TUPLE [G]];
	 test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item that satisfies `test'.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead. 
		require
			action_exists: action /= Void
			test_exits: test /= Void
			-- test.is_pure
		do
			linear_representation.do_if (action, test)
		end

	there_exists (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `test' true for at least one item?
		require
			test_exits: test /= Void
			-- test.is_pure
		do
			Result := linear_representation.there_exists (test)
		end

	for_all (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `test' true for all items?
		require
			test_exits: test /= Void
			-- test.is_pure
		do
			Result := linear_representation.for_all (test)
		end

invariant

	empty_constraint: is_empty implies off

indexing

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class TRAVERSABLE



