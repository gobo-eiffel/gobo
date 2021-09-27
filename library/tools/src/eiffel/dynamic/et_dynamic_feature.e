note

	description:

		"Eiffel features equipped with dynamic type sets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_FEATURE

inherit

	DEBUG_OUTPUT

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_feature: like static_feature; a_target_type: ET_DYNAMIC_PRIMARY_TYPE; a_system: ET_DYNAMIC_SYSTEM)
			-- Create a new feature equipped with dynamic type sets,
			-- associated with compilation time feature `a_feature' in
			-- type `a_target_type' in the surrounding system `a_system'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_system_not_void: a_system /= Void
		local
			l_dynamic_type_set_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_type: detachable ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			arg: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
		do
			l_dynamic_type_set_builder := a_system.dynamic_type_set_builder
			static_feature := a_feature
			target_type := a_target_type
			dynamic_type_sets := empty_dynamic_type_sets
			create query_calls.make_map (10)
			create procedure_calls.make_map (10)
			if attached {ET_EXTERNAL_ROUTINE} a_feature as l_external_routine then
				builtin_class_code := l_external_routine.builtin_class_code
				builtin_feature_code := l_external_routine.builtin_feature_code
			else
				builtin_class_code := tokens.builtin_not_builtin
				builtin_feature_code := tokens.builtin_not_builtin
			end
			l_type := a_feature.type
			if l_type /= Void then
				if a_feature.is_constant_attribute or a_feature.is_unique_attribute then
					l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
					result_type_set := l_dynamic_type
					l_dynamic_type_set_builder.mark_type_alive (l_dynamic_type.primary_type)
				elseif builtin_class_code = tokens.builtin_identified_routines_class and then builtin_feature_code = tokens.builtin_identified_routines_eif_id_object then
						-- Note that the 'object_id' mechanism is some kind of
						-- weak reference implementation. Therefore, by nature,
						-- it is likely that the 'Result' will be Void at some
						-- point after a GC cycle.
					result_type_set := l_dynamic_type_set_builder.object_id_dynamic_type_set
				elseif
					(builtin_class_code = tokens.builtin_ise_runtime_class and then
					builtin_feature_code = tokens.builtin_ise_runtime_new_type_instance_of) and then
					attached a_system.ise_runtime_new_type_instance_of_feature as l_ise_runtime_new_type_instance_of_feature
				then
					result_type_set := l_ise_runtime_new_type_instance_of_feature.result_type_set
				elseif
					(builtin_class_code = tokens.builtin_ise_runtime_class and then
					(builtin_feature_code = tokens.builtin_ise_runtime_reference_field or
					builtin_feature_code = tokens.builtin_ise_runtime_reference_field_at)) and then
					attached a_system.ise_runtime_reference_field_feature as l_reference_field_feature
				then
					result_type_set := l_reference_field_feature.result_type_set
				elseif builtin_class_code = tokens.builtin_ise_runtime_class and then builtin_feature_code = tokens.builtin_ise_runtime_reference_field_at_offset then
					l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
					result_type_set := l_dynamic_type_set_builder.alive_conforming_descendants (l_dynamic_type)
				elseif builtin_class_code = tokens.builtin_ise_runtime_class and then builtin_feature_code = tokens.builtin_ise_runtime_new_instance_of then
					l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
					result_type_set := l_dynamic_type_set_builder.alive_conforming_descendants (l_dynamic_type)
				elseif builtin_class_code = tokens.builtin_ise_runtime_class and then builtin_feature_code = tokens.builtin_ise_runtime_new_special_of_reference_instance_of then
					l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
					result_type_set := l_dynamic_type_set_builder.alive_conforming_descendants (l_dynamic_type)
				elseif builtin_class_code = tokens.builtin_ise_runtime_class and then builtin_feature_code = tokens.builtin_ise_runtime_new_tuple_instance_of then
					l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
					result_type_set := l_dynamic_type_set_builder.alive_conforming_descendants (l_dynamic_type)
				else
					l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
					l_dynamic_type_set := l_dynamic_type_set_builder.new_dynamic_type_set (l_dynamic_type)
						-- Unless proven otherwise after possible attachments,
						-- the result is assumed to be never Void.
					l_dynamic_type_set.set_never_void
					result_type_set := l_dynamic_type_set
				end
			end
			if attached a_feature.arguments as args then
				nb := args.count
				if nb > 0 then
					create l_dynamic_type_sets.make_with_capacity (nb)
					dynamic_type_sets := l_dynamic_type_sets
					from i := 1 until i > nb loop
						arg := args.formal_argument (i)
						if i = 1 and then (builtin_class_code = tokens.builtin_identified_routines_class and then builtin_feature_code = tokens.builtin_identified_routines_eif_object_id) then
							l_dynamic_type_set := l_dynamic_type_set_builder.object_id_dynamic_type_set
						elseif
							i = 4 and then
							(builtin_class_code = tokens.builtin_ise_runtime_class and then
							(builtin_feature_code = tokens.builtin_ise_runtime_set_reference_field or
							builtin_feature_code = tokens.builtin_ise_runtime_set_reference_field_at)) and then
							attached a_system.ise_runtime_set_reference_field_feature as l_set_reference_field_feature and then
							attached l_set_reference_field_feature.argument_type_set (4) as l_argument_type_set
						then
							l_dynamic_type_set := l_argument_type_set
						else
							l_type := arg.type
							l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
							l_dynamic_type_set := l_dynamic_type_set_builder.new_dynamic_type_set (l_dynamic_type)
								-- Unless proven otherwise after possible attachments,
								-- a formal actual argument is assumed to be never Void.
							l_dynamic_type_set.set_never_void
						end
						l_dynamic_type_sets.put_last (l_dynamic_type_set)
						arg.name.set_index (i)
						arg.set_index (i)
						i := i + 1
					end
				end
			end
			if
				builtin_class_code = tokens.builtin_ise_runtime_class and then
				builtin_feature_code = tokens.builtin_ise_runtime_new_type_instance_of
			then
				if a_system.ise_runtime_new_type_instance_of_feature = Void then
					a_system.set_ise_runtime_new_type_instance_of_feature (Current)
				end
			elseif
				builtin_class_code = tokens.builtin_ise_runtime_class and then
				(builtin_feature_code = tokens.builtin_ise_runtime_reference_field or
				builtin_feature_code = tokens.builtin_ise_runtime_reference_field_at)
			then
				if a_system.ise_runtime_reference_field_feature = Void then
					a_system.set_ise_runtime_reference_field_feature (Current)
				end
			elseif
				builtin_class_code = tokens.builtin_ise_runtime_class and then
				(builtin_feature_code = tokens.builtin_ise_runtime_set_reference_field or
				builtin_feature_code = tokens.builtin_ise_runtime_set_reference_field_at)
			then
				if a_system.ise_runtime_set_reference_field_feature = Void then
					a_system.set_ise_runtime_set_reference_field_feature (Current)
				end
			end
			if a_feature.has_seed (a_system.current_system.copy_seed) then
				is_copy_routine := True
			elseif a_feature.has_seed (a_system.current_system.is_equal_seed) then
				is_is_equal_routine := True
			end
		ensure
			static_feature_set: static_feature = a_feature
			target_type_set: target_type = a_target_type
		end

