note

	description:

		"Data structures that can hold zero or more items"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_CONTAINER [G]

inherit

	ANY
		undefine
			copy,
			is_equal
		redefine
			is_equal
		end

	KL_CLONABLE
		undefine
			copy,
			is_equal
		redefine
			is_equal
		end

feature {NONE} -- Initialization

	make_default
			-- Create an empty container.
		deferred
		ensure
			empty: is_empty
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in container
		deferred
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is container empty?
		do
			Result := count = 0
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is current container equal to `other'?
		deferred
		ensure then
			same_count: Result implies count = other.count
		end

feature -- Removal

	wipe_out
			-- Remove all items from container.
		deferred
		ensure
			wiped_out: is_empty
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [ANY, TUPLE [G]])
			-- Apply `an_action' to every item.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		require
			an_action_not_void: an_action /= Void
		deferred
		end

	do_if (an_action: PROCEDURE [ANY, TUPLE [G]]; a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		deferred
		end

	there_exists (a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		require
			a_test_not_void: a_test /= Void
		deferred
		end

	for_all (a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		require
			a_test_not_void: a_test /= Void
		deferred
		end

invariant

	positive_count: count >= 0
	empty_definition: is_empty = (count = 0)

end
