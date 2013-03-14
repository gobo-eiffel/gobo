note

	description:

		"Eiffel dynamic systems at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2013, Eric Bezault and others"
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

	make (a_system: like current_system)
			-- Create a new dynamic system.
		require
			a_system_not_void: a_system /= Void
		local
			nb: INTEGER
		do
			catcall_error_mode := True
			current_system := a_system
			nb := current_system.master_classes.capacity
			create null_dynamic_type_set_builder.make (Current)
			set_dynamic_type_set_builder (null_dynamic_type_set_builder)
			create dynamic_types.make (nb)
				-- Reset the index of classes so that `dynamic_type' can work properly.
			current_system.classes_do_recursive (agent {ET_CLASS}.set_index (0))
			make_basic_types
		ensure
			current_system_set: current_system = a_system
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
			any_type := unknown_type
			none_type := unknown_type
		ensure
			any_type_not_void: any_type /= Void
			none_type_not_void: none_type /= Void
			boolean_type_not_void: boolean_type /= Void
			character_8_type_not_void: character_8_type /= Void
			character_32_type_not_void: character_32_type /= Void
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
			unknown_type_not_void: unknown_type /= Void
		end

feature -- Access

	root_type: ET_DYNAMIC_TYPE
			-- Root type

	root_creation_procedure: ET_DYNAMIC_FEATURE
			-- Root creation procedure

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

feature -- Status report

	catcall_error_mode: BOOLEAN
			-- Are CAT-call errors considered as fatal errors?

	catcall_warning_mode: BOOLEAN
			-- Are CAT-call errors considered just as warnings?

	full_class_checking: BOOLEAN
			-- Should the whole content of classes to be checked (even
			-- features not reachable from the root creation procedure)?

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

feature -- Types

	boolean_type: ET_DYNAMIC_TYPE
			-- Type "BOOLEAN"

	character_8_type: ET_DYNAMIC_TYPE
			-- Type "CHARACTER_8"

	character_32_type: ET_DYNAMIC_TYPE
			-- Type "CHARACTER_32"

	integer_8_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_8"

	integer_16_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_16"

	integer_32_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_32"

	integer_64_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_64"

	natural_8_type: ET_DYNAMIC_TYPE
			-- Type "NATURAL_8"

	natural_16_type: ET_DYNAMIC_TYPE
			-- Type "NATURAL_16"

	natural_32_type: ET_DYNAMIC_TYPE
			-- Type "NATURAL_32"

	natural_64_type: ET_DYNAMIC_TYPE
			-- Type "NATURAL_64"

	real_32_type: ET_DYNAMIC_TYPE
			-- Type "REAL_32"

	real_64_type: ET_DYNAMIC_TYPE
			-- Type "REAL_64"

	pointer_type: ET_DYNAMIC_TYPE
			-- Type "POINTER"

	any_type: ET_DYNAMIC_TYPE
			-- Type "ANY"

	none_type: ET_DYNAMIC_TYPE
			-- Type "NONE"

	string_8_type: ET_DYNAMIC_TYPE
			-- Type "STRING_8"

	string_32_type: ET_DYNAMIC_TYPE
			-- Type "STRING_32"

	special_character_8_type: ET_DYNAMIC_TYPE
			-- Type "SPECIAL [CHARACTER_8]"

	special_character_32_type: ET_DYNAMIC_TYPE
			-- Type "SPECIAL [CHARACTER_32]"

	unknown_type: ET_DYNAMIC_TYPE
			-- Type "*UNKNOWN*"

	dynamic_type (a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT): ET_DYNAMIC_TYPE
			-- Dynamic type corresponding to `a_type' in `a_context';
			-- Create a new one if it does not exist yet
		require
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			i: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_base_class: ET_CLASS
			l_any: ET_CLASS_TYPE
		do
			l_base_class := a_type.base_class (a_context)
			i := l_base_class.index
			if i >= 1 and i <= dynamic_types.count then
				l_type := dynamic_types.item (i)
				if l_type.base_class /= l_base_class then
					-- Wrong index.
				elseif not l_base_class.is_generic and not l_base_class.is_tuple_class then
					if a_type.is_type_expanded (a_context) = l_type.is_expanded then
						Result := l_type
					elseif l_type.next_type = Void then
						Result := new_dynamic_type (a_type, a_context)
						dynamic_types.force_last (Result)
						Result.set_hash_code (dynamic_types.count)
							-- `dynamic_type' is re-entrant (`new_dynamic_type' is
							-- calling it). So at this stage 'l_type.next_type' is
							-- not necessarily Void anymore. We have to take that
							-- possibility into account.
						Result.set_next_type (l_type.next_type)
						l_type.set_next_type (Result)
						propagate_type_of_type_result_type (Result)
					else
						check
							same_expandedness: a_type.is_type_expanded (a_context) = l_type.next_type.is_expanded
						end
						Result := l_type.next_type
					end
				else
						-- Traverse all dynamic types with the same base class.
						-- If not found then add this new dynamic type.
					l_any := current_system.any_type
					from until
						Result /= Void
					loop
						if l_type.base_type.same_base_type (a_type, a_context, l_any) then
							Result := l_type
						elseif l_type.next_type = Void then
							Result := new_dynamic_type (a_type, a_context)
								-- Note that it may happen that 'Result' is already in
								-- `dynamic_types' if it appears to be the meta type of
								-- another type. In that case `dynamic_type' is called
								-- recursively to create that other type in `new_type_type'.
								-- Then calling `propagate_type_of_type_result_type' on that
								-- type may call `dynamic_type' again on its meta type (which
								-- is nothig else but 'Result').
							if dynamic_types.last /= Result then
								dynamic_types.force_last (Result)
								Result.set_hash_code (dynamic_types.count)
									-- `dynamic_type' is re-entrant (`new_dynamic_type' is
									-- calling it). So at this stage 'l_type.next_type' is
									-- not necessarily Void anymore. We have to take that
									-- possibility into account.
								Result.set_next_type (l_type.next_type)
								l_type.set_next_type (Result)
							end
							propagate_type_of_type_result_type (Result)
						else
							l_type := l_type.next_type
						end
					end
				end
			end
			if Result = Void then
					-- No dynamic type yet with this base class.
					-- Add the new dynamic type and keep track
					-- of its associated index.
				if full_class_checking then
					l_base_class.process (current_system.implementation_checker)
					if not l_base_class.implementation_checked or else l_base_class.has_implementation_error then
						set_fatal_error
					end
				else
					l_base_class.process (current_system.interface_checker)
					if not l_base_class.interface_checked or else l_base_class.has_interface_error then
						set_fatal_error
					end
				end
				Result := new_dynamic_type (a_type, a_context)
					-- Note that it may happen that 'Result' is already in
					-- `dynamic_types' if it appears to be the meta type of
					-- another type. In that case `dynamic_type' is called
					-- recursively to create that other type in `new_type_type'.
					-- Then calling `propagate_type_of_type_result_type' on that
					-- type may call `dynamic_type' again on its meta type (which
					-- is nothig else but 'Result').
				if dynamic_types.is_empty or else dynamic_types.last /= Result then
					dynamic_types.force_last (Result)
					Result.set_hash_code (dynamic_types.count)
						-- `dynamic_type' is re-entrant (`new_dynamic_type' is calling it).
						-- So at this stage another type with the same base class may have
						-- been inserted into `dynamic_types'. We have to take that possibility
						-- into account.
					i := l_base_class.index
					if i >= 1 and i <= dynamic_types.count then
						l_type := dynamic_types.item (i)
						if l_type.base_class /= l_base_class then
								-- Wrong index.
							l_base_class.set_index (dynamic_types.count)
						else
								-- Another type has been inserted.
							Result.set_next_type (l_type.next_type)
							l_type.set_next_type (Result)
						end
					else
							-- No other type has been inserted.
						l_base_class.set_index (dynamic_types.count)
					end
				end
				propagate_type_of_type_result_type (Result)
			end
		ensure
			dynamic_type_not_void: Result /= Void
		end

	meta_type (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE
			-- Dynamic type corresponding to the meta type of `a_type';
			-- Create a new one if it does not exist yet
			--
			-- If `a_type' represents the Eiffel type 'T', then
			-- the meta type will represent the Eiffel type 'TYPE [T]'.
		require
			a_type_not_void: a_type /= Void
		local
			l_base_type: ET_GENERIC_CLASS_TYPE
			l_base_class: ET_NAMED_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			Result := a_type.meta_type
			if Result = Void then
				l_base_class := current_system.type_any_type.named_base_class
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (a_type.base_type)
				create l_base_type.make (Void, l_base_class.name, l_parameters, l_base_class)
				Result := dynamic_type (l_base_type, current_system.any_type)
				a_type.set_meta_type (Result)
			end
		ensure
			meta_type_not_void: Result /= Void
			definition: Result = a_type.meta_type
		end

	dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			-- Dynamic types in the system

feature {NONE} -- Types

	new_dynamic_type (a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT): ET_DYNAMIC_TYPE
			-- New dynamic type corresponding to `a_type' in `a_context'
		require
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			l_base_type: ET_BASE_TYPE
			l_base_class: ET_CLASS
		do
			l_base_type := a_type.base_type (a_context)
			l_base_class := l_base_type.base_class
			if l_base_type.same_as_base_class then
				l_base_type := l_base_class
			end
			if l_base_class.is_special_class then
				Result := new_special_type (l_base_type)
			elseif l_base_class.is_tuple_class then
				Result := new_tuple_type (l_base_type)
			elseif l_base_class.is_array_class then
				Result := new_array_type (l_base_type)
			elseif l_base_class.is_typed_pointer_class then
				Result := new_typed_pointer_type (l_base_type)
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
			end
		ensure
			new_dynamic_type_not_void: Result /= Void
		end

	new_special_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_TYPE
			-- New dynamic "SPECIAL" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_special: a_base_type.base_class.is_special_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_any: ET_CLASS_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void and then l_actual_parameters.count = 1 then
					-- Class SPECIAL should have exactly one generic parameter.
				l_item_type := dynamic_type (l_actual_parameters.type (1), l_any)
				l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
				create {ET_DYNAMIC_SPECIAL_TYPE} Result.make (a_base_type, l_base_class, l_item_type_set)
			else
				create Result.make (a_base_type, l_base_class)
			end
				-- Make feature 'count' and 'capacity' alive at the first two
				-- positions in the feature list of the "SPECIAL" type.
			if special_count_feature /= Void then
				l_dynamic_feature := Result.dynamic_query (special_count_feature, Current)
			end
			if special_capacity_feature /= Void then
				l_dynamic_feature := Result.dynamic_query (special_capacity_feature, Current)
			end
		ensure
			new_special_type_not_void: Result /= Void
		end

	new_tuple_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_TYPE
			-- New dynamic "TUPLE" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_tuple: a_base_type.base_class.is_tuple_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
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
		ensure
			new_tuple_type_not_void: Result /= Void
		end

	new_array_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_TYPE
			-- New dynamic "ARRAY" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_array: a_base_type.base_class.is_array_class
		local
			l_base_class: ET_CLASS
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			l_base_class := a_base_type.base_class
			create Result.make (a_base_type, l_base_class)
				-- Make features 'area', and 'lower' and 'upper' alive at the
				-- first three positions in the feature list of the "ARRAY" type.
			if array_area_feature /= Void then
				l_dynamic_feature := Result.dynamic_query (array_area_feature, Current)
			end
			if array_lower_feature /= Void then
				l_dynamic_feature := Result.dynamic_query (array_lower_feature, Current)
			end
			if array_upper_feature /= Void then
				l_dynamic_feature := Result.dynamic_query (array_upper_feature, Current)
			end
		ensure
			new_array_type_not_void: Result /= Void
		end

	new_typed_pointer_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_TYPE
			-- New dynamic "TYPED_POINTER" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_typed_pointer: a_base_type.base_class.is_typed_pointer_class
		local
			l_base_class: ET_CLASS
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			l_base_class := a_base_type.base_class
			create Result.make (a_base_type, l_base_class)
				-- Make feature 'to_pointer' alive at the first position
				-- in the feature list of the "TYPED_POINTER" type.
			if typed_pointer_to_pointer_feature /= Void then
				l_dynamic_feature := Result.dynamic_query (typed_pointer_to_pointer_feature, Current)
			end
		ensure
			new_typed_pointer_type_not_void: Result /= Void
		end

	new_type_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_TYPE
			-- New dynamic "TYPE" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_type: a_base_type.base_class.is_type_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
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
				Result := l_type.meta_type
				if Result = Void then
					create Result.make (a_base_type, l_base_class)
					l_type.set_meta_type (Result)
				end
			else
				create Result.make (a_base_type, l_base_class)
			end
		ensure
			new_type_type_not_void: Result /= Void
		end

	new_procedure_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_TYPE
			-- New dynamic "PROCEDURE" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_procedure: a_base_type.base_class.is_procedure_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			l_any: ET_CLASS_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void and then l_actual_parameters.count = 2 then
				l_item_type := dynamic_type (l_actual_parameters.type (2), l_any)
				l_actual_parameters := l_item_type.base_type.actual_parameters
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
					-- Make feature 'closed_operands' alive at the first position
					-- in the feature list of the "PROCEDURE" type.
				if routine_closed_operands_feature /= Void then
					l_dynamic_feature := Result.seeded_dynamic_query (routine_closed_operands_feature.first_seed, Current)
				end
					-- Make feature 'is_target_closed' alive at the second position
					-- in the feature list of the "PROCEDURE" type.
				if routine_is_target_closed_feature /= Void then
					l_dynamic_feature := Result.seeded_dynamic_query (routine_is_target_closed_feature.first_seed, Current)
				end
			else
				create Result.make (a_base_type, l_base_class)
			end
		ensure
			new_procedure_type_not_void: Result /= Void
		end

	new_function_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_TYPE
			-- New dynamic "FUNCTION" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_function: a_base_type.base_class.is_function_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_return_type: ET_DYNAMIC_TYPE
			l_return_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			l_any: ET_CLASS_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void and then l_actual_parameters.count = 3 then
				l_return_type := dynamic_type (l_actual_parameters.type (3), l_any)
				l_return_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_return_type)
					-- Unless proven otherwise after possible attachments,
					-- the result is assumed to be never Void.
				l_return_type_set.set_never_void
				l_item_type := dynamic_type (l_actual_parameters.type (2), l_any)
				l_actual_parameters := l_item_type.base_type.actual_parameters
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
					-- Make feature 'closed_operands' alive at the first position
					-- in the feature list of the "FUNCTION" type.
				if routine_closed_operands_feature /= Void then
					l_dynamic_feature := Result.seeded_dynamic_query (routine_closed_operands_feature.first_seed, Current)
				end
					-- Make feature 'is_target_closed' alive at the second position
					-- in the feature list of the "FUNCTION" type.
				if routine_is_target_closed_feature /= Void then
					l_dynamic_feature := Result.seeded_dynamic_query (routine_is_target_closed_feature.first_seed, Current)
				end
			else
				create Result.make (a_base_type, l_base_class)
			end
		ensure
			new_function_type_not_void: Result /= Void
		end

	new_predicate_type (a_base_type: ET_BASE_TYPE): ET_DYNAMIC_TYPE
			-- New dynamic "PREDICATE" type corresponding to `a_base_type'
		require
			a_base_type_not_void: a_base_type /= Void
			is_base_type: a_base_type.is_base_type
			is_predicate: a_base_type.base_class.is_predicate_class
		local
			l_base_class: ET_CLASS
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_return_type: ET_DYNAMIC_TYPE
			l_return_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			l_any: ET_CLASS_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			l_any := current_system.any_type
			l_base_class := a_base_type.base_class
			l_actual_parameters := a_base_type.actual_parameters
			if l_actual_parameters /= Void and then l_actual_parameters.count = 2 then
				l_return_type := boolean_type
				l_return_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_return_type)
				l_item_type := dynamic_type (l_actual_parameters.type (2), l_any)
				l_actual_parameters := l_item_type.base_type.actual_parameters
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
					-- Make feature 'closed_operands' alive at the first position
					-- in the feature list of the "PREDICATE" type.
				if routine_closed_operands_feature /= Void then
					l_dynamic_feature := Result.seeded_dynamic_query (routine_closed_operands_feature.first_seed, Current)
				end
					-- Make feature 'is_target_closed' alive at the second position
					-- in the feature list of the "PREDICATE" type.
				if routine_is_target_closed_feature /= Void then
					l_dynamic_feature := Result.seeded_dynamic_query (routine_is_target_closed_feature.first_seed, Current)
				end
			else
				create Result.make (a_base_type, l_base_class)
			end
		ensure
			new_predicate_type_not_void: Result /= Void
		end

	propagate_type_of_type_result_type (a_type: ET_DYNAMIC_TYPE)
			-- Propagate `a_type' to the dynamic type set of the result of the
			-- built-in feature corresponding to "INTERNAL.type_of_type".
		local
			l_meta_type: ET_DYNAMIC_TYPE
		do
			if type_of_type_feature /= Void then
				if not in_create_meta_type then
					create_meta_type (a_type)
					l_meta_type := a_type.meta_type
					dynamic_type_set_builder.mark_type_alive (l_meta_type)
					dynamic_type_set_builder.propagate_type_of_type_result_type (l_meta_type, type_of_type_feature)
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
			l_meta_type: ET_DYNAMIC_TYPE
		do
				-- Make sure that we don't create the meta type of the meta type that
				-- we are about to create, otherwise we wold enter an infinite loop.
			l_old_in_create_meta_type := in_create_meta_type
			in_create_meta_type := True
			l_meta_type := meta_type (a_type)
			in_create_meta_type := l_old_in_create_meta_type
		ensure
			meta_type_created: a_type.meta_type /= Void
		end

	in_create_meta_type: BOOLEAN
			-- Flag to avoid recursive call on `create_meta_type'

feature {ET_DYNAMIC_FEATURE} -- Types

	type_of_type_feature: ET_DYNAMIC_FEATURE
			-- Feature corresponding to "INTERNAL.type_of_type"

	set_type_of_type_feature (a_feature: ET_DYNAMIC_FEATURE)
			-- Set `type_of_type_feature' to `a_feature'.
		local
			i: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_meta_type: ET_DYNAMIC_TYPE
		do
			type_of_type_feature := a_feature
			if a_feature /= Void then
				from
					i := dynamic_types.count
				until
					i < 1
				loop
					l_type := dynamic_types.item (i)
					create_meta_type (l_type)
					l_meta_type := l_type.meta_type
					dynamic_type_set_builder.mark_type_alive (l_meta_type)
					dynamic_type_set_builder.propagate_type_of_type_result_type (l_meta_type, a_feature)
					i := i - 1
				end
			end
		ensure
			type_of_type_feature_set: type_of_type_feature = a_feature
		end

