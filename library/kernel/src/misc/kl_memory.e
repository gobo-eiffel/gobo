note

	description:

		"Facilities for tuning up the garbage collection mechanism"

	usage: "[
		This class should not be used directly through
		inheritance and client/supplier relationship.
		Inherit from KL_SHARED_MEMORY instead.
	]"
	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_MEMORY

inherit

	KI_MEMORY

	MEMORY
		rename
			collecting as memory_collecting,
			collection_off as memory_collection_off,
			collection_on as memory_collection_on,
			collect as memory_collect,
			full_collect as memory_full_collect,
			full_coalesce as memory_full_coalesce

		export
			{NONE} all
		end

feature -- Status report

	collecting: BOOLEAN
			-- Is garbage collection enabled?
		do
			Result := memory_collecting
		end

feature -- Status setting

	collection_off
			-- Disable garbage collection.
		do
			memory_collection_off
		end

	collection_on
			-- Enable garbage collection.
		do
			memory_collection_on
		end

feature -- Garbage collection

	collect
			-- Force a partial collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		do
			memory_collect
		end

	full_collect
			-- Force a full collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		do
			memory_full_collect
		end

	full_coalesce
			-- Coalesce the whole memory: merge adjacent free
			-- blocks to reduce fragmentation. Useful, when
			-- a lot of memory is allocated with garbage collector off.
		do
			memory_full_coalesce
		end

end