feature -- Access

	result_type_set: detachable ET_DYNAMIC_TYPE_SET
			-- Type set of result, if any

	target_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type of target

	argument_type_set (i: INTEGER): detachable ET_DYNAMIC_TYPE_SET
			-- Type set of `i'-th argument;
			-- Void if unknown yet
		do
			if i >= 1 and i <= dynamic_type_sets.count then
				Result := dynamic_type_sets.item (i)
			end
		end

	dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Dynamic type sets of expressions within current feature;
			-- Dynamic type sets for arguments are stored first

	dynamic_type_set (an_operand: ET_OPERAND): detachable ET_DYNAMIC_TYPE_SET
			-- Dynamic type set associated with `an_operand';
			-- Void if unknown yet
		require
			an_operand_not_void: an_operand /= Void
		local
			i: INTEGER
		do
			i := an_operand.index
			if i >= 1 and i <= dynamic_type_sets.count then
				Result := dynamic_type_sets.item (i)
			end
		end

	first_precursor: detachable ET_DYNAMIC_PRECURSOR
			-- First precursor called from current feature;
			-- May be void if no precursor called

	other_precursors: detachable ET_DYNAMIC_PRECURSOR_LIST
			-- Other precursors called from current feature;
			-- May be void if zero or one precursor called

	dynamic_precursor (a_feature: ET_FEATURE; a_parent_type: ET_DYNAMIC_PRIMARY_TYPE; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_PRECURSOR
			-- Dynamic precursor of current feature;
			-- `a_feature' is the precursor of the current feaure in `a_parent_type'
		require
			a_feature_not_void: a_feature /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_system_not_void: a_system /= Void
		local
			l_precursor: ET_DYNAMIC_PRECURSOR
			l_result: detachable ET_DYNAMIC_PRECURSOR
			l_other_precursors: like other_precursors
			i, nb: INTEGER
		do
			if not attached first_precursor as l_first_precursor then
				create Result.make (a_feature, a_parent_type, Current, a_system)
				Result.set_regular (is_regular or is_creation)
				first_precursor := Result
			elseif l_first_precursor.parent_type = a_parent_type and l_first_precursor.static_feature = a_feature then
				Result := l_first_precursor
			else
				l_other_precursors := other_precursors
				if l_other_precursors = Void then
					create Result.make (a_feature, a_parent_type, Current, a_system)
					Result.set_regular (is_regular or is_creation)
					create l_other_precursors.make_with_capacity (1)
					l_other_precursors.put_last (Result)
					other_precursors := l_other_precursors
				else
					nb := l_other_precursors.count
					from i := 1 until i > nb loop
						l_precursor := l_other_precursors.item (i)
						if l_precursor.parent_type = a_parent_type and l_precursor.static_feature = a_feature then
							l_result := l_precursor
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
					if l_result /= Void then
						Result := l_result
					else
						create Result.make (a_feature, a_parent_type, Current, a_system)
						Result.set_regular (is_regular or is_creation)
						l_other_precursors.force_last (Result)
					end
				end
			end
		ensure
			dynamic_precursor_not_void: Result /= Void
		end

	static_feature: ET_FEATURE
			-- Feature at compilation time

	id: INTEGER
			-- ID

feature -- Setting

	set_dynamic_type_sets (a_dynamic_type_sets: like dynamic_type_sets)
			-- Set `dynamic_type_sets' to `a_dynamic_type_sets'.
		require
			a_dynamic_type_sets_not_void: a_dynamic_type_sets /= Void
		do
			dynamic_type_sets := a_dynamic_type_sets
		ensure
			dynamic_type_sets_set: dynamic_type_sets = a_dynamic_type_sets
		end

	set_result_type_set (a_result_type_set: like result_type_set)
			-- Set `result_type_set' to `a_result_type_set'.
		do
			result_type_set := a_result_type_set
		ensure
			result_type_set_set: result_type_set = a_result_type_set
		end

	set_id (i: INTEGER)
			-- Set `id' to `i'.
		do
			id := i
		ensure
			id_set: id = i
		end

feature -- Status report

	is_built: BOOLEAN
			-- Have dynamic type sets of current feature been built?

	is_generated: BOOLEAN
			-- Has code for current feature been registered to be generated?

	is_static_generated: BOOLEAN
			-- Has code for the statically called version of current feature been registered to be generated?

	is_creation: BOOLEAN
			-- Is current feature used as a creation procedure?

	is_regular: BOOLEAN
			-- Is current feature used as a regular feature?

	is_address: BOOLEAN
			-- Is address of current feature used?

	is_function: BOOLEAN
			-- Is feature a function?
		do
			if static_feature.is_function then
				if is_builtin then
						-- The function should not be a built-in attribute.
					Result := not target_type.is_builtin_attribute (static_feature, builtin_class_code, builtin_feature_code)
				else
					Result := True
				end
			end
		ensure
			query: Result implies is_query
		end

	is_attribute: BOOLEAN
			-- Is feature an attribute?
		do
			if not is_builtin then
				Result := static_feature.is_attribute
			else
				Result := target_type.is_builtin_attribute (static_feature, builtin_class_code, builtin_feature_code)
			end
		ensure
			query: Result implies is_query
		end

	is_constant_attribute: BOOLEAN
			-- Is feature a constant attribute?
		do
			Result := static_feature.is_constant_attribute
		ensure
			query: Result implies is_query
		end

	is_unique_attribute: BOOLEAN
			-- Is feature a unique attribute?
		do
			Result := static_feature.is_unique_attribute
		ensure
			query: Result implies is_query
		end

	is_query: BOOLEAN
			-- Is current feature a query?
		do
			Result := (result_type_set /= Void)
		ensure
			definition: Result = (result_type_set /= Void)
		end

	is_procedure: BOOLEAN
			-- Is current feature a procedure?
		do
			Result := (result_type_set = Void)
		ensure
			definition: Result = (result_type_set = Void)
		end

	is_once: BOOLEAN
			-- Is current feature a once routine?
		do
			Result := static_feature.is_once
		ensure
			definition: Result = static_feature.is_once
		end

	is_once_per_process: BOOLEAN
			-- Is current feature a once-per-process routine?
		do
			Result := static_feature.is_once_per_process
		ensure
			definition: Result = static_feature.is_once_per_process
			is_once: Result implies is_once
		end

	is_once_per_thread: BOOLEAN
			-- Is current feature a once-per-thread routine?
		do
			Result := static_feature.is_once_per_thread
		ensure
			definition: Result = static_feature.is_once_per_thread
			is_once: Result implies is_once
		end

	is_once_per_object: BOOLEAN
			-- Is current feature a once-per-object routine?
		do
			Result := static_feature.is_once_per_object
		ensure
			definition: Result = static_feature.is_once_per_object
			is_once: Result implies is_once
		end

	is_precursor: BOOLEAN
			-- Is current feature a precursor?
		do
			-- Result := False
		end

	is_copy_routine: BOOLEAN
			-- Is current feature the version of 'ANY.copy' in `target_type'?

	is_is_equal_routine: BOOLEAN
			-- Is current feature the version of 'ANY.is_equal' in `target_type'?

	is_semistrict (a_system: ET_DYNAMIC_SYSTEM): BOOLEAN
			-- Is current feature semistrict?
		require
			a_system_not_void: a_system /= Void
		do
			if not is_builtin then
				-- Result := False
			elseif builtin_class_code = {ET_TOKEN_CODES}.builtin_boolean_class then
				inspect builtin_feature_code
				when {ET_TOKEN_CODES}.builtin_boolean_and_then then
					Result := target_type = a_system.boolean_type
				when {ET_TOKEN_CODES}.builtin_boolean_or_else then
					Result := target_type = a_system.boolean_type
				when {ET_TOKEN_CODES}.builtin_boolean_implies then
					Result := target_type = a_system.boolean_type
				else
					Result := False
				end
			end
		end

	is_builtin: BOOLEAN
			-- Is current feature built-in?
		do
			Result := builtin_class_code /= {ET_TOKEN_CODES}.builtin_not_builtin
		end

	is_builtin_any_class: BOOLEAN
			-- Is current feature a built-in feature of class "ANY"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_any_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_any_class)
		end

	is_builtin_arguments_32_class: BOOLEAN
			-- Is current feature a built-in feature of class "ARGUMENTS_32"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_arguments_32_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_arguments_32_class)
		end

	is_builtin_boolean_class: BOOLEAN
			-- Is current feature a built-in feature of class "BOOLEAN"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_boolean_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_boolean_class)
		end

	is_builtin_boolean_ref_class: BOOLEAN
			-- Is current feature a built-in feature of class "BOOLEAN_REF"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_boolean_ref_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_boolean_ref_class)
		end

	is_builtin_character_n_class: BOOLEAN
			-- Is current feature a built-in feature of classes "CHARACTER_N"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_character_8_class or builtin_class_code = {ET_TOKEN_CODES}.builtin_character_32_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_character_8_class or builtin_class_code = {ET_TOKEN_CODES}.builtin_character_32_class)
		end

	is_builtin_character_n_ref_class: BOOLEAN
			-- Is current feature a built-in feature of classes "CHARACTER_N_REF"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_character_8_ref_class or builtin_class_code = {ET_TOKEN_CODES}.builtin_character_32_ref_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_character_8_ref_class or builtin_class_code = {ET_TOKEN_CODES}.builtin_character_32_ref_class)
		end

	is_builtin_com_failure_class: BOOLEAN
			-- Is current feature a built-in feature of class "COM_FAILURE"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_com_failure_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_com_failure_class)
		end

	is_builtin_exception_manager_class: BOOLEAN
			-- Is current feature a built-in feature of class "EXCEPTION_MANAGER"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_exception_manager_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_exception_manager_class)
		end

	is_builtin_exception_manager_factory_class: BOOLEAN
			-- Is current feature a built-in feature of class "EXCEPTION_MANAGER_FACTORY"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_exception_manager_factory_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_exception_manager_factory_class)
		end

	is_builtin_function_class: BOOLEAN
			-- Is current feature a built-in feature of class "FUNCTION"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_function_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_function_class)
		end

	is_builtin_identified_routines_class: BOOLEAN
			-- Is current feature a built-in feature of class "IDENTIFIED_ROUTINES"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_identified_routines_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_identified_routines_class)
		end

	is_builtin_integer_n_class: BOOLEAN
			-- Is current feature a built-in feature of classes "INTEGER_N" or "NATURAL_N"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_8_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_16_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_32_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_64_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_8_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_16_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_32_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_64_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_8_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_16_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_32_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_64_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_8_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_16_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_32_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_64_class)
		end

	is_builtin_integer_n_ref_class: BOOLEAN
			-- Is current feature a built-in feature of classes "INTEGER_N_REF" or "NATURAL_N_REF"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_8_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_16_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_32_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_64_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_8_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_16_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_32_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_64_ref_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_8_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_16_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_32_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_integer_64_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_8_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_16_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_32_ref_class or
				builtin_class_code = {ET_TOKEN_CODES}.builtin_natural_64_ref_class)
		end

	is_builtin_ise_exception_manager_class: BOOLEAN
			-- Is current feature a built-in feature of class "ISE_EXCEPTION_MANAGER"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_ise_exception_manager_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_ise_exception_manager_class)
		end

	is_builtin_ise_runtime_class: BOOLEAN
			-- Is current feature a built-in feature of class "ISE_RUNTIME"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_ise_runtime_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_ise_runtime_class)
		end

	is_builtin_memory_class: BOOLEAN
			-- Is current feature a built-in feature of class "MEMORY"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_memory_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_memory_class)
		end

	is_builtin_platform_class: BOOLEAN
			-- Is current feature a built-in feature of class "PLATFORM"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_platform_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_platform_class)
		end

	is_builtin_pointer_class: BOOLEAN
			-- Is current feature a built-in feature of class "POINTER"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_pointer_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_pointer_class)
		end

	is_builtin_pointer_ref_class: BOOLEAN
			-- Is current feature a built-in feature of class "POINTER_REF"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_pointer_ref_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_pointer_ref_class)
		end

	is_builtin_procedure_class: BOOLEAN
			-- Is current feature a built-in feature of class "PROCEDURE"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_procedure_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_procedure_class)
		end

	is_builtin_real_n_class: BOOLEAN
			-- Is current feature a built-in feature of classes "REAL_N"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_real_32_class or builtin_class_code = {ET_TOKEN_CODES}.builtin_real_64_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_real_32_class or builtin_class_code = {ET_TOKEN_CODES}.builtin_real_64_class)
		end

	is_builtin_real_n_ref_class: BOOLEAN
			-- Is current feature a built-in feature of classes "REAL_N_REF"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_real_32_ref_class or builtin_class_code = {ET_TOKEN_CODES}.builtin_real_64_ref_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_real_32_ref_class or builtin_class_code = {ET_TOKEN_CODES}.builtin_real_64_ref_class)
		end

	is_builtin_special_class: BOOLEAN
			-- Is current feature a built-in feature of class "SPECIAL"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_special_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_special_class)
		end

	is_builtin_tuple_class: BOOLEAN
			-- Is current feature a built-in feature of class "TUPLE"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_tuple_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_tuple_class)
		end

	is_builtin_type_class: BOOLEAN
			-- Is current feature a built-in feature of class "TYPE"?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_type_class
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_type_class)
		end

	is_builtin_function_item: BOOLEAN
			-- Is current feature the built-in feature 'FUNCTION.item'?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_function_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_function_item
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_function_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_function_item)
		end

	is_builtin_procedure_call: BOOLEAN
			-- Is current feature the built-in feature 'PROCEDURE.call'?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_procedure_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_procedure_call
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_procedure_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_procedure_call)
		end

	is_builtin_any_copy: BOOLEAN
			-- Is current feature the built-in feature 'ANY.copy'?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_any_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_any_copy
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_any_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_any_copy)
		end

	is_builtin_any_is_equal: BOOLEAN
			-- Is current feature the built-in feature 'ANY.is_equal'?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_any_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_any_is_equal
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_any_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_any_is_equal)
		end

	is_builtin_ise_runtime_new_tuple_instance_of: BOOLEAN
			-- Is current feature the built-in feature 'ISE_RUNTIME.new_tuple_instance_of'?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_ise_runtime_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_ise_runtime_new_tuple_instance_of
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_ise_runtime_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_ise_runtime_new_tuple_instance_of)
		end

	is_builtin_special_item: BOOLEAN
			-- Is current feature the built-in feature 'SPECIAL.item'?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_special_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_special_item
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_special_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_special_item)
		end

	is_builtin_special_put: BOOLEAN
			-- Is current feature the built-in feature 'SPECIAL.put'?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_special_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_special_put
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_special_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_special_put)
		end

	is_builtin_special_extend: BOOLEAN
			-- Is current feature the built-in feature 'SPECIAL.extend'?
		do
			Result := builtin_class_code = {ET_TOKEN_CODES}.builtin_special_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_special_extend
		ensure
			builtin: Result implies is_builtin
			definition: Result = (builtin_class_code = {ET_TOKEN_CODES}.builtin_special_class and then builtin_feature_code = {ET_TOKEN_CODES}.builtin_special_extend)
		end

	builtin_class_code: NATURAL_8
			-- Built-in class code of current feature

	builtin_feature_code: NATURAL_8
			-- Built-in feature code of current feature

