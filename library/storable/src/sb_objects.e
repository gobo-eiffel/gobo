note

	description:

		"Set of objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_OBJECTS

inherit

	ANY

	SB_CONSTANTS
		export {NONE} all end

	SB_SHARED_READERS
		export {NONE} all end

	SB_SHARED_WRITERS
		export {NONE} all end

	PLATFORM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create an empty set of objects.
		do
			create objects.make_map (0)
			create boolean_objects.make_map (2)
			create character_8_objects.make_map (256)
			create character_32_objects.make_map (256)
			create integer_8_objects.make_map (256)
			create integer_16_objects.make_map (65000)
			create integer_32_objects.make_map (1000000)
			create integer_64_objects.make_map (1000000)
			create natural_8_objects.make_map (256)
			create natural_16_objects.make_map (65000)
			create natural_32_objects.make_map (1000000)
			create natural_64_objects.make_map (1000000)
			create pointer_objects.make_map (520)
			create real_32_objects.make_map (1000000)
			create real_64_objects.make_map (1000000)
			real_32_objects.set_hash_function (create {KL_AGENT_HASH_FUNCTION [REAL_32]}.make (agent real_32_hash_code))
			real_64_objects.set_hash_function (create {KL_AGENT_HASH_FUNCTION [REAL_64]}.make (agent real_64_hash_code))
		end

