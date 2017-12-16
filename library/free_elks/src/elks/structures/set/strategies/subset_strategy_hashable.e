note
	description:
		"[
		Strategies for calculating several features for subsets containing
		HASHABLEs.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class SUBSET_STRATEGY_HASHABLE [G] inherit

	SUBSET_STRATEGY [G]

feature -- Comparison

	disjoint (set1, set2: TRAVERSABLE_SUBSET [G]): BOOLEAN
			-- Are `set1' and `set2' disjoint?
		local
			hash: HASH_TABLE [G, INTEGER]
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
					if attached {HASHABLE} set1.item as h1 then
						c := h1.hash_code
					else
						check
							hashable_item: False
								-- Because this strategy is used for hashable
								-- objects only.
						end
					end
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
							Result := set1.item /~ hash.found_item
						else
							Result := set1.item /= hash.found_item
						end
					end
					set1.forth
				end
				if Result and then not set2.after then
					if attached {HASHABLE} set2.item as h2 then
						c := h2.hash_code
					else
						check
							hashable_item: False
								-- Because this strategy is used for hashable
								-- objects only.
						end
					end
					hash.search (c)
					Result := not hash.found
					if Result then
						hash.put (set2.item, c)
					else
						if set1.object_comparison then
							Result := set2.item /~ hash.found_item
						else
							Result := set2.item /= hash.found_item
						end
					end
					set2.forth
				end
			end
		end

feature -- Basic operations

	symdif (set1, set2: TRAVERSABLE_SUBSET [G])
			-- Remove all items of `set1' that are also in `set2', and add all
			-- items of `set2' not already present in `set1'.
		local
			hash: HASH_TABLE [G, INTEGER]
			c: INTEGER
			eq: BOOLEAN
			h: detachable G
		do
			create hash.make (set1.count + set2.count)
			if set1.object_comparison then
				hash.compare_objects
			end
			from set1.start until set1.after loop
				if attached {HASHABLE} set1.item as h1 then
					hash.put (set1.item, h1.hash_code)
				else
					check
						hashable_item: False
							-- Because this strategy is only used when items
							-- are hashable.
					end
				end
				set1.forth
			end
			from set2.start until set2.after loop
				if attached {HASHABLE} set2.item as h2 then
					c := h2.hash_code
					hash.search (c)
					if hash.found then
						if set1.object_comparison then
							eq := set2.item ~ hash.found_item
						else
							eq := set2.item = hash.found_item
						end
						if eq then hash.remove (c) end
					else
						hash.put (set2.item, c)
					end
				else
					check
						hashable_item: False
							-- Because this strategy is only used when items
							-- are hashable.
					end
				end
				set2.forth
			end
			set1.wipe_out
			from hash.start until hash.after loop
				h := hash.item_for_iteration
				if h /= Void then
					set1.extend (h)
				end
				hash.forth
			end
		end

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