feature -- Status setting

	set_built (b: BOOLEAN)
			-- Set `is_built' to `b'.
		do
			is_built := b
		ensure
			built_set: is_built = b
		end

	set_generated (b: BOOLEAN)
			-- Set `is_generated' to `b'.
		do
			is_generated := b
		ensure
			generated_set: is_generated = b
		end

	set_static_generated (b: BOOLEAN)
			-- Set `is_static_generated' to `b'.
		do
			is_static_generated := b
		ensure
			static_generated_set: is_static_generated = b
		end

	set_creation (b: BOOLEAN)
			-- Set `is_creation' to `b'.
		local
			l_regular: BOOLEAN
			i, nb: INTEGER
		do
			is_creation := b
			if attached first_precursor as l_first_precursor then
				l_regular := b or is_regular
				l_first_precursor.set_regular (l_regular)
				if attached other_precursors as l_other_precursors then
					nb := l_other_precursors.count
					from i := 1 until i > nb loop
						l_other_precursors.item (i).set_regular (l_regular)
						i := i + 1
					end
				end
			end
		ensure
			creation_set: is_creation = b
		end

	set_regular (b: BOOLEAN)
			-- Set `is_regular' to `b'.
		local
			l_regular: BOOLEAN
			i, nb: INTEGER
		do
			is_regular := b
			if attached first_precursor as l_first_precursor then
				l_regular := b or is_creation
				l_first_precursor.set_regular (l_regular)
				if attached other_precursors as l_other_precursors then
					nb := l_other_precursors.count
					from i := 1 until i > nb loop
						l_other_precursors.item (i).set_regular (l_regular)
						i := i + 1
					end
				end
			end
		ensure
			regular_set: is_regular = b
		end

	set_address (b: BOOLEAN)
			-- Set `is_address' to `b'.
		do
			is_address := b
			if b then
				set_regular (True)
			end
		ensure
			address_set: is_address = b
			regular_set: b implies is_regular
		end