feature -- Access

	root_object: detachable SB_REFERENCE_OBJECT
			-- Root object read from STORABLE file;
			-- Void if no object read yet
		do
			if not objects.is_empty then
				Result := objects.last
			end
		end

	objects: DS_MULTIARRAYED_HASH_TABLE [SB_REFERENCE_OBJECT, NATURAL_64]
			-- Objects read from STORABLE file, index by address

	boolean_objects: DS_HASH_TABLE [SB_BOOLEAN_OBJECT, BOOLEAN]
			-- Boolean objects read from STORABLE file, index by value

	character_8_objects: DS_HASH_TABLE [SB_CHARACTER_8_OBJECT, CHARACTER_8]
			-- Character_8 objects read from STORABLE file, index by value

	character_32_objects: DS_HASH_TABLE [SB_CHARACTER_32_OBJECT, NATURAL_32]
			-- Character_32 objects read from STORABLE file, index by value

	integer_8_objects: DS_HASH_TABLE [SB_INTEGER_8_OBJECT, INTEGER_8]
			-- Integer_8 objects read from STORABLE file, index by value

	integer_16_objects: DS_MULTIARRAYED_HASH_TABLE [SB_INTEGER_16_OBJECT, INTEGER_16]
			-- Integer_16 objects read from STORABLE file, index by value

	integer_32_objects: DS_MULTIARRAYED_HASH_TABLE [SB_INTEGER_32_OBJECT, INTEGER_32]
			-- Integer_32 objects read from STORABLE file, index by value

	integer_64_objects: DS_MULTIARRAYED_HASH_TABLE [SB_INTEGER_64_OBJECT, INTEGER_64]
			-- Integer_64 objects read from STORABLE file, index by value

	natural_8_objects: DS_HASH_TABLE [SB_NATURAL_8_OBJECT, NATURAL_8]
			-- Natural_8 objects read from STORABLE file, index by value

	natural_16_objects: DS_MULTIARRAYED_HASH_TABLE [SB_NATURAL_16_OBJECT, NATURAL_16]
			-- Natural_16 objects read from STORABLE file, index by value

	natural_32_objects: DS_MULTIARRAYED_HASH_TABLE [SB_NATURAL_32_OBJECT, NATURAL_32]
			-- Natural_32 objects read from STORABLE file, index by value

	natural_64_objects: DS_MULTIARRAYED_HASH_TABLE [SB_NATURAL_64_OBJECT, NATURAL_64]
			-- Natural_64 objects read from STORABLE file, index by value

	real_32_objects: DS_MULTIARRAYED_HASH_TABLE [SB_REAL_32_OBJECT, REAL_32]
			-- Real_32 objects read from STORABLE file, index by value
			-- (Note that it does not contain NaN values: there
			-- is a problem when storing NaN values in a hash-table
			-- because they are not equal to each others. Use
			-- `nan_real_32_object' instead.)

	nan_real_32_object: detachable SB_REAL_32_OBJECT
			-- Real_32 object corresponding to the NaN value

	real_64_objects: DS_MULTIARRAYED_HASH_TABLE [SB_REAL_64_OBJECT, REAL_64]
			-- Real_64 objects read from STORABLE file, index by value
			-- (Note that it does not contain NaN values: there
			-- is a problem when storing NaN values in a hash-table
			-- because they are not equal to each others. Use
			-- `nan_real_64_object' instead.)

	nan_real_64_object: detachable SB_REAL_64_OBJECT
			-- Real_64 object corresponding to the NaN value

	pointer_objects: DS_MULTIARRAYED_HASH_TABLE [SB_POINTER_OBJECT, NATURAL_64]
			-- Pointer objects read from STORABLE file, index by value

	references (a_object: SB_REFERENCE_OBJECT): DS_ARRAYED_LIST [SB_REFERENCE_OBJECT]
			-- Objects that reference `a_object' (objects that have `a_object' as attribute)
		require
			a_object_not_void: a_object /= Void
		local
			nb: INTEGER
			l_reference: SB_REFERENCE_OBJECT
			l_cursor: DS_MULTIARRAYED_HASH_TABLE_CURSOR [SB_REFERENCE_OBJECT, NATURAL_64]
		do
			nb := a_object.reference_count
			create Result.make (nb)
			l_cursor := objects.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_reference := l_cursor.item
				if l_reference.has_reference (a_object) then
					Result.force_last (l_reference)
				end
				l_cursor.forth
			end
		ensure
			references_not_void: Result /= Void
			no_void_reference: not Result.has_void
		end

	shortest_path (a_object1, a_object2: SB_REFERENCE_OBJECT): DS_ARRAYED_LIST [SB_REFERENCE_OBJECT]
			-- One of the shortest paths from `a_object1' to `a_object2';
			-- Empty if there is no path between these two objects
		require
			a_object1_not_void: a_object1 /= Void
			a_object2_not_void: a_object2 /= Void
		local
			l_depths: DS_MULTIARRAYED_HASH_TABLE [INTEGER, SB_REFERENCE_OBJECT]
			l_cursor: DS_MULTIARRAYED_HASH_TABLE_CURSOR [INTEGER, SB_REFERENCE_OBJECT]
			l_object: SB_REFERENCE_OBJECT
			l_item: SB_REFERENCE_OBJECT
			i, nb: INTEGER
			l_count: INTEGER
		do
			if a_object1 = a_object2 then
				create Result.make (1)
				Result.put_last (a_object1)
			else
					-- First, we try to collect in `l_depths' the shortest distance from
					-- `a_object1' to the given objects. We stop populating `l_depths' when
					-- the shortest distance from `a_object1' to `a_object2' is known.
				create l_depths.make_map (objects.count)
				l_count := 1
				l_depths.force_last (l_count, a_object1)
				l_cursor := l_depths.new_cursor
				from
					l_cursor.start
				until
					l_cursor.after
				loop
					if attached {SB_COMPOSITE_OBJECT} l_cursor.key as l_composite_object then
						l_count := l_cursor.item + 1
						from
							i := l_composite_object.lower
							nb := l_composite_object.upper
						until
							i > nb
						loop
							if attached {SB_REFERENCE_OBJECT} l_composite_object.item (i) as l_ref_item and then not l_depths.has (l_ref_item) then
								l_depths.force_last (l_count, l_ref_item)
								if l_ref_item = a_object2 then
										-- Jump out of the loops.
									i := nb + 1
									l_cursor.finish
								end
							end
							i := i + 1
						end
					end
					l_cursor.forth
				end
				l_cursor.finish
				l_item := l_cursor.key
				if l_item /= a_object2 then
						-- We didn't find a path from `a_object1' to `a_object2'.
					create Result.make (0)
				else
						-- Now, start from `a_object2' and reconstruct the path from `a_object1'.
					from
						l_count := l_cursor.item
						create Result.make (l_count)
						Result.put_first (l_item)
						l_cursor.back
					until
						l_cursor.before
					loop
						if l_cursor.item /= l_count then
							l_object := l_cursor.key
							if l_object.has_reference (l_item) then
								Result.force_first (l_object)
								l_item := l_object
								l_count := l_cursor.item
							end
						end
						l_cursor.back
					end
					if Result.first /= a_object1 then
							-- This should never happen.
						Result.wipe_out
					end
				end
			end
		ensure
			path_not_void: Result /= Void
			no_void_object: not Result.has_void
			first: not Result.is_empty implies Result.first = a_object1
			last: not Result.is_empty implies Result.last = a_object2
		end

feature -- Measurement

	count: INTEGER
			-- Number of objects
		do
			Result := objects.count
		ensure
			count_non_negative: Result >= 0
		end

feature -- Element change

	set_nan_real_32_object (a_nan_object: like nan_real_32_object)
			-- Set `nan_real_32_object' to `a_nan_object'.
		do
			nan_real_32_object := a_nan_object
		ensure
			nan_real_32_object_set: nan_real_32_object = a_nan_object
		end

	set_nan_real_64_object (a_nan_object: like nan_real_64_object)
			-- Set `nan_real_64_object' to `a_nan_object'.
		do
			nan_real_64_object := a_nan_object
		ensure
			nan_real_64_object_set: nan_real_64_object = a_nan_object
		end

	reset
			-- Accommodate possible changes in objects' types.
		local
			a_cursor: DS_MULTIARRAYED_HASH_TABLE_CURSOR [SB_REFERENCE_OBJECT, NATURAL_64]
		do
			a_cursor := objects.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.reset
				a_cursor.forth
			end
		end

feature -- Actions

	read_objects_action: detachable PROCEDURE [SB_INPUT_FILE, INTEGER, INTEGER]
			-- Action executed when reading objects

	set_read_objects_action (an_action: like read_objects_action)
			-- Set `read_objects_action' to `an_action'.
		do
			read_objects_action := an_action
		ensure
			read_objects_action_set: read_objects_action = an_action
		end

	write_objects_action: detachable PROCEDURE [SB_OUTPUT_FILE, INTEGER, INTEGER]
			-- Action executed when writing objects

	set_write_objects_action (an_action: like write_objects_action)
			-- Set `write_objects_action' to `an_action'.
		do
			write_objects_action := an_action
		ensure
			write_objects_action_set: write_objects_action = an_action
		end

feature -- Input

	read_objects (a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read objects from `a_file', using `a_schema'.
		require
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_error_handler: SB_ERROR_HANDLER
			l_old_error_handler: SB_ERROR_HANDLER
		do
			l_error_handler := a_file.error_handler
			inspect a_schema.storable_format
			when Independent_store_6_6 then
				l_old_error_handler := independent_store_6_6_reader.error_handler
				independent_store_6_6_reader.set_error_handler (l_error_handler)
				independent_store_6_6_reader.read_objects (Current, a_schema, a_file)
				independent_store_6_6_reader.set_error_handler (l_old_error_handler)
			else
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: 0x" + a_schema.storable_format.to_hex_string)
			end
		end

feature -- Output

	write_objects (a_schema: SB_SCHEMA; a_file: SB_OUTPUT_FILE)
			-- Write objects to `a_file', using `a_schema'.
		require
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			inspect a_schema.storable_format
			when Independent_store_6_6 then
--				independent_store_6_6_writer.write_objects (Current, a_file)
			else
--				independent_store_6_3_writer.write_objects (Current, a_file)
			end
		end

feature {NONE} -- Implementation

	real_32_hash_code (r: REAL_32): INTEGER
			-- Hash code for `r'
		local
			l_pointer: MANAGED_POINTER
		do
			create l_pointer.make (Integer_32_bytes.max (Real_32_bytes))
			l_pointer.put_real_32 (r, 0)
			Result := l_pointer.read_integer_32 (0).hash_code
		ensure
			hash_code_not_negative: Result >= 0
		end

	real_64_hash_code (r: REAL_64): INTEGER
			-- Hash code for `r'
		do
			Result := real_32_hash_code (r.truncated_to_real)
		ensure
			hash_code_not_negative: Result >= 0
		end

invariant

	objects_not_void: objects /= Void
	no_void_object: not objects.has_void_item
	boolean_objects_not_void: boolean_objects /= Void
	no_void_boolean_object: not boolean_objects.has_void_item
	character_8_objects_not_void: character_8_objects /= Void
	no_void_character_8_object: not character_8_objects.has_void_item
	character_32_objects_not_void: character_32_objects /= Void
	no_void_character_32_object: not character_32_objects.has_void_item
	integer_32_objects_not_void: integer_32_objects /= Void
	no_void_integer_32_object: not integer_32_objects.has_void_item
	integer_8_objects_not_void: integer_8_objects /= Void
	no_void_integer_8_object: not integer_8_objects.has_void_item
	integer_16_objects_not_void: integer_16_objects /= Void
	no_void_integer_16_object: not integer_16_objects.has_void_item
	integer_64_objects_not_void: integer_64_objects /= Void
	no_void_integer_64_object: not integer_64_objects.has_void_item
	natural_8_objects_not_void: natural_8_objects /= Void
	no_void_natural_8_object: not natural_8_objects.has_void_item
	natural_16_objects_not_void: natural_16_objects /= Void
	no_void_natural_16_object: not natural_16_objects.has_void_item
	natural_32_objects_not_void: natural_32_objects /= Void
	no_void_natural_32_object: not natural_32_objects.has_void_item
	natural_64_objects_not_void: natural_64_objects /= Void
	no_void_natural_64_object: not natural_64_objects.has_void_item
	pointer_objects_not_void: pointer_objects /= Void
	no_void_pointer_object: not pointer_objects.has_void_item
	real_32_objects_not_void: real_32_objects /= Void
	no_void_real_32_object: not real_32_objects.has_void_item
	real_64_objects_not_void: real_64_objects /= Void
	no_void_real_64_object: not real_64_objects.has_void_item

end
