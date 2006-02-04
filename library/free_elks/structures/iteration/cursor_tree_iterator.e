indexing

	description: "[
		Objects that are able to iterate over cursor trees, 
		on which they can perform repeated actions and tests according
		to a number of predefined control structures such as ``if'',
		``until'' and others.
		]"

	status: "See notice at end of class"
	names: iterators, iteration, cursor_tree_iterators,
		cursor_tree_iteration, tree_iterators, tree_iteration;
	exploration: depth_first, breadth_first;
	traversal: preorder, postorder, inorder;
	date: "$Date$"
	revision: "$Revision$"

class CURSOR_TREE_ITERATOR [G] inherit

		LINEAR_ITERATOR [G]
			rename
				do_all as pre_do_all,
				until_do as pre_until_do,
				do_until as pre_do_until,
				do_if as pre_do_if,
				search as pre_search,
				do_for as pre_do_for,
				do_while as pre_do_while,
				while_do as pre_while_do,
				while_continue as pre_while_continue,
				continue_while as pre_continue_while,
				continue_until as pre_continue_until,
				continue_search as pre_continue_search,
				continue_for as pre_continue_for,
				for_all as pre_for_all,
				there_exists as pre_there_exists,
				forth as pre_forth
			redefine
				target, pre_forth
			select
				pre_do_all, pre_until_do, pre_do_until,
				pre_do_if, pre_search, pre_do_for, pre_continue_until,
				pre_continue_search, pre_continue_for,
				pre_for_all, pre_there_exists, pre_forth, start,
				pre_while_do, pre_do_while, pre_continue_while,
				pre_while_continue
			end

		LINEAR_ITERATOR [G]
			rename
				do_all as post_do_all,
				until_do as post_until_do,
				do_until as post_do_until,
				do_if as post_do_if,
				search as post_search,
				do_for as post_do_for,
				do_while as post_do_while,
				while_do as post_while_do,
				while_continue as post_while_continue,
				continue_while as post_continue_while,
				continue_until as post_continue_until,
				continue_search as post_continue_search,
				continue_for as post_continue_for,
				for_all as post_for_all,
				there_exists as post_there_exists,
				forth as post_forth,
				start as post_start
			redefine
				post_forth,
				post_start,
				target
			end

		LINEAR_ITERATOR [G]
			rename
				do_all as breadth_do_all,
				until_do as breadth_until_do,
				do_until as breadth_do_until,
				do_if as breadth_do_if,
				search as breadth_search,
				do_for as breadth_do_for,
				do_while as breadth_do_while,
				while_do as breadth_while_do,
				while_continue as breadth_while_continue,
				continue_while as breadth_continue_while,
				continue_until as breadth_continue_until,
				continue_search as breadth_continue_search,
				continue_for as breadth_continue_for,
				for_all as breadth_for_all,
				there_exists as breadth_there_exists,
				forth as breadth_forth
			redefine
				breadth_forth, target
			end

feature -- Status report

	target: CURSOR_TREE [G]
			-- The structure to which iteration features will apply

feature -- Cursor movement

	pre_start, breadth_start is
			-- Move cursor of `target' to root position
			-- (first position in preorder and breadth-first).
		do
			target.start
		end

	post_start is
			-- Move cursor of `target' to first position in postorder.
		do
			target.postorder_start
		end

	pre_forth is
			-- Move cursor of `target' to next position in preorder.
		do
			target.preorder_forth
		end

	post_forth is
			-- Move cursor of `target' to next position in postorder.
		do
			target.postorder_forth
		end

	breadth_forth is
			-- Move cursor of `target' to next position in breadth-first.
		do
			target.breadth_forth
		end

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

end -- class CURSOR_TREE_ITERATOR



