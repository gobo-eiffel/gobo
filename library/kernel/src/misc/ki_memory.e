note

	description:

		"Interface for facilities for tuning up the garbage collection mechanism"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_MEMORY

feature -- Status report

	collecting: BOOLEAN
			-- Is garbage collection enabled?
		deferred
		end

feature -- Status setting

	collection_off
			-- Disable garbage collection.
		deferred
		end

	collection_on
			-- Enable garbage collection.
		deferred
		end

feature -- Garbage collection

	collect
			-- Force a partial collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		deferred
		end

	full_collect
			-- Force a full collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		deferred
		end

	full_coalesce
			-- Coalesce the whole memory: merge adjacent free
			-- blocks to reduce fragmentation. Useful, when
			-- a lot of memory is allocated with garbage collector off.
		deferred
		end

end