feature -- Calls

	query_call (a_static_call: ET_CALL_COMPONENT): detachable ET_DYNAMIC_QUALIFIED_QUERY_CALL
			-- Qualified query call in current feature whose static call is `a_static_call', if any
		require
			a_static_call_not_void: a_static_call /= Void
		do
			Result := query_calls.value (a_static_call.name)
		ensure
			definition: Result = query_calls.value (a_static_call.name)
		end

	query_calls: DS_HASH_TABLE [ET_DYNAMIC_QUALIFIED_QUERY_CALL, ET_CALL_NAME]
			-- Qualified query calls called from current feature
			--
			-- Use the name of the call as key because for call agents (e.g. 'agent a.f')
			-- we use a temporary qualified call expression or instruction instead of the
			-- actual call agent as static call to generate the C code in ET_C_GENERATOR.
			-- (See ET_C_GENERATOR.print_call_agent_body_declaration.) This is so that
			-- `query_call' can get the right dynamic call despite the static call object
			-- being different.

	procedure_call (a_static_call: ET_CALL_COMPONENT): detachable ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			-- Qualified procedure call in current feature whose static call is `a_static_call', if any
		require
			a_static_call_not_void: a_static_call /= Void
		do
			Result := procedure_calls.value (a_static_call.name)
		ensure
			definition: Result = procedure_calls.value (a_static_call.name)
		end

	procedure_calls: DS_HASH_TABLE [ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL, ET_CALL_NAME]
			-- Qualified procedure calls called from current feature
			--
			-- Use the name of the call as key because for call agents (e.g. 'agent a.f')
			-- we use a temporary qualified call expression or instruction instead of the
			-- actual call agent as static call to generate the C code in ET_C_GENERATOR.
			-- (See ET_C_GENERATOR.print_call_agent_body_declaration.) This is so that
			-- `procedure_call' can get the right dynamic call despite the static call object
			-- being different.

