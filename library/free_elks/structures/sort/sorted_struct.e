indexing

	description:
		"Structures whose items are sorted according to a total order relation"

	status: "See notice at end of class"
	names: sorted_struct, comparable_struct;
	access: index, membership, min, max;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class SORTED_STRUCT [G -> COMPARABLE] inherit

	COMPARABLE_STRUCT [G]
		undefine
			search, off
		redefine
			min, max
		end

	INDEXABLE [G, INTEGER]
		rename
			item as i_th,
			put as put_i_th,
			bag_put as putt
		redefine
			putt
		end

	LINEAR [G]

feature -- Measurement

	min: like item is
			-- Minimum item
		require else
			is_sorted: sorted
		do
			start
			Result := item
		ensure then
		--	smallest:
		--		 For every `i' in `first_position' .. `last_position':
		--				`Result <= i_th (i)';
		--		 `Result' = `i_th' (`first_position')
		end

	max: like item is
			-- Maximum item
		require else
			is_sorted: sorted
		do
			finish
			Result := item
		ensure then
		--	largest:
		--		 For every `i' in `first_position' .. `last_position':
		--				`i_th (`i') <= `Result';
		--		 `Result' = `i_th' (`last_position')
		end

	median: like item is
			-- Median element
		deferred
		ensure
			median_present: has (Result)
		--	median_definition:
		--		Result = i_th (first_position +
		--			(last_position - first_position) // 2)
		end

feature -- Status report

	sorted: BOOLEAN is
			-- Is structure sorted?
		local
			m: like item
		do
			if is_empty then
				Result := True
			else
				from
					start
					m := item
					forth
				until
					exhausted or else (item < m)
				loop
					m := item
					forth
				end
				Result := exhausted
			end
		end

feature -- Transformation

	sort is
			-- Sort structure.
		deferred
		ensure
			is_sorted: sorted
		end

feature {NONE} -- Inapplicable

	putt (v: like item) is
		do
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

end -- class SORTED_STRUCT



