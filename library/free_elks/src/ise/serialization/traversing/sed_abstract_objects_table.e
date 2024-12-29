note
	description: "[
		Abstract equivalent of HASH_TABLE [NATURAL_32, ANY], since this type cannot be written
		as ANY does not inherit from HASHABLE
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2013-03-27 07:34:50 +0000 (Wed, 27 Mar 2013) $"
	revision: "$Revision: 92359 $"

deferred class
	SED_ABSTRACT_OBJECTS_TABLE

feature {NONE} -- Initialization

	make (n: NATURAL_32)
			-- Initialize current instance
		require
			n_not_too_large: n <= {INTEGER}.max_value.to_natural_32
		deferred
		ensure
			last_index_set: last_index = 0
		end

feature -- Access

	index (an_obj: separate ANY): NATURAL_32
			-- Index of `an_obj' in Current
		require
			an_obj_not_void: an_obj /= Void
		deferred
		end

feature -- Status report

	capacity: INTEGER
			-- Default capacity of current.
		deferred
		ensure
			capacity_non_negative: Result >= 0
		end

feature -- Removal

	wipe_out
			-- Remove all items.
		deferred
		end

feature {NONE} -- Implementation

	last_index: NATURAL_32;
			-- Last index of inserted items.

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"






end
