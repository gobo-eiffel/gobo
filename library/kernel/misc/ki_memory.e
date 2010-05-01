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

	collecting: BOOLEAN is
			-- Is garbage collection enabled?
		deferred
		end

feature -- Status setting

	collection_off is
			-- Disable garbage collection.
		deferred
		end

	collection_on is
			-- Enable garbage collection.
		deferred
		end

feature -- Garbage collection

	collect is
			-- Force a partial collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		deferred
		end

	full_collect is
			-- Force a full collection cycle if garbage
			-- collection is enabled; do nothing otherwise.
		deferred
		end

	full_coalesce is
			-- Coalesce the whole memory: merge adjacent free
			-- blocks to reduce fragmentation. Useful, when
			-- a lot of memory is allocated with garbage collector off.
		deferred
		end

end
