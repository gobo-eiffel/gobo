indexing

	description: "[
		Objects that are able to iterate over two-way chains,
		on which they can perform repeated actions and tests according
		to a number of predefined control structures such as ``if'',
		``until'' and others.
		]"

	status: "See notice at end of class"
	names: iterators, iteration, two_way_chain_iterators,
			two_way_chain_iteration;
	traversal: sequential;
	exploration: forward, backward;
	date: "$Date$"
	revision: "$Revision$"

class TWO_WAY_CHAIN_ITERATOR [G] inherit

	LINEAR_ITERATOR [G]
		redefine
			target
		select
			start,
			forth,
			do_all,
			until_do,
			do_until,
			while_do,
			do_while,
			do_if,
			do_for,
			search,
			for_all,
			there_exists,
			until_continue,
			continue_until,
			while_continue,
			continue_while,
			continue_for,
			continue_search
		end

	LINEAR_ITERATOR [G]
		rename
			start as finish,
			forth as back,
			do_all as do_all_back,
			until_do as until_do_back,
			do_until as do_until_back,
			do_while as do_while_back,
			while_do as while_do_back,
			do_if as do_if_back,
			do_for as do_for_back,
			search as search_back,
			for_all as for_all_back,
			there_exists as there_exists_back,
			until_continue as until_continue_back,
			continue_until as continue_until_back,
			while_continue as while_continue_back,
			continue_while as continue_while_back,
			continue_for as continue_for_back,
			continue_search as continue_search_back
		redefine
			back, finish, target
		end
feature -- Access

	target: CHAIN [G]

feature -- Cursor movement

	finish is
			-- Move cursor of `target' to last position.
		do
			target.finish
		end

	back is
			-- Move cursor of `target' backward one position.
		do
			target.back
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

end -- class TWO_WAY_CHAIN_ITERATOR [G]



