indexing

	description:

		"Map of element sequence numbers to system-ids"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SYSTEM_ID_MAP

inherit

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

	-- SYSTEM IDs are not held in nodes in the tree, because they are usually the same
	--  for a whole document.
	-- This class provides a map from element sequence numbers to SYSTEM IDs:
	--  it is linked to the root node of the tree.
	-- Note that the SYSTEM ID is not necessarily the same as the Base URI. The SYSTEM ID relates
	--  to the external entity in which a node was physically located; this provides a default for
	--  the Base URI, but this may be modified by specifying an xml:base attribute

feature {NONE}  -- Initialization

	make is
			-- Establish invariant.
		do
			create sequence_numbers.make (10)
			create uris.make (10)
			uris.set_equality_tester (string_equality_tester)
		end

feature -- Access

	system_id (a_node_number: INTEGER): STRING is
			-- SYSTEM-ID for `a_node_number'
		require
			valid_node_number: True -- Can't check that here (?)
			at_least_one_system_id_allocated: number_allocated_uris > 0
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			from
				a_cursor := sequence_numbers.new_cursor
				a_cursor.start
			variant
				sequence_numbers.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				if a_cursor.item > a_node_number then
					a_cursor.go_after
				else
					Result := uris.item (a_cursor.index)
					a_cursor.forth
				end
			end
		ensure
			system_id_not_void: Result /= Void
		end

feature -- Measurement

	number_allocated_uris: INTEGER is
			-- Number of SYSTEM IDs allocated
		do
			Result := uris.count
		end

	highest_sequence_number: INTEGER is
			-- Highest sequence number specifically allocated to a SYSTEM ID.
		require
			at_least_one_allocation: number_allocated_uris > 0
		do
			Result := sequence_numbers.item (number_allocated_uris)
		end

feature -- Element change

	set_system_id (a_node_number: INTEGER; a_uri: STRING) is
			-- Set SYSTEM ID for `a_node_number' to `a_uri'.
		require
			higher_node_number: number_allocated_uris > 0 implies a_node_number > highest_sequence_number
			uri_not_void: a_uri /= Void -- it might just be an empty string, though
		local
			a_size: INTEGER
		do
			if uris.count > 0 and then STRING_.same_string(uris.item (uris.count), a_uri) then

				-- Ignore, if it is the same as the previous one

			else
				if not sequence_numbers.extendible (1) then
					a_size := 2 * sequence_numbers.count
					sequence_numbers.resize (a_size)
					uris.resize (a_size)
				end
				sequence_numbers.put_last (a_node_number)
				uris.put_last (a_uri)
			end
		ensure
			set: STRING_.same_string (system_id (a_node_number), a_uri)
			maybe_one_more: uris.count = old uris.count or else uris.count = old uris.count + 1
		end

feature {NONE} -- Implementation

	sequence_numbers: DS_ARRAYED_LIST [INTEGER]
			-- Sequence numbers of initial nodes within an entity;
			-- Stored in ascending order

	uris: DS_ARRAYED_LIST [STRING]
			-- SYSTEM IDs corresponding to the entries in `sequence_numbers'

invariant

	sequence_numbers: sequence_numbers /= Void
	uris: uris /= Void
	same_count: uris.count = sequence_numbers.count

end

	