feature {ET_DYNAMIC_PRIMARY_TYPE} -- Calls

	put_query_call (a_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL)
			-- Add `a_call' to the list of qualified query calls called from current feature.
		require
			a_call_not_void: a_call /= Void
			a_call_caller: a_call.current_feature = Current
		do
			query_calls.force (a_call, a_call.static_call.name)
		ensure
			added: query_calls.value (a_call.static_call.name) = a_call
		end

	put_procedure_call (a_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL)
			-- Add `a_call' to the list of qualified procedure calls called from current feature.
		require
			a_call_not_void: a_call /= Void
			a_call_caller: a_call.current_feature = Current
		do
			procedure_calls.force (a_call, a_call.static_call.name)
		ensure
			added: procedure_calls.value (a_call.static_call.name) = a_call
		end

feature -- Output

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := static_feature.debug_output
		end

feature {NONE} -- Constants

	empty_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Empty dynamic type set list
		once
			create Result.make
		ensure
			dynamic_type_sets_not_void: Result /= Void
			dynamic_type_sets_empty: Result.is_empty
		end

invariant

	static_feature_not_void: static_feature /= Void
	target_type_not_void: target_type /= Void
	dynamic_type_sets_not_void: dynamic_type_sets /= Void
	query_calls_not_void: query_calls /= Void
	no_void_query_call: not query_calls.has_void
	procedure_calls_not_void: procedure_calls /= Void
	no_void_procedure_call: not procedure_calls.has_void

end
