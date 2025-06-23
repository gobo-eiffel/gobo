note

	description:

		"Objects made up of other objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_COMPOSITE_OBJECT

inherit

	SB_OBJECT

	HASHABLE

feature -- Access

	item (i: INTEGER): detachable SB_OBJECT
			-- Attribute or item at index `i'
		require
			valid_index: valid_index (i)
		deferred
		end

feature -- Measurement

	count: INTEGER_32
			-- Number of attributes or items
		do
			Result := items.count
		ensure
			count_not_negative: Result >= 0
		end

	lower: INTEGER_32
			-- Minimum index
		deferred
		end

	upper: INTEGER_32
			-- Maximum index
		do
			Result := count + lower - 1
		ensure
			definition: Result = (count + lower - 1)
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid attribute or item index?
		deferred
		ensure
			definition: Result = (i >= lower and i <= upper)
		end

feature -- Element change

	put (an_item: like item; i: INTEGER)
			-- Assign `an_item' to attribute or item at index `i'.
		require
			valid_index: valid_index (i)
		deferred
		ensure
			inserted: item (i) = an_item
		end

feature {SB_WRITER} -- Implementation

	items: SPECIAL [like item]
			-- Items

invariant

	items_not_void: items /= Void
	items_count: items.count = count

end
