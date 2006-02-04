indexing
	description:
		"[
		Strategies for calculating several features for subsets containing
		HASHABLEs.
		]"

	status:	"See notice at end of class"
	date: "$Date$"
	revision: "$Revision$"

class SUBSET_STRATEGY_HASHABLE [G] inherit

	SUBSET_STRATEGY [G]

feature -- Comparison

	disjoint (set1, set2: TRAVERSABLE_SUBSET [G]): BOOLEAN is
			-- Are `set1' and `set2' disjoint?
		local
			hash: HASH_TABLE [G, INTEGER]
			h: HASHABLE
			c: INTEGER
		do
			create hash.make (set1.count + set2.count)
			if set1.object_comparison then
				hash.compare_objects
			end
			from
				Result := True
				set1.start
				set2.start
			until
				not Result or else (set1.after and set2.after)
			loop
				if not set1.after then
					h ?= set1.item
					check
						hashable_item: h /= Void
							-- Because this strategy is used for hashable
							-- objects only.
							
					end
					c := h.hash_code
					Result := not hash.has (c)
					if Result then 
						hash.put (set1.item, c) 
					else
						hash.search (c)
						check
							item_found: hash.found
								-- Because `has' has been queried before.
						end
						if set1.object_comparison then
							Result := not equal (set1.item, hash.found_item)
						else
							Result := (set1.item /= hash.found_item)
						end
					end
					set1.forth
				end
				if Result and then not set2.after then
					h ?= set2.item
					check
						hashable_item: h /= Void
							-- Because this strategy is used for hashable
							-- objects only.
					end
					c := h.hash_code
					hash.search (c)
					Result := not hash.found
					if Result then 
						hash.put (set2.item, c)
					else
						if set1.object_comparison then
							Result := not equal (set2.item, hash.found_item)
						else
							Result := (set2.item /= hash.found_item)
						end
					end
					set2.forth
				end
			end
		end
	
feature -- Basic operations

	symdif (set1, set2: TRAVERSABLE_SUBSET [G]) is
			-- Remove all items of `set1' that are also in `set2', and add all
			-- items of `set2' not already present in `set1'.
		local
			hash: HASH_TABLE [G, INTEGER]
			h: HASHABLE
			c: INTEGER
			eq: BOOLEAN
		do
			create hash.make (set1.count + set2.count)
			if set1.object_comparison then
				hash.compare_objects
			end
			from set1.start until set1.after loop
				h ?= set1.item
				check
					hashable_item: h /= Void
						-- Because this strategy is only used when items
						-- are hashable.
				end
				hash.put (set1.item, h.hash_code)
				set1.forth
			end
			from set2.start until set2.after loop
				h ?= set2.item
				check
					hashable_item: h /= Void
						-- Because this strategy is only used when items
						-- are hashable.
				end
				c := h.hash_code
				hash.search (c)
				if hash.found then
					if set1.object_comparison then
						eq := equal (set2.item, hash.found_item)
					else
						eq := (set2.item = hash.found_item)
					end
					if eq then hash.remove (h.hash_code) end
				else
					hash.put (set2.item, h.hash_code)
				end
				set2.forth
			end
			set1.wipe_out
			from hash.start until hash.after loop
				set1.extend (hash.item_for_iteration)
				hash.forth
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

end -- class SUBSET_STRATEGY_HASHABLE
