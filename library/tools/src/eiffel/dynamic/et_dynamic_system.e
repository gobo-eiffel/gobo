note

	description:

		"Eiffel dynamic systems at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_SYSTEM

inherit

	ANY

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system: like current_system; a_system_processor: like system_processor)
			-- Create a new dynamic system.
		require
			a_system_not_void: a_system /= Void
			a_system_processor_not_void: a_system_processor /= Void
		local
			nb: INTEGER
		do
			catcall_error_mode := True
			current_system := a_system
			system_processor := a_system_processor
			make_basic_types
			nb := current_system.master_classes.capacity
			create dynamic_types.make (nb)
			create dynamic_generic_types_by_name.make (nb)
				-- Reset the index of classes so that `dynamic_type' can work properly.
			current_system.classes_do_recursive (agent {ET_CLASS}.set_index (0))
			create null_dynamic_type_set_builder.make (Current)
			set_dynamic_type_set_builder (null_dynamic_type_set_builder)
		ensure
			current_system_set: current_system = a_system
			system_processor_set: system_processor = a_system_processor
		end

	make_basic_types
			-- Create basic types.
		local
			l_unknown_class: ET_CLASS
		do
			l_unknown_class := tokens.unknown_class
			create unknown_type.make (l_unknown_class, l_unknown_class)
			boolean_type := unknown_type
			character_8_type := unknown_type
			character_32_type := unknown_type
			immutable_string_8_type := unknown_type
			immutable_string_32_type := unknown_type
			integer_8_type := unknown_type
			integer_16_type := unknown_type
			integer_32_type := unknown_type
			integer_64_type := unknown_type
			natural_8_type := unknown_type
			natural_16_type := unknown_type
			natural_32_type := unknown_type
			natural_64_type := unknown_type
			real_32_type := unknown_type
			real_64_type := unknown_type
			pointer_type := unknown_type
			string_8_type := unknown_type
			string_32_type := unknown_type
			special_character_8_type := unknown_type
			special_character_32_type := unknown_type
			ise_exception_manager_type := unknown_type
			any_type := unknown_type
			none_type := unknown_type
		ensure
			any_type_not_void: any_type /= Void
			none_type_not_void: none_type /= Void
			boolean_type_not_void: boolean_type /= Void
			character_8_type_not_void: character_8_type /= Void
			character_32_type_not_void: character_32_type /= Void
			immutable_string_8_type_not_void: immutable_string_8_type /= Void
			immutable_string_32_type_not_void: immutable_string_32_type /= Void
			integer_8_type_not_void: integer_8_type /= Void
			integer_16_type_not_void: integer_16_type /= Void
			integer_32_type_not_void: integer_32_type /= Void
			integer_64_type_not_void: integer_64_type /= Void
			natural_8_type_not_void: natural_8_type /= Void
			natural_16_type_not_void: natural_16_type /= Void
			natural_32_type_not_void: natural_32_type /= Void
			natural_64_type_not_void: natural_64_type /= Void
			real_32_type_not_void: real_32_type /= Void
			real_64_type_not_void: real_64_type /= Void
			pointer_type_not_void: pointer_type /= Void
			string_8_type_not_void: string_8_type /= Void
			string_32_type_not_void: string_32_type /= Void
			special_character_8_type_not_void: special_character_8_type /= Void
			special_character_32_type_not_void: special_character_32_type /= Void
			ise_exception_manager_type_not_void: ise_exception_manager_type /= Void
			unknown_type_not_void: unknown_type /= Void
		end

feature -- Access

	root_type: detachable ET_DYNAMIC_PRIMARY_TYPE
			-- Root type

	root_creation_procedure: detachable ET_DYNAMIC_FEATURE
			-- Root creation procedure

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
			-- (Note: there is a frozen feature called 'system' in
			-- class GENERAL of SmartEiffel 1.0)

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

feature -- Status report

	catcall_error_mode: BOOLEAN
			-- Are CAT-call errors considered as fatal errors?

	catcall_warning_mode: BOOLEAN
			-- Are CAT-call errors considered just as warnings?

	full_class_checking: BOOLEAN
			-- Should the whole content of classes to be checked (even
			-- features not reachable from the root creation procedure)?

	all_attributes_used: BOOLEAN
			-- Should all attributes of all types are marked as used
			-- and hence included in the generated run-time instances?

feature -- Status setting

	set_catcall_error_mode (b: BOOLEAN)
			-- Set `catcall_error_mode' to `b'.
		do
			catcall_error_mode := b
		ensure
			catcall_error_mode_set: catcall_error_mode = b
		end

	set_catcall_warning_mode (b: BOOLEAN)
			-- Set `catcall_warning_mode' to `b'.
		do
			catcall_warning_mode := b
		ensure
			catcall_warning_mode_set: catcall_warning_mode = b
		end

	set_full_class_checking (b: BOOLEAN)
			-- Set `full_class_checking' to `b'.
		do
			full_class_checking := b
		ensure
			full_class_checking_set: full_class_checking = b
		end

	use_all_attributes
			-- Set `all_attributes_used' to True.
		local
			i, nb: INTEGER
			l_dynamic_types: like dynamic_types
		do
			all_attributes_used := True
			l_dynamic_types := dynamic_types
			nb := dynamic_types.count
			from i := 1 until i > nb loop
				l_dynamic_types.item (i).use_all_attributes (Current)
				i := i + 1
			end
		ensure
			all_attributes_used: all_attributes_used
		end

feature -- Types

	boolean_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "BOOLEAN"

	character_8_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "CHARACTER_8"

	character_32_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "CHARACTER_32"

	integer_8_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "INTEGER_8"

	integer_16_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "INTEGER_16"

	integer_32_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "INTEGER_32"

	integer_64_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "INTEGER_64"

	natural_8_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "NATURAL_8"

	natural_16_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "NATURAL_16"

	natural_32_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "NATURAL_32"

	natural_64_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "NATURAL_64"

	real_32_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "REAL_32"

	real_64_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "REAL_64"

	pointer_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "POINTER"

	any_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "ANY"

	none_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "NONE"

	string_8_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "STRING_8"

	string_32_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "STRING_32"

	immutable_string_8_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "IMMUTABLE_STRING_8"

	immutable_string_32_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "IMMUTABLE_STRING_32"

	special_character_8_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "SPECIAL [CHARACTER_8]"

	special_character_32_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "SPECIAL [CHARACTER_32]"

	ise_exception_manager_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "ISE_EXCEPTION_MANAGER"

	unknown_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type "*UNKNOWN*"

	dynamic_type (a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT): ET_DYNAMIC_TYPE
			-- Dynamic type corresponding to `a_type' in `a_context';
			-- Create a new one if it does not exist yet
		require
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			l_primary_type: ET_DYNAMIC_PRIMARY_TYPE
			l_secondary_type: ET_DYNAMIC_SECONDARY_TYPE
		do
			l_primary_type := dynamic_primary_type (a_type, a_context)
			if current_system.attachment_type_conformance_mode then
				if a_type.is_type_expanded (a_context) or a_type.is_type_detachable (a_context) then
					Result := l_primary_type
				elseif attached l_primary_type.attached_type as l_attached_type then
					Result := l_attached_type
				else
					create l_secondary_type.make (l_primary_type, tokens.implicit_attached_type_mark)
					l_primary_type.set_attached_type (l_secondary_type)
					propagate_type_of_type_result_type (l_secondary_type)
					Result := l_secondary_type
				end
			else
				Result := l_primary_type
			end
		ensure
			dynamic_type_not_void: Result /= Void
		end

	dynamic_primary_type (a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT): ET_DYNAMIC_PRIMARY_TYPE
			-- Dynamic primary type corresponding to `a_type' in `a_context';
			-- Create a new one if it does not exist yet
		require
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			i: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
			l_base_class: ET_CLASS
			l_base_type: ET_BASE_TYPE
			l_result: detachable ET_DYNAMIC_PRIMARY_TYPE
			l_is_reentrant: BOOLEAN
			l_old_dynamic_types_count: INTEGER
			l_implicit_type_mark: detachable ET_TYPE_MARK
			l_type_name: STRING
		do
			if in_dynamic_primary_type then
				l_is_reentrant := True
			else
				in_dynamic_primary_type := True
				l_old_dynamic_types_count := dynamic_types.count
			end
			l_implicit_type_mark := tokens.implicit_detachable_type_mark
			l_base_class := a_type.base_class (a_context)
			i := l_base_class.index
			if i >= 1 and i <= dynamic_types.count then
				l_type := dynamic_types.item (i)
				if l_type.base_class /= l_base_class then
					-- Wrong index.
				elseif not l_base_class.is_generic and not l_base_class.is_tuple_class then
					if a_type.is_type_expanded (a_context) = l_type.is_expanded then
						l_result := l_type
					elseif not attached l_type.next_type as l_next_type then
						l_base_type := a_type.base_type_with_type_mark (l_implicit_type_mark, a_context)
						l_result := new_dynamic_primary_type (l_base_type)
					else
						check
							same_expandedness: a_type.is_type_expanded (a_context) = l_next_type.is_expanded
						end
						l_result := l_next_type
					end
				else
					l_base_type := a_type.base_type_with_type_mark (l_implicit_type_mark, a_context)
					l_type_name := type_name_buffer
					l_type_name.wipe_out
					l_base_type.append_runtime_name_to_string (l_type_name)
					dynamic_generic_types_by_name.search (l_type_name)
					if dynamic_generic_types_by_name.found then
						l_result := dynamic_generic_types_by_name.found_item
					else
						create l_type_name.make (l_type_name.count)
						l_type_name.append_string (type_name_buffer)
						l_result := new_dynamic_primary_type (l_base_type)
						dynamic_generic_types_by_name.force_last (l_result, l_type_name)
					end
				end
			end
			if l_result /= Void then
				Result := l_result
			else
					-- No dynamic type yet with this base class.
					-- Add the new dynamic type and keep track
					-- of its associated index.
				if full_class_checking then
					l_base_class.process (system_processor.implementation_checker)
					if not l_base_class.implementation_checked or else l_base_class.has_implementation_error then
						set_fatal_error
					end
				else
					l_base_class.process (system_processor.interface_checker)
					if not l_base_class.interface_checked or else l_base_class.has_interface_error then
						set_fatal_error
					end
				end
				l_base_type := a_type.base_type_with_type_mark (l_implicit_type_mark, a_context)
				Result := new_dynamic_primary_type (l_base_type)
				if l_base_class.is_generic or l_base_class.is_tuple_class then
					l_type_name := l_base_type.runtime_name_to_text
					dynamic_generic_types_by_name.force_last (Result, l_type_name)
				end
			end
			if not l_is_reentrant then
				in_dynamic_primary_type := False
				initialize_dynamic_types (l_old_dynamic_types_count + 1, dynamic_types.count)
			end
		ensure
			dynamic_primary_type_not_void: Result /= Void
		end

	attached_type (a_type: ET_DYNAMIC_PRIMARY_TYPE): ET_DYNAMIC_TYPE
			-- Attached version of `a_type', or `a_type' itself if it
			-- is expanded or we are in non-void-safe mode
		require
			a_type_not_void: a_type /= Void
		do
			if current_system.attachment_type_conformance_mode then
				if attached a_type.attached_type as l_attached_type then
					Result := l_attached_type
				elseif a_type.is_expanded then
					Result := a_type
				else
					Result := dynamic_type (tokens.attached_like_current, a_type.base_type)
				end
			else
				Result := a_type
			end
		ensure
			attached_type_not_void: Result /= Void
		end

	meta_type (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_PRIMARY_TYPE
			-- Dynamic type corresponding to the meta type of `a_type';
			-- Create a new one if it does not exist yet
			--
			-- If `a_type' represents the Eiffel type 'T', then
			-- the meta type will represent the Eiffel type '[detachable] TYPE [T]'.
		require
			a_type_not_void: a_type /= Void
		do
			if attached a_type.meta_type as l_meta_type then
				Result := l_meta_type
			else
				Result := dynamic_primary_type (current_system.type_identity_type, a_type.base_type)
				a_type.set_meta_type (Result)
			end
		ensure
			meta_type_not_void: Result /= Void
			definition: Result = a_type.meta_type
		end

	dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_PRIMARY_TYPE]
			-- Dynamic types in the system