feature -- Compilation

	compile
			-- Compile current system.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `current_system.stop_request' starts returning
			-- True. No interruption if `current_system.stop_request' is Void.
		local
			l_root_type: ET_BASE_TYPE
		do
			l_root_type := current_system.root_type
			if l_root_type = Void then
				compile_all
			elseif l_root_type.same_named_type (current_system.none_type, tokens.unknown_class, tokens.unknown_class) then
				compile_all
			elseif l_root_type.same_named_type (current_system.any_type, tokens.unknown_class, tokens.unknown_class) then
				compile_all
			else
				compile_system
			end
		end

	compile_system
			-- Compile all code reachable from the root creation procedure of the root class.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `current_system.stop_request' starts returning
			-- True. No interruption if `current_system.stop_request' is Void.
		local
			l_root_type: ET_BASE_TYPE
			l_name: ET_FEATURE_NAME
			l_procedure: ET_PROCEDURE
			l_query: ET_QUERY
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
			l_class: ET_CLASS
		do
			has_fatal_error := False
			current_system.activate_processors
			activate_dynamic_type_set_builder
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			current_system.preparse_recursive
			if error_handler.benchmark_shown then
				current_system.print_time (dt1, "Degree 6")
			end
			compile_kernel
			if not current_system.stop_requested then
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
					l_class.process (current_system.eiffel_parser)
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
						root_type := dynamic_type (l_class, l_class)
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
								root_creation_procedure := root_type.dynamic_procedure (l_procedure, Current)
								root_creation_procedure.set_creation (True)
								dynamic_type_set_builder.mark_type_alive (root_type)
								build_dynamic_type_sets
							end
						end
					end
				end
			end
		end

	compile_all
			-- Compile all classes in the Eiffel system.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `current_system.stop_request' starts returning
			-- True. No interruption if `current_system.stop_request' is Void.
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			has_fatal_error := False
			activate_dynamic_type_set_builder
			current_system.compile_all
			if not current_system.stop_requested and then error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_kernel
			current_system.classes_do_recursive_until (agent compile_all_features, current_system.stop_request)
			build_dynamic_type_sets
			if not current_system.stop_requested and then error_handler.benchmark_shown then
				current_system.print_time (dt1, "Degree Dynamic Type Set")
			end
		end

	compile_feature (a_feature_name: ET_FEATURE_NAME; a_class: ET_CLASS)
			-- Compile all code reachable from the feature `a_feature_name' from `a_class'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `current_system.stop_request' starts returning
			-- True. No interruption if `current_system.stop_request' is Void.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_class_not_void: a_class /= Void
		local
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_procedure: ET_PROCEDURE
			l_query: ET_QUERY
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			has_fatal_error := False
			current_system.activate_processors
			activate_dynamic_type_set_builder
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			current_system.preparse_recursive
			if error_handler.benchmark_shown then
				current_system.print_time (dt1, "Degree 6")
			end
			compile_kernel
			if not current_system.stop_requested then
				if not a_class.is_preparsed then
						-- Error: unknown class.
					set_fatal_error
					error_handler.report_gvsrc4a_error (a_class)
				else
					a_class.process (current_system.eiffel_parser)
					if not a_class.is_parsed or else a_class.has_syntax_error then
							-- Error already reported.
						set_fatal_error
					elseif a_class.is_generic then
							-- Error: the root class should not be generic.
						set_fatal_error
						error_handler.report_vsrc1a_error (a_class)
					else
						l_dynamic_type := dynamic_type (a_class, a_class)
						if a_class.has_interface_error then
								-- Error already reported.
							set_fatal_error
						else
							l_procedure := a_class.named_procedure (a_feature_name)
							if l_procedure /= Void then
								l_dynamic_feature := l_dynamic_type.dynamic_procedure (l_procedure, Current)
								dynamic_type_set_builder.mark_type_alive (l_dynamic_type)
								build_dynamic_type_sets
							else
								l_query := a_class.named_query (a_feature_name)
								if l_query = Void then
										-- Error: the feature `a_feature_name' is not
										-- a feature of the `a_class'.
									set_fatal_error
									error_handler.report_gvsrc5a_error (a_class, a_feature_name)
								else
									l_dynamic_feature := l_dynamic_type.dynamic_query (l_query, Current)
									dynamic_type_set_builder.mark_type_alive (l_dynamic_type)
									build_dynamic_type_sets
								end
							end
						end
					end
				end
			end
		end

feature {NONE} -- Compilation

	compile_kernel
			-- Compile kernel classes.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `current_system.stop_request' starts returning
			-- True. No interruption if `current_system.stop_request' is Void.
		local
			l_any: ET_CLASS_TYPE
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_generic_class_type: ET_GENERIC_CLASS_TYPE
			l_class_type: ET_CLASS_TYPE
			l_class: ET_CLASS
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_area_feature: ET_QUERY
			l_count_feature: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			if not current_system.stop_requested then
				dynamic_types.wipe_out
				l_any := current_system.any_type
					-- Type "BOOLEAN".
				l_class_type := current_system.boolean_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				boolean_type := dynamic_type (l_class_type, l_any)
					-- Type "CHARACTER_8".
				l_class_type := current_system.character_8_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				character_8_type := dynamic_type (l_class_type, l_any)
					-- Type "CHARACTER_32".
				l_class_type := current_system.character_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				character_32_type := dynamic_type (l_class_type, l_any)
					-- Type "INTEGER_8".
				l_class_type := current_system.integer_8_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				integer_8_type := dynamic_type (l_class_type, l_any)
					-- Type "INTEGER_16".
				l_class_type := current_system.integer_16_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				integer_16_type := dynamic_type (l_class_type, l_any)
					-- Type "INTEGER_32".
				l_class_type := current_system.integer_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				integer_32_type := dynamic_type (l_class_type, l_any)
					-- Type "INTEGER_64".
				l_class_type := current_system.integer_64_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				integer_64_type := dynamic_type (l_class_type, l_any)
					-- Type "NATURAL_8".
				l_class_type := current_system.natural_8_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				natural_8_type := dynamic_type (l_class_type, l_any)
					-- Type "NATURAL_16".
				l_class_type := current_system.natural_16_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				natural_16_type := dynamic_type (l_class_type, l_any)
					-- Type "NATURAL_32".
				l_class_type := current_system.natural_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				natural_32_type := dynamic_type (l_class_type, l_any)
					-- Type "NATURAL_64".
				l_class_type := current_system.natural_64_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				natural_64_type := dynamic_type (l_class_type, l_any)
					-- Type "REAL_32".
				l_class_type := current_system.real_32_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				real_32_type := dynamic_type (l_class_type, l_any)
					-- Type "REAL_64".
				l_class_type := current_system.real_64_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				real_64_type := dynamic_type (l_class_type, l_any)
					-- Type "POINTER".
				l_class_type := current_system.pointer_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				pointer_type := dynamic_type (l_class_type, l_any)
					-- Class "SPECIAL".
				special_count_feature := Void
				special_capacity_feature := Void
				l_class := current_system.special_any_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				else
					l_class.process (current_system.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
							-- Error already reported by the previous
							-- processing on `l_class'.
						set_fatal_error
					else
							-- Check feature 'count' of class SPECIAL.
						special_count_feature := l_class.named_query (tokens.count_feature_name)
						if special_count_feature = Void then
							l_procedure := l_class.named_procedure (tokens.count_feature_name)
							if l_procedure /= Void then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.count_feature_name)
							end
						elseif not special_count_feature.type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, special_count_feature, l_class.universe.integer_type)
							special_count_feature := Void
						end
							-- Check feature 'capacity' of class SPECIAL.
						special_capacity_feature := l_class.named_query (tokens.capacity_feature_name)
						if special_capacity_feature = Void then
							l_procedure := l_class.named_procedure (tokens.capacity_feature_name)
							if l_procedure /= Void then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.capacity_feature_name)
							end
						elseif not special_capacity_feature.type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, special_capacity_feature, l_class.universe.integer_type)
							special_capacity_feature := Void
						end
					end
				end
					-- Type "SPECIAL [CHARACTER_8]"
				l_class := current_system.special_any_type.base_class
				create l_actual_parameters.make_with_capacity (1)
				l_actual_parameters.put_first (current_system.character_8_type)
				create l_generic_class_type.make (Void, l_class.name, l_actual_parameters, l_class)
				special_character_8_type := dynamic_type (l_generic_class_type, l_any)
					-- Type "SPECIAL [CHARACTER_32]"
				l_class := current_system.special_any_type.base_class
				create l_actual_parameters.make_with_capacity (1)
				l_actual_parameters.put_first (current_system.character_32_type)
				create l_generic_class_type.make (Void, l_class.name, l_actual_parameters, l_class)
				special_character_32_type := dynamic_type (l_generic_class_type, l_any)
					-- Type "STRING_8".
				l_class_type := current_system.string_8_type
				l_class := l_class_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
					string_8_type := unknown_type
				else
					string_8_type := dynamic_type (l_class_type, l_any)
					if l_class.has_interface_error then
							-- Error already reported.
						set_fatal_error
					else
							-- Make features 'area' and 'count' alive at the first
							-- two positions in the feature list of the STRING_8 type.
						l_area_feature := l_class.named_query (tokens.area_feature_name)
						if l_area_feature = Void then
							l_procedure := l_class.named_procedure (tokens.area_feature_name)
							if l_procedure /= Void then
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
							l_result_type_set := l_dynamic_feature.result_type_set
							if l_result_type_set = Void then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif l_result_type_set.static_type /= special_character_8_type then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_area_feature, special_character_8_type.base_type)
							end
						end
						l_count_feature := l_class.named_query (tokens.count_feature_name)
						if l_count_feature = Void then
							l_procedure := l_class.named_procedure (tokens.count_feature_name)
							if l_procedure /= Void then
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
							l_result_type_set := l_dynamic_feature.result_type_set
							if l_result_type_set = Void then
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
					string_32_type := dynamic_type (l_class_type, l_any)
					if l_class.has_interface_error then
							-- Error already reported.
						set_fatal_error
					else
							-- Make features 'area' and 'count' alive at the first
							-- two positions in the feature list of the STRING_32 type.
						l_area_feature := l_class.named_query (tokens.area_feature_name)
						if l_area_feature = Void then
							l_procedure := l_class.named_procedure (tokens.area_feature_name)
							if l_procedure /= Void then
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
							l_result_type_set := l_dynamic_feature.result_type_set
							if l_result_type_set = Void then
									-- Internal error: an attribute should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif l_result_type_set.static_type /= special_character_32_type then
								set_fatal_error
								error_handler.report_gvkfe3a_error (l_class, l_area_feature, special_character_32_type.base_type)
							end
						end
						l_count_feature := l_class.named_query (tokens.count_feature_name)
						if l_count_feature = Void then
							l_procedure := l_class.named_procedure (tokens.count_feature_name)
							if l_procedure /= Void then
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
							l_result_type_set := l_dynamic_feature.result_type_set
							if l_result_type_set = Void then
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
					l_class.process (current_system.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
							-- Error already reported by the previous
							-- processing on `l_class'.
						set_fatal_error
					else
							-- Check features 'area', and 'lower' and 'upper' of class ARRAY.
						array_area_feature := l_class.named_query (tokens.area_feature_name)
						if array_area_feature = Void then
							l_procedure := l_class.named_procedure (tokens.area_feature_name)
							if l_procedure /= Void then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
							end
						elseif not array_area_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, array_area_feature)
							array_area_feature := Void
						elseif not array_area_feature.type.same_named_type (current_system.special_any_type.base_class, current_system.special_any_type.base_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, array_area_feature, current_system.special_any_type.base_class)
							array_area_feature := Void
						end
						array_lower_feature := l_class.named_query (tokens.lower_feature_name)
						if array_lower_feature = Void then
							l_procedure := l_class.named_procedure (tokens.lower_feature_name)
							if l_procedure /= Void then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.lower_feature_name)
							end
						elseif not array_lower_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, array_lower_feature)
							array_lower_feature := Void
						elseif not array_lower_feature.type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, array_lower_feature, l_class.universe.integer_type)
							array_lower_feature := Void
						end
						array_upper_feature := l_class.named_query (tokens.upper_feature_name)
						if array_upper_feature = Void then
							l_procedure := l_class.named_procedure (tokens.upper_feature_name)
							if l_procedure /= Void then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.upper_feature_name)
							end
						elseif not array_upper_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, array_upper_feature)
							array_upper_feature := Void
						elseif not array_upper_feature.type.same_named_type (l_class.universe.integer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, array_upper_feature, l_class.universe.integer_type)
							array_upper_feature := Void
						end
					end
				end
					-- Class "TYPED_POINTER".
				typed_pointer_to_pointer_feature := Void
				l_class := current_system.typed_pointer_any_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				else
					l_class.process (current_system.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
							-- Error already reported by the previous
							-- processing on `l_class'.
						set_fatal_error
					else
							-- Check feature 'to_pointer' of class "TYPED_POINTER".
						if current_system.is_ise and then current_system.ise_version < ise_6_0_6_7057 then
							typed_pointer_to_pointer_feature := l_class.named_query (tokens.pointer_item_feature_name)
						else
							typed_pointer_to_pointer_feature := l_class.named_query (tokens.to_pointer_feature_name)
						end
						if typed_pointer_to_pointer_feature = Void then
							l_procedure := l_class.named_procedure (tokens.to_pointer_feature_name)
							if l_procedure /= Void then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.to_pointer_feature_name)
							end
						elseif not typed_pointer_to_pointer_feature.type.same_named_type (current_system.pointer_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, typed_pointer_to_pointer_feature, current_system.pointer_type)
							typed_pointer_to_pointer_feature := Void
						elseif not typed_pointer_to_pointer_feature.is_attribute then
							if not attached {ET_EXTERNAL_FUNCTION} typed_pointer_to_pointer_feature as l_external_function or else l_external_function.builtin_code /= tokens.builtin_pointer_feature (tokens.builtin_pointer_item) then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, typed_pointer_to_pointer_feature)
								typed_pointer_to_pointer_feature := Void
							end
						end
					end
				end
					-- Class "ROUTINE".
				routine_closed_operands_feature := Void
				l_class := current_system.routine_type.base_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				else
					l_class.process (current_system.interface_checker)
					if not l_class.interface_checked or else l_class.has_interface_error then
							-- Error already reported by the previous
							-- processing on `l_class'.
						set_fatal_error
					else
							-- Check feature 'closed_operands' of class "ROUTINE".
						routine_closed_operands_feature := l_class.named_query (tokens.closed_operands_feature_name)
						if routine_closed_operands_feature = Void then
							l_procedure := l_class.named_procedure (tokens.closed_operands_feature_name)
							if l_procedure /= Void then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.closed_operands_feature_name)
							end
						elseif not routine_closed_operands_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, routine_closed_operands_feature)
							routine_closed_operands_feature := Void
						elseif not routine_closed_operands_feature.type.same_named_type (current_system.detachable_tuple_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, routine_closed_operands_feature, current_system.detachable_tuple_type)
							routine_closed_operands_feature := Void
						end
							-- Check feature 'is_target_closed' of class "ROUTINE".
						routine_is_target_closed_feature := l_class.named_query (tokens.is_target_closed_feature_name)
						if routine_is_target_closed_feature = Void then
							l_procedure := l_class.named_procedure (tokens.is_target_closed_feature_name)
							if l_procedure /= Void then
								set_fatal_error
								error_handler.report_gvkfe2a_error (l_class, l_procedure)
							else
								set_fatal_error
								error_handler.report_gvkfe1a_error (l_class, tokens.is_target_closed_feature_name)
							end
						elseif not routine_is_target_closed_feature.is_attribute then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, routine_is_target_closed_feature)
							routine_is_target_closed_feature := Void
						elseif not routine_is_target_closed_feature.type.same_named_type (current_system.boolean_type, l_class, l_class) then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, routine_is_target_closed_feature, current_system.boolean_type)
							routine_is_target_closed_feature := Void
						end
					end
				end
					-- Type "ANY".
				any_type := dynamic_type (current_system.any_type, l_any)
					-- Type "NONE".
				none_type := dynamic_type (current_system.detachable_none_type, l_any)
			end
		end

	compile_all_features (a_class: ET_CLASS)
			-- Make sure that all features of non-deferred non-generic classes
			-- will be included in the compilation: their dynamic type sets
			-- will be computed.
		require
			a_class_not_void: a_class /= Void
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			if a_class.implementation_checked and then not a_class.has_implementation_error then
				if not a_class.is_deferred and not a_class.is_generic then
					l_dynamic_type := dynamic_type (a_class, a_class)
					l_queries := a_class.queries
					--nb := l_queries.count
					nb := l_queries.declared_count
					from i := 1 until i > nb loop
						l_query := l_queries.item (i)
						l_dynamic_feature := l_dynamic_type.dynamic_query (l_query, Current)
						i := i + 1
					end
					l_procedures := a_class.procedures
					--nb := l_procedures.count
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
			-- is received, i.e. `current_system.stop_request' starts returning
			-- True. No interruption if `current_system.stop_request' is Void.
		local
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
		do
			if not current_system.stop_requested then
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
			Result := current_system.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Processors

	dynamic_type_set_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			-- Builder of dynamic type sets

	null_dynamic_type_set_builder: ET_DYNAMIC_NULL_TYPE_SET_BUILDER
			-- Null builder of dynamic type sets

	activate_dynamic_type_set_builder
			-- Activate dynamic type set builder.
		do
			if dynamic_type_set_builder = null_dynamic_type_set_builder then
				create {ET_DYNAMIC_PUSH_TYPE_SET_BUILDER} dynamic_type_set_builder.make (Current)
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

feature {NONE} -- Features

	array_area_feature: ET_QUERY
			-- Expected attribute 'area' in class "ARRAY"

	array_lower_feature: ET_QUERY
			-- Expected attribute 'lower' in class "ARRAY"

	array_upper_feature: ET_QUERY
			-- Expected attribute 'upper' in class "ARRAY"

	special_count_feature: ET_QUERY
			-- Expected attribute 'count' in class "SPECIAL"

	special_capacity_feature: ET_QUERY
			-- Expected attribute 'capacity' in class "SPECIAL"

	typed_pointer_to_pointer_feature: ET_QUERY
			-- Expected attribute 'to_pointer' in class "TYPED_POINTER"

	routine_closed_operands_feature: ET_QUERY
			-- Expected attribute 'closed_operands' in class "ROUTINE"

	routine_is_target_closed_feature: ET_QUERY
			-- Expected attribute 'is_target_closed' in class "ROUTINE"

feature {NONE} -- Implementation

	empty_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Empty dynamic type set list
		once
			create Result.make
		ensure
			dynamic_type_sets_not_void: Result /= Void
			dynamic_type_sets_empty: Result.is_empty
		end

invariant

	current_system_not_void: current_system /= Void
	dynamic_types_not_void: dynamic_types /= Void
	no_void_dynamic_type: not dynamic_types.has_void
	any_type_not_void: any_type /= Void
	none_type_not_void: none_type /= Void
	boolean_type_not_void: boolean_type /= Void
	character_8_type_not_void: character_8_type /= Void
	character_32_type_not_void: character_32_type /= Void
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
	unknown_type_not_void: unknown_type /= Void
	root_creation_procedure: root_creation_procedure /= Void implies root_creation_procedure.is_procedure
	dynamic_type_set_builder_not_void: dynamic_type_set_builder /= Void
	null_dynamic_type_set_builder_not_void: null_dynamic_type_set_builder /= Void

end
