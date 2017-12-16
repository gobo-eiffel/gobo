note

	description:

		"Data structures whose items appear only once"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_SET [G]

inherit

	DS_LINEAR [G]
		redefine
			new_cursor,
			occurrences,
			equality_tester_settable
		end

	DS_EXTENDIBLE [G]
		rename
			put as put_last,
			force as force_last,
			extend as extend_last,
			append as append_last
		undefine
			equality_tester_settable
		redefine
			put_last,
			force_last,
			extend_last,
			append_last
		end

feature -- Access

	at alias "@", item (v: G): G
			-- Item equal to `v' held in set
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			has_v: has (v)
		deferred
		ensure
			definition: same_items (Result, v)
		end

	new_cursor: DS_SET_CURSOR [G]
			-- New external cursor for traversal
		deferred
		end

feature -- Status report

	is_subset (other: DS_SET [G]): BOOLEAN
			-- Are all items of current set included in `other'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		deferred
		end

	is_superset (other: DS_SET [G]): BOOLEAN
			-- Does current set include all items of `other'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		do
			Result := other.is_subset (Current)
		ensure
			definition: Result = other.is_subset (Current)
		end

	is_disjoint (other: DS_SET [G]): BOOLEAN
			-- Are none of the items of current set included in `other'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		deferred
		end

	equality_tester_settable (a_tester: like equality_tester): BOOLEAN
			-- Can `set_equality_tester' be called with `a_tester'
			-- as argument in current state of container?
			-- (Answer: the set has to be empty.)
		do
			Result := is_empty
		end

feature -- Measurement

	occurrences (v: G): INTEGER
			-- Number of times `v' appears in set
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		do
			if has (v) then
				Result := 1
			end
		ensure then
			has_v: has (v) implies (Result = 1)
			not_has_v: not has (v) implies (Result = 0)
		end

feature -- Access

	union (other: DS_SET [G]): like Current
			-- Clone of current set to which all items
			-- of `other' have been added
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		do
			Result := cloned_object
			Result.merge (other)
		ensure
			union_not_void: Result /= Void
			is_superset: Result.is_superset (other)
		end

	intersection (other: DS_SET [G]): like Current
			-- Clone of current set from with all items
			-- not included in `other' have been removed
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		do
			Result := cloned_object
			Result.intersect (other)
		ensure
			intersection_not_void: Result /= Void
			is_subset: Result.is_subset (other)
		end

	subtraction (other: DS_SET [G]): like Current
			-- Clone of current set from which all items
			-- also included in `other' have been removed
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		do
			Result := cloned_object
			Result.subtract (other)
		ensure
			subtraction_not_void: Result /= Void
			is_disjoint: Result.is_disjoint (other)
		end

	symdifference (other: DS_SET [G]): like Current
			-- Clone of current clone to which items of `other'
			-- which are not included in current set have been
			-- added and from which those which are current set
			-- have been removed
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		do
			Result := cloned_object
			Result.symdif (other)
		ensure
			symdifference_not_void: Result /= Void
		end

feature -- Element change

	put (v: G)
			-- Add `v' to set, replacing any existing item.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			extendible: extendible (1) or else has (v)
		deferred
		ensure
			inserted: has (v) and then item (v) = v
			same_count: (old has (v)) implies (count = old count)
			one_more: (not old has (v)) implies (count = old count + 1)
		end

	put_new (v: G)
			-- Add `v' to set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			extendible: extendible (1)
			new_item: not has (v)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: has (v) and then item (v) = v
		end

	put_last (v: G)
			-- Add `v' to set, replacing any existing item.
			-- If `v' was not included yet, insert it at
			-- last position if implementation permits.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require else
			extendible_or_has: extendible (1) or else has (v)
		deferred
		ensure then
			inserted: has (v) and then item (v) = v
			same_count: (old has (v)) implies (count = old count)
			one_more: (not old has (v)) implies (count = old count + 1)
		end

	force (v: G)
			-- Add `v' to set, replacing any existing item.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		ensure
			inserted: has (v) and then item (v) = v
			same_count: (old has (v)) implies (count = old count)
			one_more: (not old has (v)) implies (count = old count + 1)
		end

	force_new (v: G)
			-- Add `v' to set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			new_item: not has (v)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: has (v) and then item (v) = v
		end

	force_last (v: G)
			-- Add `v' to set, replacing any existing item.
			-- If `v' was not included yet, insert it at
			-- last position if implementation permits.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		ensure then
			inserted: has (v) and then item (v) = v
			same_count: (old has (v)) implies (count = old count)
			one_more: (not old has (v)) implies (count = old count + 1)
		end

	extend (other: DS_LINEAR [G])
			-- Add items of `other' to set, replacing any existing item.
			-- Add `other.first' first, etc.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
		deferred
		end

	extend_last (other: DS_LINEAR [G])
			-- Add items of `other' to set, replacing any existing item.
			-- Add `other.first' first, etc.
			-- If items of `other' were not included yet, insert
			-- them at last position if implementation permits.
		deferred
		end

	append (other: DS_LINEAR [G])
			-- Add items of `other' to set, replacing any existing item.
			-- Add `other.first' first, etc.
		require
			other_not_void: other /= Void
		deferred
		end

	append_last (other: DS_LINEAR [G])
			-- Add items of `other' to set, replacing any existing item.
			-- Add `other.first' first, etc.
			-- If items of `other' were not included yet, insert
			-- them at last position if implementation permits.
		deferred
		end

feature -- Removal

	remove (v: G)
			-- Remove item equal to `v' from set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		ensure
			same_count: (not old has (v)) implies (count = old count)
			one_less: (old has (v)) implies (count = old count - 1)
			removed: not has (v)
		end

feature -- Basic operations

	merge (other: DS_SET [G])
			-- Add all items of `other' to current set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		deferred
		ensure
			is_superset: is_superset (other)
		end

	intersect (other: DS_SET [G])
			-- Remove all items not included in `other'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		deferred
		ensure
			is_subset: is_subset (other)
		end

	subtract (other: DS_SET [G])
			-- Remove all items also included in `other'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		deferred
		ensure
			is_disjoint: is_disjoint (other)
		end

	symdif (other: DS_SET [G])
			-- Add items of `other' which are not included
			-- in current set and remove those which are.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			other_not_void: other /= Void
			same_equality_tester: same_equality_tester (other)
		deferred
		end

end
