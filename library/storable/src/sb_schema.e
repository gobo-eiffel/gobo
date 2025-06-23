note

	description:

		"Eiffel class schemas used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_SCHEMA

inherit

	ANY

	SB_CONSTANTS
		export {NONE} all end

	SB_SHARED_READERS
		export {NONE} all end

	SB_SHARED_WRITERS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create an empty schema.
		local
			l_class: SB_CLASS
		do
			create classes.make_filled (Void, 0, 0)
			maximum_class_index := 0
			class_count := 0
				-- Type BOOLEAN.
			create l_class.make (boolean_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_boolean (True)
			create boolean_type.make (l_class)
				-- Type CHARACTER_8.
			create l_class.make (character_8_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_character_8 (True)
			create character_8_type.make (l_class)
				-- Type CHARACTER_32.
			create l_class.make (character_32_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_character_32 (True)
			create character_32_type.make (l_class)
				-- Type INTEGER_32.
			create l_class.make (integer_32_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_integer_32 (True)
			create integer_32_type.make (l_class)
				-- Type INTEGER_8.
			create l_class.make (integer_8_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_integer_8 (True)
			create integer_8_type.make (l_class)
				-- Type INTEGER_16.
			create l_class.make (integer_16_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_integer_16 (True)
			create integer_16_type.make (l_class)
				-- Type INTEGER_64.
			create l_class.make (integer_64_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_integer_64 (True)
			create integer_64_type.make (l_class)
				-- Type NATURAL_8.
			create l_class.make (natural_8_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_natural_8 (True)
			create natural_8_type.make (l_class)
				-- Type NATURAL_16.
			create l_class.make (natural_16_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_natural_16 (True)
			create natural_16_type.make (l_class)
				-- Type NATURAL_32.
			create l_class.make (natural_32_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_natural_32 (True)
			create natural_32_type.make (l_class)
				-- Type NATURAL_64.
			create l_class.make (natural_64_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_natural_64 (True)
			create natural_64_type.make (l_class)
				-- Type REAL_32.
			create l_class.make (real_32_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_real_32 (True)
			create real_32_type.make (l_class)
				-- Type REAL_64.
			create l_class.make (real_64_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_real_64 (True)
			create real_64_type.make (l_class)
				-- Type POINTER.
			create l_class.make (pointer_class_name, -1)
			l_class.set_expanded (True)
			l_class.set_declared_expanded (True)
			l_class.set_pointer (True)
			create pointer_type.make (l_class)
				-- Type NONE.
			create none_type.make
			create attached_none_type.make
			attached_none_type.set_attached (True)
			create detachable_none_type.make
			detachable_none_type.set_detachable (True)
		end

feature -- Access

	classes: ARRAY [detachable SB_CLASS]
			-- Classes in current schema;
			-- May contain holes

	overhead_size: INTEGER_16
			-- Size (in bytes) of overhead in objects
			-- in memory

	maximum_class_index: INTEGER
			-- Maximum index in `classes'
			-- (int16)

	class_count: INTEGER
			-- Number of classes in schema
			-- (int16)

	storable_format: NATURAL_8
			-- Format used to write to Storable file

	storable_properties: CHARACTER_8
			-- Properties of the storable;
			-- So far it says if we have kept the attachment marks,
			-- or if we are using the old special semantic.

feature -- Basic types

	boolean_type: SB_CLASS_TYPE
			-- Type BOOLEAN

	character_8_type: SB_CLASS_TYPE
			-- Type CHARACTER_8

	character_32_type: SB_CLASS_TYPE
			-- Type CHARACTER_32

	integer_32_type: SB_CLASS_TYPE
			-- Type INTEGER_32

	integer_8_type: SB_CLASS_TYPE
			-- Type INTEGER_8

	integer_16_type: SB_CLASS_TYPE
			-- Type INTEGER_16

	integer_64_type: SB_CLASS_TYPE
			-- Type INTEGER_64

	natural_8_type: SB_CLASS_TYPE
			-- Type NATURAL_8

	natural_16_type: SB_CLASS_TYPE
			-- Type NATURAL_16

	natural_32_type: SB_CLASS_TYPE
			-- Type NATURAL_32

	natural_64_type: SB_CLASS_TYPE
			-- Type NATURAL_64

	real_32_type: SB_CLASS_TYPE
			-- Type REAL_32

	real_64_type: SB_CLASS_TYPE
			-- Type REAL_64

	pointer_type: SB_CLASS_TYPE
			-- Type POINTER

	none_type: SB_NONE_TYPE
			-- Type NONE

	attached_none_type: SB_NONE_TYPE
			-- Attached type NONE

	detachable_none_type: SB_NONE_TYPE
			-- Detachable type NONE

feature {SB_READER} -- Setting

	set_storable_format (a_format: NATURAL_8)
			-- Set `storable_format' to `a_format'.
		do
			storable_format := a_format
		ensure
			storable_format_set: storable_format = a_format
		end

	set_overhead_size (a_size: INTEGER_16)
			-- Set `overhead_size' to `a_size'.
		do
			overhead_size := a_size
		ensure
			overhead_size_set: overhead_size = a_size
		end

	set_maximum_class_index (a_max: INTEGER)
			-- Set `maximum_class_index' to `a_max'.
		require
			a_max_not_negative: a_max >= 0
		do
			class_count := 0
			maximum_class_index := a_max
			create classes.make_filled (Void, 0, maximum_class_index)
		ensure
			maximum_class_index_set: maximum_class_index = a_max
			class_count_reset: class_count = 0
		end

	set_class_count (a_count: INTEGER)
			-- Set `class_count' to `a_count'.
		require
			a_count_not_negative: a_count >= 0
			valid_class_count: a_count <= maximum_class_index + 1
		do
			class_count := a_count
		ensure
			class_count_set: class_count = a_count
		end

	set_storable_properties (a_properties: like storable_properties)
			-- Set `storable_properties' to `a_properties'.
		do
			storable_properties := a_properties
		ensure
			storable_properties_set: storable_properties = a_properties
		end

feature -- Status report

	has_attribute_type_error: BOOLEAN
			-- Has an error occurred when resolving types of attributes?
			-- Some older versions of Eiffel stored Storable files with incorrect
			-- values for the number of parameters in Tuple types, therefore
			-- we need to be tolerant on this kind of error. So the error is
			-- reported but error handler is not set and
			-- `has_attribute_type_error' is set instead.
		local
			i, nb: INTEGER
			l_class: detachable SB_CLASS
		do
			nb := maximum_class_index
			from i := 1 until i > nb loop
				l_class := classes.item (i)
				if l_class /= Void then
					if l_class.has_attribute_type_error then
						Result := True
						i := nb + 1 -- Jump out of the loop.
					end
				end
				i := i + 1
			end
		end

feature -- Actions

	read_schema_action: detachable PROCEDURE [SB_INPUT_FILE, INTEGER, INTEGER]
			-- Action executed when reading schema

	set_read_schema_action (an_action: like read_schema_action)
			-- Set `read_schema_action' to `an_action'.
		do
			read_schema_action := an_action
		ensure
			read_schema_action_set: read_schema_action = an_action
		end

	write_schema_action: detachable PROCEDURE [SB_OUTPUT_FILE, INTEGER, INTEGER]
			-- Action executed when writing schema

	set_write_schema_action (an_action: like write_schema_action)
			-- Set `write_schema_action' to `an_action'.
		do
			write_schema_action := an_action
		ensure
			write_schema_action_set: write_schema_action = an_action
		end

feature -- Element change

	reset
			-- Reset current schema as it was before last merge occurred.
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			nb := maximum_class_index
			from i := 0 until i > nb loop
				l_class := classes.item (i)
				if l_class /= Void then
					if l_class.is_added then
						classes.put (Void, i)
						class_count := class_count - 1
						if class_count = 0 then
							nb := 0
							maximum_class_index := nb
						elseif i = nb then
							from
								nb := nb - 1
							until
								classes.item (nb) /= Void
							loop
								nb := nb - 1
							end
							maximum_class_index := nb
						end
					else
						l_class.reset
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Element change

	add_storable_class (a_class: SB_CLASS)
			-- Add `a_class' to schema.
		require
			a_class_not_void: a_class /= Void
			not_valid_index: a_class.index < 0 or a_class.index > maximum_class_index
		local
			i, nb: INTEGER
			l_class: SB_CLASS
			done: BOOLEAN
		do
			a_class.set_added (True)
			nb := classes.upper
			from i := 0 until i > nb loop
				l_class := classes.item (i)
				if l_class = Void then
					a_class.set_index (i)
					classes.put (a_class, i)
					if i > maximum_class_index then
						maximum_class_index := i
					end
					class_count := class_count + 1
					done := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
			if not done then
				i := nb + 1
				classes.conservative_resize_with_default (Void, 0, i + 10)
				a_class.set_index (i)
				classes.put (a_class, i)
				if i > maximum_class_index then
					maximum_class_index := i
				end
				class_count := class_count + 1
			end
		ensure
			one_more: class_count = old class_count + 1
			valid_index: a_class.index >= 0 and a_class.index <= maximum_class_index
			inserted: classes.item (a_class.index) = a_class
			is_added: a_class.is_added
		end

feature -- Renaming

	rename_class (old_name, new_name: STRING)
			-- Rename class `old_name' as `new_name'.
		require
			old_name_not_void: old_name /= Void
			old_name_not_empty: not old_name.is_empty
			new_name_not_void: new_name /= Void
			new_name_not_empty: not new_name.is_empty
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			nb := maximum_class_index
			from i := 0 until i > nb loop
				l_class := classes.item (i)
				if l_class /= Void and then l_class.is_visible and then not l_class.is_added then
					if l_class.name.same_string (old_name) then
						l_class.set_name (new_name)
							-- Note that we don't jump out of the loop here because
							-- there might be several classes in the storable file
							-- with the same name when the class is generic with
							-- several expanded generic derivations.
					end
				end
				i := i + 1
			end
		end

	rename_attribute (a_class_name, old_name, new_name: STRING)
			-- Rename attribute `old_name' from class `a_class_name' as `new_name'.
		require
			a_class_name_not_void: a_class_name /= Void
			a_class_name_not_empty: not a_class_name.is_empty
			old_name_not_void: old_name /= Void
			old_name_not_empty: not old_name.is_empty
			new_name_not_void: new_name /= Void
			new_name_not_empty: not new_name.is_empty
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			nb := maximum_class_index
			from i := 0 until i > nb loop
				l_class := classes.item (i)
				if l_class /= Void and then l_class.is_visible and then not l_class.is_added then
					if l_class.name.same_string (a_class_name) then
						l_class.rename_attribute (old_name, new_name)
							-- Note that we don't jump out of the loop here because
							-- there might be several classes in the Storable file
							-- with the same name when the class is generic with
							-- several expanded generic derivations.
					end
				end
				i := i + 1
			end
		end

feature {SB_READER} -- Formal parameters

	resolve_formal_parameters (a_class: SB_CLASS)
			-- Resolve formal parameters of `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			l_formals: SB_TYPE_LIST
			l_type: SB_TYPE
			i, nb: INTEGER
			nb_ref: UT_COUNTER
		do
			create nb_ref.make (0)
			l_formals := a_class.formal_parameters
			nb := l_formals.count
			from i := 1 until i > nb loop
				l_type := l_formals.item (i)
				if attached {SB_REFERENCE_FORMAL_TYPE} l_type as l_formal then
					nb_ref.increment
					l_formal.set_index (nb_ref.item)
				elseif attached {SB_CLASS_TYPE} l_type as l_class_type then
					resolve_formal_subparameters (l_class_type, nb_ref)
				end
				i := i + 1
			end
		end

feature {NONE} -- Formal parameters

	resolve_formal_subparameters (a_class_type: SB_CLASS_TYPE; nb_ref: UT_COUNTER)
			-- Resolve formal parameters of `a_class_type' with `nb_ref' being the
			-- number of reference formal parameters found so far.
			-- Update `nb_ref'.
		require
			a_class_type_not_void: a_class_type /= Void
			nb_ref_not_void: nb_ref /= Void
		local
			l_formals: SB_TYPE_LIST
			l_actuals: SB_TYPE_LIST
			l_type: SB_TYPE
			i, nb: INTEGER
		do
			l_formals := a_class_type.storable_class.formal_parameters
			nb := l_formals.count
			if nb > 0 then
				create l_actuals.make_with_capacity (nb)
				a_class_type.set_actual_parameters (l_actuals)
				from i := 1 until i > nb loop
					l_type := l_formals.item (i)
					if l_type.is_reference_formal then
						nb_ref.increment
						create {SB_REFERENCE_FORMAL_TYPE} l_type.make (nb_ref.item)
						l_actuals.put_last (l_type)
					elseif attached {SB_CLASS_TYPE} l_type as l_class_type then
						l_actuals.put_last (l_class_type)
						resolve_formal_subparameters (l_class_type, nb_ref)
					else
						l_actuals.put_last (l_type)
					end
					i := i + 1
				end
			end
		end

feature -- Input

	read_schema (a_file: SB_INPUT_FILE)
			-- Read schema from `a_file'.
			-- Set `error.signaled' is an error occurred.
			-- Can also set `has_attribute_type_error' (see header comment of this query).
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_error_handler: SB_ERROR_HANDLER
			l_old_error_handler: SB_ERROR_HANDLER
		do
			l_error_handler := a_file.error_handler
				-- The kind of storable file is stored unbuffered.
			a_file.read_unbuffered_natural_8
			storable_format := a_file.last_natural_8
			inspect storable_format
			when Independent_store_6_6 then
				l_old_error_handler := independent_store_6_6_reader.error_handler
				independent_store_6_6_reader.set_error_handler (l_error_handler)
				independent_store_6_6_reader.read_schema (Current, a_file)
				independent_store_6_6_reader.set_error_handler (l_old_error_handler)
			when Basic_store_3_1 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Basic_store_3_1 (0x" + storable_format.to_hex_string + ")")
			when Basic_store_3_2 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Basic_store_3_2 (0x" + storable_format.to_hex_string + ")")
			when Basic_store_4_0 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Basic_store_4_0 (0x" + storable_format.to_hex_string + ")")
			when General_store_3_1 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: General_store_3_1 (0x" + storable_format.to_hex_string + ")")
			when General_store_3_2 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: General_store_3_2 (0x" + storable_format.to_hex_string + ")")
			when General_store_3_3 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: General_store_3_3 (0x" + storable_format.to_hex_string + ")")
			when General_store_4_0 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: General_store_4_0 (0x" + storable_format.to_hex_string + ")")
			when Independent_store_3_2 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_3_2 (0x" + storable_format.to_hex_string + ")")
			when Independent_store_4_0 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_4_0 (0x" + storable_format.to_hex_string + ")")
			when Independent_store_4_3 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_4_3 (0x" + storable_format.to_hex_string + ")")
			when Independent_store_4_4 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_4_4 (0x" + storable_format.to_hex_string + ")")
			when Independent_store_5_0 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_5_0 (0x" + storable_format.to_hex_string + ")")
			when Recoverable_store_5_3 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_5_3 (0x" + storable_format.to_hex_string + ")")
			when Intermediate_store_5_5 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_5_5_intermediate (0x" + storable_format.to_hex_string + ")")
			when Independent_store_5_5 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_5_5 (0x" + storable_format.to_hex_string + ")")
			when Independent_store_6_0 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_6_0 (0x" + storable_format.to_hex_string + ")")
			when Independent_store_6_2 then
					-- The storable reader for the format 6.0 is able to read the
					-- format 6.2. If it detects that the storable file is using
					-- the format 6.2, then it will set `storable_format'
					-- accordingly. Note that the 6.0 and 6.2 formats share the
					-- same code in ISE's STORABLE.
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_6_0 (0x" + storable_format.to_hex_string + ")")
			when Independent_store_6_3 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_6_3 (0x" + storable_format.to_hex_string + ")")
			when Independent_store_6_4 then
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: Independent_store_6_4 (0x" + storable_format.to_hex_string + ")")
			else
				l_error_handler.report_error_message ("Unable to retrieve this kind of storable file: 0x" + storable_format.to_hex_string)
			end
		end

feature -- Output

	print_schema (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print current schema to `a_file' in
			-- a human readable format.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_class: detachable SB_CLASS
			i, nb: INTEGER
		do
			nb := classes.upper
			from i := 0 until i > nb loop
				l_class := classes.item (i)
				if l_class /= Void then
					l_class.print_class (a_file)
				end
				i := i + 1
			end
		end

	write_schema (a_file: SB_OUTPUT_FILE)
			-- Write schema to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			inspect storable_format
			when Independent_store_6_6 then
--				independent_store_6_6_writer.write_schema (Current, a_file)
			else
--				independent_store_6_6_writer.write_schema (Current, a_file)
			end
		end

invariant

	maximum_class_index_not_negative: maximum_class_index >= 0
	class_count_not_negative: class_count >= 0
	valid_class_count: class_count <= maximum_class_index + 1
	classes_not_void: classes /= Void
	classes_lower: classes.lower = 0
	classes_upper: classes.upper >= maximum_class_index
	-- valid_class_indexes: forall c in classes, classes.valid_index (c.index) and then classes.item (c.index) = c
	boolean_type_not_void: boolean_type /= Void
	character_8_type_not_void: character_8_type /= Void
	character_32_type_not_void: character_32_type /= Void
	integer_32_type_not_void: integer_32_type /= Void
	integer_8_type_not_void: integer_8_type /= Void
	integer_16_type_not_void: integer_16_type /= Void
	integer_64_type_not_void: integer_64_type /= Void
	natural_8_type_not_void: natural_8_type /= Void
	natural_16_type_not_void: natural_16_type /= Void
	natural_32_type_not_void: natural_32_type /= Void
	natural_64_type_not_void: natural_64_type /= Void
	real_32_type_not_void: real_32_type /= Void
	real_64_type_not_void: real_64_type /= Void
	pointer_type_not_void: pointer_type /= Void
	none_type_not_void: none_type /= Void
	attached_none_type_not_void: attached_none_type /= Void
	detachable_none_type_not_void: detachable_none_type /= Void

end