feature {NONE} -- Types

	in_dynamic_primary_type: BOOLEAN
			-- Flag to handle properly re-entrant calls to `dynamic_primary_type'

	dynamic_generic_types_by_name: DS_HASH_TABLE [ET_DYNAMIC_PRIMARY_TYPE, STRING]
			-- Dynamic generic types in the system, indexed by their names

	new_dynamic_primary_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_PRIMARY_TYPE
			-- New dynamic primary type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
		local
			l_base_type: ET_BASE_TYPE
			l_base_class: ET_CLASS
		do
			l_base_type := a_base_type
			l_base_class := l_base_type.base_class
			if l_base_type.same_as_base_class then
				l_base_type := l_base_class
			end
			if l_base_class.is_special_class then
				Result := new_special_type (l_base_type)
			elseif l_base_class.is_tuple_class then
				Result := new_tuple_type (l_base_type)
			elseif l_base_class.is_type_class then
				Result := new_type_type (l_base_type)
			elseif l_base_class.is_procedure_class then
				Result := new_procedure_type (l_base_type)
			elseif l_base_class.is_function_class then
				Result := new_function_type (l_base_type)
			elseif l_base_class.is_predicate_class then
				Result := new_predicate_type (l_base_type)
			else
				create Result.make (l_base_type, l_base_class)
				register_dynamic_type (Result)
			end
		ensure
			new_dynamic_type_not_void: Result /= Void
		end

	new_special_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_PRIMARY_TYPE
			-- New dynamic "SPECIAL" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_special: a_base_type.base_class.is_special_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: detachable ET_ACTUAL_PARAMETERS
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_any: ET_CLASS_TYPE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void and then l_actual_parameters.count = 1 then
					-- Class SPECIAL should have exactly one generic parameter.
				l_item_type := dynamic_type (l_actual_parameters.type (1), l_any)
				l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
				create {ET_DYNAMIC_SPECIAL_TYPE} Result.make (a_base_type, l_base_class, l_item_type_set)
				register_dynamic_type (Result)
			else
				create Result.make (a_base_type, l_base_class)
				register_dynamic_type (Result)
			end
		ensure
			new_special_type_not_void: Result /= Void
		end

	new_tuple_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_PRIMARY_TYPE
			-- New dynamic "TUPLE" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_tuple: a_base_type.base_class.is_tuple_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: detachable ET_ACTUAL_PARAMETERS
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			l_any: ET_CLASS_TYPE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void then
				nb := l_actual_parameters.count
				if nb > 0 then
					create l_item_type_sets.make_with_capacity (nb)
					from i := 1 until i > nb loop
						l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
						l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
						l_item_type_sets.put_last (l_item_type_set)
						i := i + 1
					end
				else
					l_item_type_sets := empty_dynamic_type_sets
				end
			else
				l_item_type_sets := empty_dynamic_type_sets
			end
			create {ET_DYNAMIC_TUPLE_TYPE} Result.make (a_base_type, l_base_class, l_item_type_sets)
			register_dynamic_type (Result)
		ensure
			new_tuple_type_not_void: Result /= Void
		end

	new_type_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_PRIMARY_TYPE
			-- New dynamic "TYPE" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_type: a_base_type.base_class.is_type_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: detachable ET_ACTUAL_PARAMETERS
			l_any: ET_CLASS_TYPE
			l_type: ET_DYNAMIC_TYPE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
				-- Check whether the type we want to create is already the
				-- meta type of the type it is supposed to represent.
				-- This may happen because of recursive calls to `dynamic_type',
				-- including the one below, in combination with a call to
				-- `propagate_type_of_type_result_type' which itself may try
				-- to create the type that we are currently trying to create.
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void and then l_actual_parameters.count = 1 then
					-- Class TYPE should have exactly one generic parameter.
				l_type := dynamic_type (l_actual_parameters.type (1), l_any)
				if attached l_type.meta_type as l_meta_type then
					Result := l_meta_type
				else
					create Result.make (a_base_type, l_base_class)
					register_dynamic_type (Result)
					l_type.set_meta_type (Result)
				end
			else
				create Result.make (a_base_type, l_base_class)
				register_dynamic_type (Result)
			end
		ensure
			new_type_type_not_void: Result /= Void
		end

	new_procedure_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_PRIMARY_TYPE
			-- New dynamic "PROCEDURE" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_procedure: a_base_type.base_class.is_procedure_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: detachable ET_ACTUAL_PARAMETERS
			l_tuple_type: ET_DYNAMIC_TYPE
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			l_any: ET_CLASS_TYPE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void and then l_actual_parameters.count = 1 then
				l_tuple_type := dynamic_type (l_actual_parameters.type (1), l_any)
				l_actual_parameters := l_tuple_type.base_type.actual_parameters
				if l_actual_parameters /= Void then
					nb := l_actual_parameters.count
					if nb > 0 then
						create l_item_type_sets.make_with_capacity (nb)
						from i := 1 until i > nb loop
							l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
							l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
								-- Unless proven otherwise after possible attachments,
								-- an open operand is assumed to be never Void.
							l_item_type_set.set_never_void
							l_item_type_sets.put_last (l_item_type_set)
							i := i + 1
						end
					else
						l_item_type_sets := empty_dynamic_type_sets
					end
				else
					l_item_type_sets := empty_dynamic_type_sets
				end
				create {ET_DYNAMIC_PROCEDURE_TYPE} Result.make (a_base_type, l_base_class, l_item_type_sets)
				register_dynamic_type (Result)
			else
				create Result.make (a_base_type, l_base_class)
				register_dynamic_type (Result)
			end
		ensure
			new_procedure_type_not_void: Result /= Void
		end

	new_function_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_PRIMARY_TYPE
			-- New dynamic "FUNCTION" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_function: a_base_type.base_class.is_function_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: detachable ET_ACTUAL_PARAMETERS
			l_tuple_type: ET_DYNAMIC_TYPE
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_return_type: ET_DYNAMIC_TYPE
			l_return_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			l_any: ET_CLASS_TYPE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void and then l_actual_parameters.count = 2 then
				l_return_type := dynamic_type (l_actual_parameters.type (2), l_any)
				l_return_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_return_type)
					-- Unless proven otherwise after possible attachments,
					-- the result is assumed to be never Void.
				l_return_type_set.set_never_void
				l_tuple_type := dynamic_type (l_actual_parameters.type (1), l_any)
				l_actual_parameters := l_tuple_type.base_type.actual_parameters
				if l_actual_parameters /= Void then
					nb := l_actual_parameters.count
					if nb > 0 then
						create l_item_type_sets.make_with_capacity (nb)
						from i := 1 until i > nb loop
							l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
							l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
								-- Unless proven otherwise after possible attachments,
								-- an open operand is assumed to be never Void.
							l_item_type_set.set_never_void
							l_item_type_sets.put_last (l_item_type_set)
							i := i + 1
						end
					else
						l_item_type_sets := empty_dynamic_type_sets
					end
				else
					l_item_type_sets := empty_dynamic_type_sets
				end
				create {ET_DYNAMIC_FUNCTION_TYPE} Result.make (a_base_type, l_base_class, l_item_type_sets, l_return_type_set)
				register_dynamic_type (Result)
			else
				create Result.make (a_base_type, l_base_class)
				register_dynamic_type (Result)
			end
		ensure
			new_function_type_not_void: Result /= Void
		end

	new_predicate_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_PRIMARY_TYPE
			-- New dynamic "PREDICATE" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_predicate: a_base_type.base_class.is_predicate_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: detachable ET_ACTUAL_PARAMETERS
			l_tuple_type: ET_DYNAMIC_TYPE
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_return_type: ET_DYNAMIC_TYPE
			l_return_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			l_any: ET_CLASS_TYPE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void and then l_actual_parameters.count = 1 then
				l_return_type := boolean_type
				l_return_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_return_type)
				l_tuple_type := dynamic_type (l_actual_parameters.type (1), l_any)
				l_actual_parameters := l_tuple_type.base_type.actual_parameters
				if l_actual_parameters /= Void then
					nb := l_actual_parameters.count
					if nb > 0 then
						create l_item_type_sets.make_with_capacity (nb)
						from i := 1 until i > nb loop
							l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
							l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
							l_item_type_sets.put_last (l_item_type_set)
							i := i + 1
						end
					else
						l_item_type_sets := empty_dynamic_type_sets
					end
				else
					l_item_type_sets := empty_dynamic_type_sets
				end
				create {ET_DYNAMIC_FUNCTION_TYPE} Result.make (a_base_type, l_base_class, l_item_type_sets, l_return_type_set)
				register_dynamic_type (Result)
			else
				create Result.make (a_base_type, l_base_class)
				register_dynamic_type (Result)
			end
		ensure
			new_predicate_type_not_void: Result /= Void
		end

	register_dynamic_type (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Add `a_type' to `dynamic_types'.
		require
			a_type_not_void: a_type /= Void
		local
			i: INTEGER
			l_other_type: ET_DYNAMIC_PRIMARY_TYPE
			l_base_class: ET_CLASS
		do
			dynamic_types.force_last (a_type)
			a_type.set_hash_code (dynamic_types.count)
			l_base_class := a_type.base_class
			i := l_base_class.index
			if i >= 1 and i <= dynamic_types.count then
				l_other_type := dynamic_types.item (i)
				if l_other_type.base_class /= l_base_class then
						-- Wrong index.
					l_base_class.set_index (dynamic_types.count)
				else
						-- Another type has been inserted.
					a_type.set_next_type (l_other_type.next_type)
					l_other_type.set_next_type (a_type)
				end
			else
					-- No other type has been inserted.
				l_base_class.set_index (dynamic_types.count)
			end
			propagate_conforming_ancestors (a_type)
		end

	initialize_dynamic_types (a_start, a_end: INTEGER)
			-- Initilize types between `a_start' and `a_end' in `dynamic_types'.
		require
			a_start_large_enough: a_start >= 1
			a_end_small_enough: a_end <= dynamic_types.count
			valid_bounds: a_start <= a_end + 1
		local
			i: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
			l_base_class: ET_CLASS
		do
			from i := a_start until i > a_end loop
				l_type := dynamic_types.item (i)
				l_base_class := l_type.base_class
				if l_type.is_expanded then
					dynamic_type_set_builder.mark_type_alive (l_type)
				end
				if l_base_class.is_special_class then
					initialize_special_type (l_type)
				elseif l_base_class.is_array_class then
					initialize_array_type (l_type)
				elseif l_base_class.is_typed_pointer_class then
					initialize_typed_pointer_type (l_type)
				elseif l_base_class.is_procedure_class then
					initialize_procedure_type (l_type)
				elseif l_base_class.is_function_class then
					initialize_function_type (l_type)
				elseif l_base_class.is_predicate_class then
					initialize_predicate_type (l_type)
				end
				propagate_type_of_type_result_type (l_type)
				propagate_attribute_type_sets (l_type)
				propagate_alive_conforming_descendants (l_type)
				i := i + 1
			end
		end

	initialize_special_type (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Initialize "SPECIAL" type `a_type'.
		require
			a_type_not_void: a_type /= Void
			is_special_type: a_type.base_class.is_special_class
		local
			l_feature: ET_DYNAMIC_FEATURE
		do
				-- Make attributes 'count' and 'capacity' alive at the first two
				-- positions in the attribute list of the "SPECIAL" type.
			if attached special_count_feature as l_special_count_feature then
				a_type.set_attribute_position (a_type.dynamic_query (l_special_count_feature, Current), 1)
			end
			if attached special_capacity_feature as l_special_capacity_feature then
				a_type.set_attribute_position (a_type.dynamic_query (l_special_capacity_feature, Current), 2)
			end
			if attached special_item_feature as l_special_item_feature then
				l_feature := a_type.dynamic_query (l_special_item_feature, Current)
			end
		end

	initialize_array_type (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Initialize "ARRAY" type `a_type'.
		require
			a_type_not_void: a_type /= Void
			is_array_type: a_type.base_class.is_array_class
		do
				-- Make attributes 'area', and 'lower' and 'upper' alive at the
				-- first three positions in the attribute list of the "ARRAY" type.
			if attached array_area_feature as l_array_area_feature then
				a_type.set_attribute_position (a_type.dynamic_query (l_array_area_feature, Current), 1)
			end
			if attached array_lower_feature as l_array_lower_feature then
				a_type.set_attribute_position (a_type.dynamic_query (l_array_lower_feature, Current), 2)
			end
			if attached array_upper_feature as l_array_upper_feature then
				a_type.set_attribute_position (a_type.dynamic_query (l_array_upper_feature, Current), 3)
			end
		end

	initialize_typed_pointer_type (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Initialize "TYPED_POINTER" type `a_type'.
		require
			a_type_not_void: a_type /= Void
			is_typed_pointer_type: a_type.base_class.is_typed_pointer_class
		do
				-- Make attribute 'to_pointer' alive at the first position
				-- in the attribute list of the "TYPED_POINTER" type.
			if attached typed_pointer_to_pointer_feature as l_typed_pointer_to_pointer_feature then
				a_type.set_attribute_position (a_type.dynamic_query (l_typed_pointer_to_pointer_feature, Current), 1)
			end
		end

	initialize_procedure_type (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Initialize "PROCEDURE" type `a_type'.
		require
			a_type_not_void: a_type /= Void
			is_procedure_type: a_type.base_class.is_procedure_class
		do
				-- Make attribute 'rout_disp' alive at the first position
				-- in the attribute list of the "PROCEDURE" type.
			if attached routine_rout_disp_feature as l_routine_rout_disp_feature then
				if attached a_type.seeded_dynamic_query (l_routine_rout_disp_feature.first_seed, Current) as l_dynamic_feature then
					a_type.set_attribute_position (l_dynamic_feature, 1)
				end
			end
				-- Make attribute 'closed_operands' alive at the second position
				-- in the attribute list of the "PROCEDURE" type.
			if attached routine_closed_operands_feature as l_routine_closed_operands_feature then
				if attached a_type.seeded_dynamic_query (l_routine_closed_operands_feature.first_seed, Current) as l_dynamic_type then
					a_type.set_attribute_position (l_dynamic_type, 2)
				end
			end
				-- Make feature 'set_rout_disp_final' alive.
			if attached {ET_DYNAMIC_ROUTINE_TYPE} a_type as l_agent_type then
				if attached routine_set_rout_disp_final_feature as l_routine_set_rout_disp_final_feature then
					if attached a_type.seeded_dynamic_procedure (l_routine_set_rout_disp_final_feature.first_seed, Current) as l_dynamic_feature then
						l_dynamic_feature.set_regular (True)
						l_agent_type.set_set_rout_disp_final_feature (l_dynamic_feature)
					end
				end
			end
		end

	initialize_function_type (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Initialize "FUNCTION" type `a_type'.
		require
			a_type_not_void: a_type /= Void
			is_function_type: a_type.base_class.is_function_class
		do
				-- Make attribute 'rout_disp' alive at the first position
				-- in the attribute list of the "FUNCTION" type.
			if attached routine_rout_disp_feature as l_routine_rout_disp_feature then
				if attached a_type.seeded_dynamic_query (l_routine_rout_disp_feature.first_seed, Current) as l_dynamic_feature then
					a_type.set_attribute_position (l_dynamic_feature, 1)
				end
			end
				-- Make attribute 'closed_operands' alive at the second position
				-- in the attribute list of the "FUNCTION" type.
			if attached routine_closed_operands_feature as l_routine_closed_operands_feature then
				if attached a_type.seeded_dynamic_query (l_routine_closed_operands_feature.first_seed, Current) as l_dynamic_feature then
					a_type.set_attribute_position (l_dynamic_feature, 2)
				end
			end
				-- Make feature 'set_rout_disp_final' alive.
			if attached {ET_DYNAMIC_ROUTINE_TYPE} a_type as l_agent_type then
				if attached routine_set_rout_disp_final_feature as l_routine_set_rout_disp_final_feature then
					if attached a_type.seeded_dynamic_procedure (l_routine_set_rout_disp_final_feature.first_seed, Current) as l_dynamic_feature then
						l_dynamic_feature.set_regular (True)
						l_agent_type.set_set_rout_disp_final_feature (l_dynamic_feature)
					end
				end
			end
		end

	initialize_predicate_type (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Initialize "PREDICATE" type `a_type'.
		require
			a_type_not_void: a_type /= Void
			is_predicate_type: a_type.base_class.is_predicate_class
		do
				-- Make attribute 'rout_disp' alive at the first position
				-- in the attribute list of the "PREDICATE" type.
			if attached routine_rout_disp_feature as l_routine_rout_disp_feature then
				if attached a_type.seeded_dynamic_query (l_routine_rout_disp_feature.first_seed, Current) as l_dynamic_feature then
					a_type.set_attribute_position (l_dynamic_feature, 1)
				end
			end
				-- Make attribute 'closed_operands' alive at the second position
				-- in the attribute list of the "PREDICATE" type.
			if attached routine_closed_operands_feature as l_routine_closed_operands_feature then
				if attached a_type.seeded_dynamic_query (l_routine_closed_operands_feature.first_seed, Current) as l_dynamic_feature then
					a_type.set_attribute_position (l_dynamic_feature, 2)
				end
			end
				-- Make feature 'set_rout_disp_final' alive.
			if attached {ET_DYNAMIC_ROUTINE_TYPE} a_type as l_agent_type then
				if attached routine_set_rout_disp_final_feature as l_routine_set_rout_disp_final_feature then
					if attached a_type.seeded_dynamic_procedure (l_routine_set_rout_disp_final_feature.first_seed, Current) as l_dynamic_feature then
						l_dynamic_feature.set_regular (True)
						l_agent_type.set_set_rout_disp_final_feature (l_dynamic_feature)
					end
				end
			end
		end

	propagate_type_of_type_result_type (a_type: ET_DYNAMIC_TYPE)
			-- Propagate `a_type' to the dynamic type set of the result of the
			-- built-in feature corresponding to "ISE_RUNTIME.new_type_instance_of".
		require
			a_type_not_void: a_type /= Void
		do
			if attached ise_runtime_new_type_instance_of_feature as l_ise_runtime_new_type_instance_of_feature then
				if not in_create_meta_type then
					create_meta_type (a_type)
					if attached a_type.meta_type as l_meta_type then
						dynamic_type_set_builder.mark_type_alive (l_meta_type)
						dynamic_type_set_builder.propagate_type_of_type_result_type (l_meta_type, l_ise_runtime_new_type_instance_of_feature)
					else
							-- The postcondition of `create_meta_type' says that
							-- 'a_type.meta_type' is not void.
						check False end
					end
				end
			end
		end

	propagate_attribute_type_sets (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- If `all_attributes_used' is set, then make sure that all
			-- attributes of `a_type' are marked as used and their type sets
			-- propagated to `ise_runtime_reference_field' and
			-- `ise_runtime_set_reference_field'.
		require
			a_type_not_void: a_type /= Void
		local
			l_old_in_create_meta_type: BOOLEAN
		do
			if all_attributes_used then
				l_old_in_create_meta_type := in_create_meta_type
				in_create_meta_type := False
				a_type.use_all_attributes (Current)
				in_create_meta_type := l_old_in_create_meta_type
			end
		end

	propagate_alive_conforming_descendants (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- If `a_type' is alive, then propagage `a_type' to all
			-- `dynamic_type_set_builder.alive_conforming_descendants' to
			-- which it conforms.
		require
			a_type_not_void: a_type /= Void
		do
			if a_type.is_alive then
				dynamic_type_set_builder.propagate_alive_conforming_descendants (a_type)
			end
		end

	propagate_conforming_ancestors (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Fill in 'conforming_ancestors' of `a_type' and
			-- add `a_type' to 'conforming_ancestors' of other types.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			l_other_type: detachable ET_DYNAMIC_PRIMARY_TYPE
			l_conforming_ancestors: DS_HASH_SET [ET_DYNAMIC_PRIMARY_TYPE]
			l_ancestor_base_types: ET_BASE_TYPE_LIST
			l_index: INTEGER
			l_base_type: ET_BASE_TYPE
			l_other_base_type: ET_BASE_TYPE
			l_base_class: ET_CLASS
			l_other_base_class: ET_CLASS
		do
			l_base_class := a_type.base_class
			if not l_base_class.is_none then
				l_base_type := a_type.base_type
				l_conforming_ancestors := a_type.conforming_ancestors
				l_conforming_ancestors.force_last (a_type)
				l_ancestor_base_types := l_base_class.conforming_ancestors
				nb := l_ancestor_base_types.count
				from
					l_other_base_class := l_base_class
				until
					i > nb
				loop
					l_index := l_other_base_class.index
					if l_index >= 1 and l_index <= dynamic_types.count then
						from
							l_other_type := dynamic_types.item (l_index)
						until
							l_other_type = Void
						loop
							if l_other_type /= a_type and then not l_other_type.base_class.is_none then
								l_other_base_type := l_other_type.base_type
								if l_base_type.conforms_to_type_with_type_marks (l_other_base_type, l_other_type.type_mark, l_other_base_type, a_type.type_mark, l_base_type, tokens.null_system_processor) then
									l_conforming_ancestors.force_last (l_other_type)
								end
							end
							l_other_type := l_other_type.next_type
						end
					end
					i := i + 1
					if i <= nb then
						l_other_base_class := l_ancestor_base_types.item (i).base_class
					end
				end
				nb := dynamic_types.count
				from i := 1 until i > nb loop
					l_other_type := dynamic_types.item (i)
					l_other_base_class := l_other_type.base_class
					if l_other_base_class.index = i and then not l_other_base_class.is_none and then (l_other_base_class = l_base_class or else l_other_base_class.conforming_ancestors.has_class (l_base_class)) then
						from
						until
							l_other_type = Void
						loop
							if l_other_type /= a_type then
								l_other_base_type := l_other_type.base_type
								if l_other_base_type.conforms_to_type_with_type_marks (l_base_type, a_type.type_mark, l_base_type, l_other_type.type_mark, l_other_base_type, tokens.null_system_processor) then
									l_other_type.conforming_ancestors.force_last (a_type)
								end
							end
							l_other_type := l_other_type.next_type
						end
					end
					i := i + 1
				end
			end
		end

	create_meta_type (a_type: ET_DYNAMIC_TYPE)
			-- Make sure that the meta type of `a_type' has been created,
			-- and if not then create it.
		require
			a_type_not_void: a_type /= Void
		local
			l_old_in_create_meta_type: BOOLEAN
			l_meta_type: ET_DYNAMIC_PRIMARY_TYPE
		do
				-- Make sure that we don't create the meta type of the meta type that
				-- we are about to create, otherwise we would enter an infinite loop.
			l_old_in_create_meta_type := in_create_meta_type
			in_create_meta_type := True
			l_meta_type := meta_type (a_type)
			in_create_meta_type := l_old_in_create_meta_type
		ensure
			meta_type_created: a_type.meta_type /= Void
		end

	in_create_meta_type: BOOLEAN
			-- Flag to avoid recursive call on `create_meta_type'

feature -- New instance types

	is_new_instance_type (a_type: ET_DYNAMIC_PRIMARY_TYPE): BOOLEAN
			-- Has `a_type' been specified as a type which can have instances
			-- created by 'TYPE.new_instance' or 'TYPE.new_special_any_instance'?
		require
			a_type_not_void: a_type /= Void
		local
			l_name: STRING
		do
			if attached new_instance_types as l_new_instance_types then
				l_name := a_type.base_type.unaliased_to_text
				l_name.replace_substring_all ("attached ", "")
				l_name.replace_substring_all ("[attached] ", "")
				l_name.replace_substring_all ("detachable ", "")
				l_name.replace_substring_all ("[detachable] ", "")
				Result := l_new_instance_types.has (l_name)
			else
				Result := True
			end
		end

	new_instance_types: detachable DS_HASH_SET [STRING]
			-- Name of the types which can have instances created by 'TYPE.new_instance'
			-- or 'TYPE.new_special_any_instance'
			--
			-- Use all non-deferred, non-NONE, alive types if no types have been specified.

	set_new_instance_types (a_types: like new_instance_types)
			-- Set `new_instance_types' to `a_types'.
		do
			new_instance_types := a_types
		ensure
			new_instance_types_set: new_instance_types = a_types
		end

feature -- Compilation

	compile (a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Compile current system.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `a_system_processor.stop_request' starts returning
			-- True. No interruption if `a_system_processor.stop_request' is Void.
		require
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_root_type: detachable ET_BASE_TYPE
		do
			l_root_type := current_system.root_type
			if l_root_type = Void then
				compile_all (a_system_processor)
			elseif l_root_type.same_named_type (current_system.none_type, tokens.unknown_class, tokens.unknown_class) then
				compile_all (a_system_processor)
			elseif l_root_type.same_named_type (current_system.any_type, tokens.unknown_class, tokens.unknown_class) then
				compile_all (a_system_processor)
			else
				compile_system (a_system_processor)
			end
		end

	compile_system (a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Compile all code reachable from the root creation procedure of the root class.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `a_system_processor.stop_request' starts returning
			-- True. No interruption if `a_system_processor.stop_request' is Void.
		require
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_root_type: detachable ET_BASE_TYPE
			l_dynamic_root_type: like root_type
			l_name: detachable ET_FEATURE_NAME
			l_procedure: detachable ET_PROCEDURE
			l_query: detachable ET_QUERY
			l_root_creation_procedure: like root_creation_procedure
			l_class: ET_CLASS
		do
			has_fatal_error := False
			activate_dynamic_type_set_builder (a_system_processor)
			a_system_processor.compile_degree_6 (current_system)
			compile_kernel (a_system_processor)
			if not a_system_processor.stop_requested then
				l_root_type := current_system.root_type
				if l_root_type = Void then
						-- Error: missing root class.
					set_fatal_error
					error_handler.report_gvsrc3a_error
				elseif l_root_type.same_named_type (current_system.none_type, tokens.unknown_class, tokens.unknown_class) then
						-- Error: the root creation feature is not declared as a
						-- publicly available creation procedure in the root class.
					l_name := current_system.root_creation
					if l_name = Void then
						l_name := tokens.default_create_feature_name
					end
					set_fatal_error
					error_handler.report_gvsrc6a_error (l_root_type.base_class, l_name)
				else
					l_class := l_root_type.base_class
					l_class.process (a_system_processor.eiffel_parser)
					if not l_class.is_preparsed then
							-- Error: unknown root class.
						set_fatal_error
						error_handler.report_gvsrc4a_error (l_class)
					elseif not l_class.is_parsed or else l_class.has_syntax_error then
							-- Error already reported.
						set_fatal_error
					elseif l_class.is_generic then
							-- Error: the root class should not be generic.
						set_fatal_error
						error_handler.report_vsrc1a_error (l_class)
					else
						l_dynamic_root_type := dynamic_primary_type (l_class, l_class)
						root_type := l_dynamic_root_type
						if l_class.has_interface_error then
								-- Error already reported.
							set_fatal_error
						else
							l_name := current_system.root_creation
							if l_name /= Void then
								l_procedure := l_class.named_procedure (l_name)
							elseif current_system.default_create_seed /= 0 then
								l_procedure := l_class.seeded_procedure (current_system.default_create_seed)
								l_name := tokens.default_create_feature_name
							else
								l_name := tokens.default_create_feature_name
								l_procedure := l_class.named_procedure (l_name)
							end
							if l_procedure = Void then
								if l_name /= Void then
									l_query := l_class.named_query (l_name)
								elseif current_system.default_create_seed /= 0 then
									l_query := l_class.seeded_query (current_system.default_create_seed)
									l_name := tokens.default_create_feature_name
								else
									l_name := tokens.default_create_feature_name
									l_query := l_class.named_query (l_name)
								end
								if l_query = Void then
										-- Error: the root creation procedure is not
										-- a feature of the root class.
									set_fatal_error
									error_handler.report_gvsrc5a_error (l_class, l_name)
								else
										-- Internal error: the root creation feature is not a procedure.
									set_fatal_error
									error_handler.report_giaaa_error
								end
							elseif not l_class.is_creation_directly_exported_to (l_procedure.name, current_system.any_type.base_class) then
								set_fatal_error
								error_handler.report_gvsrc6a_error (l_class, l_procedure.name)
							else
								l_root_creation_procedure := l_dynamic_root_type.dynamic_procedure (l_procedure, Current)
								l_root_creation_procedure.set_creation (True)
								root_creation_procedure := l_root_creation_procedure
								dynamic_type_set_builder.mark_type_alive (l_dynamic_root_type)
									-- Type "ISE_EXCEPTION_MANAGER" is used from the runtime.
								dynamic_type_set_builder.mark_type_alive (ise_exception_manager_type)
								build_dynamic_type_sets
							end
						end
					end
				end
			end
		end

	compile_all (a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Compile all classes in the Eiffel system.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `a_system_processor.stop_request' starts returning
			-- True. No interruption if `a_system_processor.stop_request' is Void.
		require
			a_system_processor_not_void: a_system_processor /= Void
		local
			dt1: detachable DT_DATE_TIME
		do
			has_fatal_error := False
			activate_dynamic_type_set_builder (a_system_processor)
			a_system_processor.compile_all (current_system)
			dt1 := a_system_processor.benchmark_start_time
			compile_kernel (a_system_processor)
			current_system.classes_do_recursive_until (agent compile_all_features, a_system_processor.stop_request)
			build_dynamic_type_sets
			a_system_processor.record_end_time (dt1, "Degree Dynamic Type Set")
		end

	compile_feature (a_feature_name: ET_FEATURE_NAME; a_class: ET_CLASS; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Compile all code reachable from the feature `a_feature_name' from `a_class'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `a_system_processor.stop_request' starts returning
			-- True. No interruption if `a_system_processor.stop_request' is Void.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_class_not_void: a_class /= Void
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_dynamic_type: ET_DYNAMIC_PRIMARY_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			has_fatal_error := False
			activate_dynamic_type_set_builder (a_system_processor)
			a_system_processor.compile_degree_6 (current_system)
			compile_kernel (a_system_processor)
			if not a_system_processor.stop_requested then
				if not a_class.is_preparsed then
						-- Error: unknown class.
					set_fatal_error
					error_handler.report_gvsrc4a_error (a_class)
				else
					a_class.process (a_system_processor.eiffel_parser)
					if not a_class.is_parsed or else a_class.has_syntax_error then
							-- Error already reported.
						set_fatal_error
					elseif a_class.is_generic then
							-- Error: the root class should not be generic.
						set_fatal_error
						error_handler.report_vsrc1a_error (a_class)
					else
						l_dynamic_type := dynamic_primary_type (a_class, a_class)
						if a_class.has_interface_error then
								-- Error already reported.
							set_fatal_error
						elseif attached a_class.named_procedure (a_feature_name) as l_procedure then
							l_dynamic_feature := l_dynamic_type.dynamic_procedure (l_procedure, Current)
							dynamic_type_set_builder.mark_type_alive (l_dynamic_type)
							build_dynamic_type_sets
						elseif attached a_class.named_query (a_feature_name) as l_query then
							l_dynamic_feature := l_dynamic_type.dynamic_query (l_query, Current)
							dynamic_type_set_builder.mark_type_alive (l_dynamic_type)
							build_dynamic_type_sets
						else
								-- Error: the feature `a_feature_name' is not
								-- a feature of the `a_class'.
							set_fatal_error
							error_handler.report_gvsrc5a_error (a_class, a_feature_name)
						end
					end
				end
			end
		end

feature {NONE} -- Compilation

	compile_kernel (a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Compile kernel classes.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `a_system_processor.stop_request' starts returning
			-- True. No interruption if `a_system_processor.stop_request' is Void.
		require
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_any: ET_CLASS_TYPE
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_generic_class_type: ET_CLASS_TYPE
			l_class_type: ET_CLASS_TYPE
			l_class: ET_CLASS
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_context: ET_NESTED_TYPE_CONTEXT
			l_formal_parameter: ET_FORMAL_PARAMETER_TYPE
		do
			if not a_system_processor.stop_requested then
				dynamic_types.wipe_out
				l_any := current_system.any_type
					-- Type "BOOLEAN".
				l_class_type := current_system.boolean_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				boolean_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "CHARACTER_8".
				l_class_type := current_system.character_8_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				character_8_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "CHARACTER_32".
				l_class_type := current_system.character_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				character_32_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "INTEGER_8".
				l_class_type := current_system.integer_8_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				integer_8_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "INTEGER_16".
				l_class_type := current_system.integer_16_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				integer_16_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "INTEGER_32".
				l_class_type := current_system.integer_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				integer_32_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "INTEGER_64".
				l_class_type := current_system.integer_64_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				integer_64_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "NATURAL_8".
				l_class_type := current_system.natural_8_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				natural_8_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "NATURAL_16".
				l_class_type := current_system.natural_16_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				natural_16_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "NATURAL_32".
				l_class_type := current_system.natural_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				natural_32_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "NATURAL_64".
				l_class_type := current_system.natural_64_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				natural_64_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "REAL_32".
				l_class_type := current_system.real_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				real_32_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "REAL_64".
				l_class_type := current_system.real_64_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				real_64_type := dynamic_primary_type (l_class_type, l_any)
					-- Type "POINTER".
				l_class_type := current_system.pointer_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				pointer_type := dynamic_primary_type (l_class_type, l_any)
					-- Class "SPECIAL".
				special_count_feature := Void
				special_capacity_feature := Void
				special_item_feature := Void
				l_class := current_system.special_any_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				else
					l_class.process (a_system_processor.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
							-- Error already reported by the previous
							-- processing on `l_class'.
						set_fatal_error
					else
							-- Check feature 'count' of class SPECIAL.
						if not attached l_class.named_query (tokens.count_feature_name) as l_special_count_feature then
							if attached l_class.named_procedure (tokens.count_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.count_feature_name)
							end
						elseif not l_special_count_feature.type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_special_count_feature, l_class.universe.integer_type)
						else
							special_count_feature := l_special_count_feature
						end
							-- Check feature 'capacity' of class SPECIAL.
						if not attached l_class.named_query (tokens.capacity_feature_name) as l_special_capacity_feature then
							if attached l_class.named_procedure (tokens.capacity_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.capacity_feature_name)
							end
						elseif not l_special_capacity_feature.type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_special_capacity_feature, l_class.universe.integer_type)
						else
							special_capacity_feature := l_special_capacity_feature
						end
							-- Check feature 'item' of class SPECIAL.
						l_formal_parameter := l_class.formal_parameter_type (1)
						if not attached l_class.named_query (tokens.item_feature_name) as l_special_item_feature then
							if attached l_class.named_procedure (tokens.item_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe5a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.item_feature_name)
							end
						elseif not l_special_item_feature.type.same_named_type (l_formal_parameter, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_special_item_feature, <<current_system.universe.integer_type.type>>, l_formal_parameter)
						else
							special_item_feature := l_special_item_feature
						end
					end
				end
					-- Type "SPECIAL [CHARACTER_8]"
				l_class := current_system.special_any_type.base_class
				create l_actual_parameters.make_with_capacity (1)
				l_actual_parameters.put_first (current_system.character_8_type)
				create l_generic_class_type.make_generic (Void, l_class.name, l_actual_parameters, l_class)
				special_character_8_type := dynamic_primary_type (l_generic_class_type, l_any)
					-- Type "SPECIAL [CHARACTER_32]"
				l_class := current_system.special_any_type.base_class
				create l_actual_parameters.make_with_capacity (1)
				l_actual_parameters.put_first (current_system.character_32_type)
				create l_generic_class_type.make_generic (Void, l_class.name, l_actual_parameters, l_class)
				special_character_32_type := dynamic_primary_type (l_generic_class_type, l_any)
					-- Type "STRING_8".
				l_class_type := current_system.string_8_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
					string_8_type := unknown_type
				else
					string_8_type := dynamic_primary_type (l_class_type, l_any)
					if l_class.has_interface_error then
							-- Error already reported.
						set_fatal_error
					else
							-- Make features 'area' and 'count' alive at the first
							-- two positions in the feature list of the STRING_8 type.
						if not attached l_class.named_query (tokens.area_feature_name) as l_area_feature then
							if attached l_class.named_procedure (tokens.area_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
							end
						elseif not l_area_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_area_feature)
						else
							l_dynamic_feature := string_8_type.dynamic_query (l_area_feature, Current)
							if not attached l_dynamic_feature.result_type_set as l_result_type_set then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif l_result_type_set.static_type /= attached_type (special_character_8_type) then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_area_feature, attached_type (special_character_8_type).base_type)
							end
						end
						if not attached l_class.named_query (tokens.count_feature_name) as l_count_feature then
							if attached l_class.named_procedure (tokens.count_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.count_feature_name)
							end
						elseif not l_count_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_count_feature)
						else
							l_dynamic_feature := string_8_type.dynamic_query (l_count_feature, Current)
							if not attached l_dynamic_feature.result_type_set as l_result_type_set then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif not l_result_type_set.static_type.base_type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_count_feature, l_class.universe.integer_type)
							end
						end
					end
				end
					-- Type "STRING_32".
				l_class_type := current_system.string_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
					string_32_type := unknown_type
				else
					string_32_type := dynamic_primary_type (l_class_type, l_any)
					if l_class.has_interface_error then
							-- Error already reported.
						set_fatal_error
					else
							-- Make features 'area' and 'count' alive at the first
							-- two positions in the feature list of the STRING_32 type.
						if not attached l_class.named_query (tokens.area_feature_name) as l_area_feature then
							if attached l_class.named_procedure (tokens.area_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
							end
						elseif not l_area_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_area_feature)
						else
							l_dynamic_feature := string_32_type.dynamic_query (l_area_feature, Current)
							if not attached l_dynamic_feature.result_type_set as l_result_type_set then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif l_result_type_set.static_type /= attached_type (special_character_32_type) then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_area_feature, attached_type (special_character_32_type).base_type)
							end
						end
						if not attached l_class.named_query (tokens.count_feature_name) as l_count_feature then
							if attached l_class.named_procedure (tokens.count_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.count_feature_name)
							end
						elseif not l_count_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_count_feature)
						else
							l_dynamic_feature := string_32_type.dynamic_query (l_count_feature, Current)
							if not attached l_dynamic_feature.result_type_set as l_result_type_set then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif not l_result_type_set.static_type.base_type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_count_feature, l_class.universe.integer_type)
							end
						end
					end
				end
					-- Type "IMMUTABLE_STRING_8".
				l_class_type := current_system.immutable_string_8_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
					immutable_string_8_type := unknown_type
				else
					immutable_string_8_type := dynamic_primary_type (l_class_type, l_any)
					if l_class.has_interface_error then
							-- Error already reported.
						set_fatal_error
					else
							-- Make features 'area' and 'count' alive at the first
							-- two positions in the feature list of the IMMUTABLE_STRING_8 type.
						if not attached l_class.named_query (tokens.area_feature_name) as l_area_feature then
							if attached l_class.named_procedure (tokens.area_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
							end
						elseif not l_area_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_area_feature)
						else
							l_dynamic_feature := immutable_string_8_type.dynamic_query (l_area_feature, Current)
							if not attached l_dynamic_feature.result_type_set as l_result_type_set then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif l_result_type_set.static_type /= attached_type (special_character_8_type) then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_area_feature, attached_type (special_character_8_type).base_type)
							end
						end
						if not attached l_class.named_query (tokens.count_feature_name) as l_count_feature then
							if attached l_class.named_procedure (tokens.count_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.count_feature_name)
							end
						elseif not l_count_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_count_feature)
						else
							l_dynamic_feature := immutable_string_8_type.dynamic_query (l_count_feature, Current)
							if not attached l_dynamic_feature.result_type_set as l_result_type_set then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif not l_result_type_set.static_type.base_type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_count_feature, l_class.universe.integer_type)
							end
						end
					end
				end
					-- Type "IMMUTABLE_STRING_32".
				l_class_type := current_system.immutable_string_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
					immutable_string_32_type := unknown_type
				else
					immutable_string_32_type := dynamic_primary_type (l_class_type, l_any)
					if l_class.has_interface_error then
							-- Error already reported.
						set_fatal_error
					else
							-- Make features 'area' and 'count' alive at the first
							-- two positions in the feature list of the IMMUTABLE_STRING_32 type.
						if not attached l_class.named_query (tokens.area_feature_name) as l_area_feature then
							if attached l_class.named_procedure (tokens.area_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
							end
						elseif not l_area_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_area_feature)
						else
							l_dynamic_feature := immutable_string_32_type.dynamic_query (l_area_feature, Current)
							if not attached l_dynamic_feature.result_type_set as l_result_type_set then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif l_result_type_set.static_type /= attached_type (special_character_32_type) then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_area_feature, attached_type (special_character_32_type).base_type)
							end
						end
						if not attached l_class.named_query (tokens.count_feature_name) as l_count_feature then
							if attached l_class.named_procedure (tokens.count_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.count_feature_name)
							end
						elseif not l_count_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_count_feature)
						else
							l_dynamic_feature := immutable_string_32_type.dynamic_query (l_count_feature, Current)
							if not attached l_dynamic_feature.result_type_set as l_result_type_set then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif not l_result_type_set.static_type.base_type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_count_feature, l_class.universe.integer_type)
							end
						end
					end
				end
					-- Class "ARRAY".
				array_area_feature := Void
				array_lower_feature := Void
				array_upper_feature := Void
				l_class := current_system.array_any_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				else
					l_class.process (a_system_processor.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
							-- Error already reported by the previous
							-- processing on `l_class'.
						set_fatal_error
					else
							-- Check features 'area', and 'lower' and 'upper' of class ARRAY.
						create l_context.make_with_capacity (l_class, 1)
						l_context.put_last (l_class.formal_parameter_type (1))
						if not attached l_class.named_query (tokens.area_feature_name) as l_array_area_feature then
							if attached l_class.named_procedure (tokens.area_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
							end
						elseif not l_array_area_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_array_area_feature)
						elseif not l_array_area_feature.type.same_named_type (current_system.special_identity_type, l_context, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_array_area_feature, current_system.special_any_type.base_class)
						else
							array_area_feature := l_array_area_feature
						end
						if not attached l_class.named_query (tokens.lower_feature_name) as l_array_lower_feature then
							if attached l_class.named_procedure (tokens.lower_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.lower_feature_name)
							end
						elseif not l_array_lower_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_array_lower_feature)
						elseif not l_array_lower_feature.type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_array_lower_feature, l_class.universe.integer_type)
						else
							array_lower_feature := l_array_lower_feature
						end
						if not attached l_class.named_query (tokens.upper_feature_name) as l_array_upper_feature then
							if attached l_class.named_procedure (tokens.upper_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.upper_feature_name)
							end
						elseif not l_array_upper_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_array_upper_feature)
						elseif not l_array_upper_feature.type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_array_upper_feature, l_class.universe.integer_type)
						else
							array_upper_feature := l_array_upper_feature
						end
					end
				end
					-- Class "TYPED_POINTER".
				typed_pointer_to_pointer_feature := Void
				l_class := current_system.typed_pointer_identity_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				else
					l_class.process (a_system_processor.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
							-- Error already reported by the previous
							-- processing on `l_class'.
						set_fatal_error
					else
							-- Check feature 'to_pointer' of class "TYPED_POINTER".
						if a_system_processor.older_ise_version (ise_6_0_6_7057) then
							typed_pointer_to_pointer_feature := l_class.named_query (tokens.pointer_item_feature_name)
						else
							typed_pointer_to_pointer_feature := l_class.named_query (tokens.to_pointer_feature_name)
						end
						if not attached typed_pointer_to_pointer_feature as l_typed_pointer_to_pointer_feature then
							if attached l_class.named_procedure (tokens.to_pointer_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.to_pointer_feature_name)
							end
						elseif not l_typed_pointer_to_pointer_feature.type.same_named_type (current_system.pointer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_typed_pointer_to_pointer_feature, current_system.pointer_type)
							typed_pointer_to_pointer_feature := Void
						elseif not l_typed_pointer_to_pointer_feature.is_attribute then
							if
								not attached {ET_EXTERNAL_FUNCTION} l_typed_pointer_to_pointer_feature as l_external_function or else
								not (l_external_function.builtin_class_code = tokens.builtin_pointer_ref_class and then l_external_function.builtin_feature_code = tokens.builtin_pointer_ref_item)
							then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_typed_pointer_to_pointer_feature)
								typed_pointer_to_pointer_feature := Void
							end
						end
					end
				end
					-- Class "ROUTINE".
				routine_closed_operands_feature := Void
				routine_rout_disp_feature := Void
				routine_set_rout_disp_final_feature := Void
				l_class := current_system.routine_identity_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				else
					l_class.process (a_system_processor.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
							-- Error already reported by the previous
							-- processing on `l_class'.
						set_fatal_error
					else
							-- Check feature 'closed_operands' of class "ROUTINE".
						if not attached l_class.named_query (tokens.closed_operands_feature_name) as l_routine_closed_operands_feature then
							if attached l_class.named_procedure (tokens.closed_operands_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.closed_operands_feature_name)
							end
						elseif not l_routine_closed_operands_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_routine_closed_operands_feature)
						elseif not l_routine_closed_operands_feature.type.same_named_type (current_system.detachable_tuple_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_routine_closed_operands_feature, current_system.detachable_tuple_type)
						else
							routine_closed_operands_feature := l_routine_closed_operands_feature
						end
							-- Check feature 'rout_disp' of class "ROUTINE".
						if not attached l_class.named_query (tokens.rout_disp_feature_name) as l_routine_rout_disp_feature then
							if attached l_class.named_procedure (tokens.rout_disp_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.rout_disp_feature_name)
							end
						elseif not l_routine_rout_disp_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_routine_rout_disp_feature)
						elseif not l_routine_rout_disp_feature.type.same_named_type (current_system.pointer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_routine_rout_disp_feature, current_system.pointer_type)
						else
							routine_rout_disp_feature := l_routine_rout_disp_feature
						end
							-- Check feature 'set_rout_disp_final' of class "ROUTINE".
						if not attached l_class.named_procedure (tokens.set_rout_disp_final_feature_name) as l_routine_set_rout_disp_final_feature then
							if attached l_class.named_query (tokens.set_rout_disp_final_feature_name) as l_query then
								set_fatal_error
								error_handler.report_gvkfe4a_error (l_class, l_query)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.set_rout_disp_final_feature_name)
							end
						elseif not attached l_routine_set_rout_disp_final_feature.arguments as l_formal_arguments or else l_formal_arguments.count /= 6 then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_routine_set_rout_disp_final_feature, <<current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.tuple_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (1).type.same_named_type (current_system.universe.pointer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_routine_set_rout_disp_final_feature, <<current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.tuple_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (2).type.same_named_type (current_system.universe.pointer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_routine_set_rout_disp_final_feature, <<current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.tuple_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (3).type.same_named_type (current_system.universe.pointer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_routine_set_rout_disp_final_feature, <<current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.tuple_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (4).type.same_named_type (current_system.universe.tuple_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_routine_set_rout_disp_final_feature, <<current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.tuple_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (5).type.same_named_type (current_system.universe.boolean_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_routine_set_rout_disp_final_feature, <<current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.tuple_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (6).type.same_named_type (current_system.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_routine_set_rout_disp_final_feature, <<current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.pointer_type.type, current_system.universe.tuple_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type>>, Void)
						else
							routine_set_rout_disp_final_feature := l_routine_set_rout_disp_final_feature
						end
					end
				end
					-- Type "ISE_EXCEPTION_MANAGER".
				ise_exception_manager_init_exception_manager_feature := Void
				ise_exception_manager_last_exception_feature := Void
				ise_exception_manager_once_raise_feature := Void
				ise_exception_manager_set_exception_data_feature := Void
				l_class_type := current_system.ise_exception_manager_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
					ise_exception_manager_type := unknown_type
				else
					ise_exception_manager_type := dynamic_primary_type (l_class_type, l_any)
					l_class.process (a_system_processor.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
							-- Error already reported by the previous
							-- processing on `l_class'.
						set_fatal_error
					else
							-- Check feature 'init_exception_manager' of class "ISE_EXCEPTION_MANAGER".
						if not attached l_class.named_procedure (tokens.init_exception_manager_feature_name) as l_procedure then
							if attached l_class.named_query (tokens.init_exception_manager_feature_name) as l_query then
								set_fatal_error
								error_handler.report_gvkfe4a_error (l_class, l_query)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.init_exception_manager_feature_name)
							end
						elseif attached l_procedure.arguments as l_formal_arguments and then l_formal_arguments.count /= 0 then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, Void, Void)
						else
							l_dynamic_feature := ise_exception_manager_type.dynamic_procedure (l_procedure, Current)
							l_dynamic_feature.set_regular (True)
							ise_exception_manager_init_exception_manager_feature := l_dynamic_feature
						end
							-- Check feature 'last_exception' of class "ISE_EXCEPTION_MANAGER".
						if not attached l_class.named_query (tokens.last_exception_feature_name) as l_query then
							if attached l_class.named_procedure (tokens.last_exception_feature_name) as l_procedure then
								set_fatal_error
								error_handler.report_gvkfe4a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.last_exception_feature_name)
							end
						elseif attached l_query.arguments as l_formal_arguments and then l_formal_arguments.count /= 0 then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_query, Void, current_system.universe.detachable_exception_type)
						elseif not l_query.type.type.same_named_type (current_system.universe.detachable_exception_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_query, Void, current_system.universe.detachable_exception_type)
						else
							l_dynamic_feature := ise_exception_manager_type.dynamic_query (l_query, Current)
							l_dynamic_feature.set_regular (True)
							ise_exception_manager_last_exception_feature := l_dynamic_feature
						end
							-- Check feature 'once_raise' of class "ISE_EXCEPTION_MANAGER".
						if not attached l_class.named_procedure (tokens.once_raise_feature_name) as l_procedure then
							if attached l_class.named_query (tokens.once_raise_feature_name) as l_query then
								set_fatal_error
								error_handler.report_gvkfe4a_error (l_class, l_query)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.once_raise_feature_name)
							end
						elseif not attached l_procedure.arguments as l_formal_arguments or else l_formal_arguments.count /= 1 then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.exception_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (1).type.same_named_type (current_system.universe.exception_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.exception_type.type>>, Void)
						else
							l_dynamic_feature := ise_exception_manager_type.dynamic_procedure (l_procedure, Current)
							l_dynamic_feature.set_regular (True)
							ise_exception_manager_once_raise_feature := l_dynamic_feature
						end
							-- Check feature 'set_exception_data' of class "ISE_EXCEPTION_MANAGER".
						if not attached l_class.named_procedure (tokens.set_exception_data_feature_name) as l_procedure then
							if attached l_class.named_query (tokens.set_exception_data_feature_name) as l_query then
								set_fatal_error
								error_handler.report_gvkfe4a_error (l_class, l_query)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.set_exception_data_feature_name)
							end
						elseif not attached l_procedure.arguments as l_formal_arguments or else l_formal_arguments.count /= 12 then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (1).type.same_named_type (current_system.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (2).type.same_named_type (current_system.universe.boolean_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (3).type.same_named_type (current_system.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (4).type.same_named_type (current_system.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (5).type.same_named_type (current_system.universe.string_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (6).type.same_named_type (current_system.universe.string_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (7).type.same_named_type (current_system.universe.string_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (8).type.same_named_type (current_system.universe.string_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (9).type.same_named_type (current_system.universe.string_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (10).type.same_named_type (current_system.universe.string_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (11).type.same_named_type (current_system.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						elseif not l_formal_arguments.formal_argument (12).type.same_named_type (current_system.universe.boolean_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe6a_error (l_class, l_procedure, <<current_system.universe.integer_type.type, current_system.universe.boolean_type.type, current_system.universe.integer_type.type, current_system.universe.integer_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.string_type.type, current_system.universe.integer_type.type, current_system.universe.boolean_type.type>>, Void)
						else
							l_dynamic_feature := ise_exception_manager_type.dynamic_procedure (l_procedure, Current)
							l_dynamic_feature.set_regular (True)
							ise_exception_manager_set_exception_data_feature := l_dynamic_feature
						end
					end
				end
					-- Type "ANY".
				any_type := dynamic_primary_type (current_system.any_type, l_any)
					-- Type "NONE".
				none_type := dynamic_primary_type (current_system.detachable_none_type, l_any)
			end
		end

	compile_all_features (a_class: ET_CLASS)
			-- Make sure that all features declared in non-deferred non-generic
			-- classes will be included in the compilation: their dynamic type sets
			-- will be computed.
		require
			a_class_not_void: a_class /= Void
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_dynamic_type: ET_DYNAMIC_PRIMARY_TYPE
			i, nb: INTEGER
		do
			if a_class.implementation_checked and then not a_class.has_implementation_error then
				if not a_class.is_deferred and not a_class.is_generic then
					l_dynamic_type := dynamic_primary_type (a_class, a_class)
					l_queries := a_class.queries
					nb := l_queries.declared_count
					from i := 1 until i > nb loop
						l_query := l_queries.item (i)
						l_dynamic_feature := l_dynamic_type.dynamic_query (l_query, Current)
						i := i + 1
					end
					l_procedures := a_class.procedures
					nb := l_procedures.declared_count
					from i := 1 until i > nb loop
						l_procedure := l_procedures.item (i)
						l_dynamic_feature := l_dynamic_type.dynamic_procedure (l_procedure, Current)
						i := i + 1
					end
				end
			end
		end

	build_dynamic_type_sets
			-- Build dynamic type sets for current system.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `system_processor.stop_request' starts returning
			-- True. No interruption if `system_processor.stop_request' is Void.
		local
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
		do
			if not system_processor.stop_requested then
				l_builder := dynamic_type_set_builder
				l_builder.set_no_debug (True)
				l_builder.set_no_assertion (True)
				l_builder.set_catcall_error_mode (catcall_error_mode)
				l_builder.set_catcall_warning_mode (catcall_warning_mode)
				l_builder.build_dynamic_type_sets
				if l_builder.has_fatal_error then
					set_fatal_error
				end
			end
		end

feature -- Error handling

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred?

	set_fatal_error
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

	error_handler: ET_ERROR_HANDLER
			-- Error handler
		do
			Result := system_processor.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Processors

	dynamic_type_set_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			-- Builder of dynamic type sets

	null_dynamic_type_set_builder: ET_DYNAMIC_NULL_TYPE_SET_BUILDER
			-- Null builder of dynamic type sets

	activate_dynamic_type_set_builder (a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Activate dynamic type set builder.
		require
			a_system_processor_not_void: a_system_processor /= Void
		do
			if dynamic_type_set_builder = null_dynamic_type_set_builder then
				create {ET_DYNAMIC_PUSH_TYPE_SET_BUILDER} dynamic_type_set_builder.make (Current, a_system_processor)
				dynamic_type_set_builder.set_catcall_error_mode (catcall_error_mode)
				dynamic_type_set_builder.set_catcall_warning_mode (catcall_warning_mode)
			end
		end

	set_dynamic_type_set_builder (a_builder: like dynamic_type_set_builder)
			-- Set `dynamic_type_set_builder' to `a_builder'.
		require
			a_builder_not_void: a_builder /= Void
		do
			dynamic_type_set_builder := a_builder
			dynamic_type_set_builder.set_catcall_error_mode (catcall_error_mode)
			dynamic_type_set_builder.set_catcall_warning_mode (catcall_warning_mode)
		ensure
			dynamic_type_set_builder_set: dynamic_type_set_builder = a_builder
		end

feature -- Features

	ise_exception_manager_init_exception_manager_feature: detachable ET_DYNAMIC_FEATURE
			-- Expected procedure 'init_exception_manager' in class "ISE_EXCEPTION_MANAGER"

	ise_exception_manager_last_exception_feature: detachable ET_DYNAMIC_FEATURE
			-- Expected procedure 'last_exception' in class "ISE_EXCEPTION_MANAGER"

	ise_exception_manager_once_raise_feature: detachable ET_DYNAMIC_FEATURE
			-- Expected procedure 'once_raise' in class "ISE_EXCEPTION_MANAGER"

	ise_exception_manager_set_exception_data_feature: detachable ET_DYNAMIC_FEATURE
			-- Expected procedure 'set_exception_data' in class "ISE_EXCEPTION_MANAGER"

	ise_runtime_new_type_instance_of_feature: detachable ET_DYNAMIC_FEATURE
			-- Feature "ISE_RUNTIME.new_type_instance_of" (or one similar feature).
			-- Void if this feature is not called.

	ise_runtime_reference_field_feature: detachable ET_DYNAMIC_FEATURE
			-- Feature "ISE_RUNTIME.reference_field" (or one similar feature).
			-- Void if this feature is not called.

	ise_runtime_set_reference_field_feature: detachable ET_DYNAMIC_FEATURE
			-- Feature "ISE_RUNTIME.set_reference_field" (or one similar feature).
			-- Void if this feature is not called.

	ise_runtime_type_conforms_to_feature: detachable ET_DYNAMIC_FEATURE
			-- Feature "ISE_RUNTIME.type_conforms_to" (or one similar feature).
			-- Void if this feature is not called.

feature -- Feature setting

	set_ise_runtime_new_type_instance_of_feature (a_feature: ET_DYNAMIC_FEATURE)
			-- Set `ise_runtime_new_type_instance_of_feature' to `a_feature'.
		require
			ise_runtime_new_type_instance_of_feature_void: ise_runtime_new_type_instance_of_feature = Void
			a_feature_not_void: a_feature /= Void
		local
			i: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			ise_runtime_new_type_instance_of_feature := a_feature
			from
				i := dynamic_types.count
			until
				i < 1
			loop
				l_type := dynamic_types.item (i)
				propagate_type_of_type_result_type (l_type)
				if attached l_type.attached_type as l_attached_type then
					propagate_type_of_type_result_type (l_attached_type)
				end
				i := i - 1
			end
		ensure
			ise_runtime_new_type_instance_of_feature_set: ise_runtime_new_type_instance_of_feature = a_feature
		end

	set_ise_runtime_reference_field_feature (a_feature: ET_DYNAMIC_FEATURE)
			-- Set `ise_runtime_reference_field_feature' to `a_feature'.
			-- Make sure that all attributes get generated and
			-- propagate their dynamic type sets accordingly.
		require
			ise_runtime_reference_field_feature_void: ise_runtime_reference_field_feature = Void
			a_feature_not_void: a_feature /= Void
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_PRIMARY_TYPE]
			l_dynamic_type: ET_DYNAMIC_PRIMARY_TYPE
			i, nb: INTEGER
			l_attribute: ET_DYNAMIC_FEATURE
			j, l_attribute_count: INTEGER
			l_dynamic_type_set_builder: like dynamic_type_set_builder
		do
			ise_runtime_reference_field_feature := a_feature
			l_dynamic_type_set_builder := dynamic_type_set_builder
			l_dynamic_types := dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
					-- Propagate the dynamic type set of all attributes
					-- which have already been used.
				l_dynamic_type := l_dynamic_types.item (i)
				l_attribute_count := l_dynamic_type.attribute_count
				from j := 1 until j > l_attribute_count loop
					l_attribute := l_dynamic_type.queries.item (j)
					l_dynamic_type_set_builder.propagate_reference_field_dynamic_types (l_attribute)
					j := j + 1
				end
				i := i + 1
			end
				-- Make sure that all other attributes are marked as used.
				-- Their dynamic type set will be propagated while marking
				-- them as used.
			use_all_attributes
		ensure
			ise_runtime_reference_field_feature_set: ise_runtime_reference_field_feature = a_feature
		end

	set_ise_runtime_set_reference_field_feature (a_feature: ET_DYNAMIC_FEATURE)
			-- Set `ise_runtime_set_reference_field_feature' to `a_feature'.
			-- Make sure that all attributes get generated and
			-- propagate their dynamic type sets accordingly.
		require
			ise_runtime_set_reference_field_feature_void: ise_runtime_set_reference_field_feature = Void
			a_feature_not_void: a_feature /= Void
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_PRIMARY_TYPE]
			l_dynamic_type: ET_DYNAMIC_PRIMARY_TYPE
			i, nb: INTEGER
			l_attribute: ET_DYNAMIC_FEATURE
			j, l_attribute_count: INTEGER
			l_dynamic_type_set_builder: like dynamic_type_set_builder
		do
			ise_runtime_set_reference_field_feature := a_feature
			l_dynamic_type_set_builder := dynamic_type_set_builder
			l_dynamic_types := dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
					-- Propagate the dynamic type set of all attributes
					-- which have already been used.
				l_dynamic_type := l_dynamic_types.item (i)
				l_attribute_count := l_dynamic_type.attribute_count
				from j := 1 until j > l_attribute_count loop
					l_attribute := l_dynamic_type.queries.item (j)
					l_dynamic_type_set_builder.propagate_set_reference_field_dynamic_types (l_attribute)
					j := j + 1
				end
				i := i + 1
			end
				-- Make sure that all other attributes are marked as used.
				-- Their dynamic type set will be propagated while marking
				-- them as used.
			use_all_attributes
		ensure
			ise_runtime_set_reference_field_feature_set: ise_runtime_set_reference_field_feature = a_feature
		end

	set_ise_runtime_type_conforms_to_feature (a_feature: ET_DYNAMIC_FEATURE)
			-- Set `ise_runtime_type_conforms_to_feature' to `a_feature'.
		require
			ise_runtime_type_conforms_to_feature_void: ise_runtime_type_conforms_to_feature = Void
			a_feature_not_void: a_feature /= Void
		do
			ise_runtime_type_conforms_to_feature := a_feature
		ensure
			ise_runtime_type_conforms_to_feature_set: ise_runtime_type_conforms_to_feature = a_feature
		end

feature {ET_DYNAMIC_TYPE_SET_BUILDER} -- Static features

	array_area_feature: detachable ET_QUERY
			-- Expected attribute 'area' in class "ARRAY"

	array_lower_feature: detachable ET_QUERY
			-- Expected attribute 'lower' in class "ARRAY"

	array_upper_feature: detachable ET_QUERY
			-- Expected attribute 'upper' in class "ARRAY"

	special_count_feature: detachable ET_QUERY
			-- Expected attribute 'count' in class "SPECIAL"

	special_capacity_feature: detachable ET_QUERY
			-- Expected attribute 'capacity' in class "SPECIAL"

	special_item_feature: detachable ET_QUERY
			-- Expected attribute 'item' in class "SPECIAL"

	typed_pointer_to_pointer_feature: detachable ET_QUERY
			-- Expected attribute 'to_pointer' in class "TYPED_POINTER"

	routine_closed_operands_feature: detachable ET_QUERY
			-- Expected attribute 'closed_operands' in class "ROUTINE"

	routine_rout_disp_feature: detachable ET_QUERY
			-- Expected attribute 'rout_disp' in class "ROUTINE"

	routine_set_rout_disp_final_feature: detachable ET_PROCEDURE
			-- Expected procedure 'set_rout_disp_final' in class "ROUTINE"

feature -- Measurement

	alive_dynamic_type_count: INTEGER
			-- Number of dynamic types which are alive in `dynamic_types'
		local
			i, nb: INTEGER
		do
			nb := dynamic_types.count
			from i := 1 until i > nb loop
				if dynamic_types.item (i).is_alive then
					Result := Result + 1
				end
				i := i + 1
			end
		ensure
			alive_dynamic_type_count_not_negative: Result >= 0
		end

	dynamic_feature_count: INTEGER
			-- Number of dynamic features in the types of `dynamic_types'
		local
			i, nb: INTEGER
		do
			nb := dynamic_types.count
			from i := 1 until i > nb loop
				Result := Result + dynamic_types.item (i).queries.count
				Result := Result + dynamic_types.item (i).procedures.count
				i := i + 1
			end
		ensure
			dynamic_feature_count_not_negative: Result >= 0
		end

feature {NONE} -- Implementation

	empty_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Empty dynamic type set list
		once
			create Result.make
		ensure
			dynamic_type_sets_not_void: Result /= Void
			dynamic_type_sets_empty: Result.is_empty
		end

	type_name_buffer: STRING
			-- Buffer to hold type names
		once
			create Result.make (200)
		ensure
			type_name_buffer_not_void: Result /= Void
		end

invariant

	current_system_not_void: current_system /= Void
	dynamic_types_not_void: dynamic_types /= Void
	no_void_dynamic_type: not dynamic_types.has_void
	dynamic_generic_types_by_name_not_void: dynamic_generic_types_by_name /= Void
	no_void_dynamic_generic_type: not dynamic_generic_types_by_name.has_void_item
	any_type_not_void: any_type /= Void
	none_type_not_void: none_type /= Void
	boolean_type_not_void: boolean_type /= Void
	character_8_type_not_void: character_8_type /= Void
	character_32_type_not_void: character_32_type /= Void
	immutable_string_8_type_not_void: immutable_string_8_type /= Void
	immutable_string_32_type_not_void: immutable_string_32_type /= Void
	integer_8_type_not_void: integer_8_type /= Void
	integer_16_type_not_void: integer_16_type /= Void
	integer_32_type_not_void: integer_32_type /= Void
	integer_64_type_not_void: integer_64_type /= Void
	natural_8_type_not_void: natural_8_type /= Void
	natural_16_type_not_void: natural_16_type /= Void
	natural_32_type_not_void: natural_32_type /= Void
	natural_64_type_not_void: natural_64_type /= Void
	real_32_type_not_void: real_32_type /= Void
	real_64_type_not_void: real_64_type /= Void
	pointer_type_not_void: pointer_type /= Void
	string_8_type_not_void: string_8_type /= Void
	string_32_type_not_void: string_32_type /= Void
	special_character_8_type_not_void: special_character_8_type /= Void
	special_character_32_type_not_void: special_character_32_type /= Void
	ise_exception_manager_type_not_void: ise_exception_manager_type /= Void
	unknown_type_not_void: unknown_type /= Void
	root_creation_procedure: attached root_creation_procedure as l_root_creation_procedure implies l_root_creation_procedure.is_procedure
	dynamic_type_set_builder_not_void: dynamic_type_set_builder /= Void
	null_dynamic_type_set_builder_not_void: null_dynamic_type_set_builder /= Void
	system_processor_not_void: system_processor /= Void

end
