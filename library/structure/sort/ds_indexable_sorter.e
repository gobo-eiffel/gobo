indexing

	description:

		"Indexable structure sorters";

	library:    "Gobo Eiffel Structure Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

deferred class DS_INDEXABLE_SORTER [G -> COMPARABLE]

inherit

	DS_SORTER [G]

feature -- Status report

	sorted (container: DS_INDEXABLE [G]): BOOLEAN is
			-- Is `container' sorted in increasing order?
		do
			Result := container.is_empty or else
				subsorted (container, 1, container.count)
		end

	subsorted (container: DS_INDEXABLE [G]; lower, upper: INTEGER): BOOLEAN is
			-- Is `container' sorted in increasing order
			-- within bounds `lower'..`upper'?
		require
			container_not_void: container /= Void
			valid_lower: container.valid_entry (lower)
			valid_upper: container.valid_entry (upper)
			constraint: lower <= upper
		local
			i: INTEGER
		do
			from
				i := lower
				Result := True
			until
				not Result or i >= upper
			loop
				Result := container.item (i) <= container.item (i + 1)
				i := i + 1
			end
		end	
			
feature -- Sort

	sort (container: DS_INDEXABLE [G]) is
			-- Sort `container' in increasing order?
		do
			if not container.is_empty then
				subsort (container, 1, container.count)
			end
		end
		
	subsort (container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `container' in increasing order
			-- within bounds `lower'..`upper'?
		require
			container_not_void: container /= Void
			valid_lower: container.valid_entry (lower)
			valid_upper: container.valid_entry (upper)
			constraint: lower <= upper
		deferred
		ensure
			subsorted: subsorted (container, lower, upper)
		end

end -- class DS_INDEXABLE_SORTER
