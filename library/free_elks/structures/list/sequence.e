indexing

	description: "[
		Finite sequences: structures where existing items are arranged
		and accessed sequentially, and new ones can be added at the end.
		]"

	status: "See notice at end of class"
	names: sequence;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class SEQUENCE [G] inherit

	ACTIVE [G]
		redefine
			prune_all
		end

	BILINEAR [G]

	FINITE [G]

feature -- Status report

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		do
			Result := not off
		end


	writable: BOOLEAN is
			-- Is there a current item that may be modified?
		do
			Result := not off
		end

feature -- Element change

	force (v: like item) is
			-- Add `v' to end.
		require
			extendible: extendible
		do
			extend (v)
		ensure then
	 		new_count: count = old count + 1
			item_inserted: has (v)
		end

	append (s: SEQUENCE [G]) is
			-- Append a copy of `s'.
		require
			argument_not_void: s /= Void
		local
			l: like s
		do
			if s = Current then
				l := s.twin
			else
				l := s
			end
			from
				l.start
			until
				l.exhausted
			loop
				extend (l.item)
				l.forth
			end
		ensure
	 		new_count: count >= old count
		end

	put (v: like item) is
			-- Add `v' to end.
		do
			extend (v)
		ensure then
	 		new_count: count = old count + 1
		end

feature -- Removal

	prune (v: like item) is
			-- Remove the first occurrence of `v' if any.
			-- If no such occurrence go `off'.
		do
			start
			search (v)
			if not exhausted then
				remove
			end
		end

	prune_all (v: like item) is
			-- Remove all occurrences of `v'; go `off'.
		do
			from
				start
			until
				exhausted
			loop
				search (v)
				if not exhausted then
					remove
				end
			end
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

end -- class SEQUENCE



