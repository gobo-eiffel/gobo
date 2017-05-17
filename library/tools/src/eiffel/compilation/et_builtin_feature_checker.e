note

	description:

		"Eiffel built-in feature validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class ET_BUILTIN_FEATURE_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_external_function,
			process_external_procedure
		end

	ET_SHARED_FEATURE_NAME_TESTER
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create new built-in feature checker.
		do
			create builtin_features.make_map (100)
			Precursor (a_system_processor)
		end

feature -- Validity checking

	check_feature_validity (a_feature: ET_FEATURE)
			-- Check whether `a_feature' is a known built-in feature,
			-- and if yes, check the validity of its signature.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_feature.implementation_class
			a_feature.process (Current)
			current_class := old_class
		end

feature -- Status report

	unknown_builtin_reported: BOOLEAN
			-- Should unknown built-in features be reported as an error?
		do
			Result := current_system.unknown_builtin_reported
		end

feature {NONE} -- Built-in validity

	check_external_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of `a_feature', written in `current_class',
			-- if it appears to be a built-in feature.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
			if STRING_.same_case_insensitive (a_feature.language.manifest_string.value, tokens.builtin_marker) then
				check_builtin_feature_validity (a_feature)
			elseif STRING_.same_case_insensitive (a_feature.language.manifest_string.value, tokens.builtin_static_marker) then
				check_builtin_feature_validity (a_feature)
			elseif STRING_.same_case_insensitive (a_feature.language.manifest_string.value, tokens.static_builtin_marker) then
				check_builtin_feature_validity (a_feature)
			end
		end

	check_builtin_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature', written in `current_class'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_name: ET_CLASS_NAME
		do
			l_name := current_class.name
			if l_name.same_class_name (tokens.any_class_name) then
				check_builtin_any_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.type_class_name) then
				check_builtin_type_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.special_class_name) then
				check_builtin_special_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.character_8_ref_class_name) then
				check_builtin_character_n_ref_feature_validity (a_feature, current_universe.character_8_type, tokens.builtin_character_8_ref_class)
			elseif l_name.same_class_name (tokens.character_8_class_name) then
				check_builtin_character_n_feature_validity (a_feature, tokens.builtin_character_8_class)
			elseif l_name.same_class_name (tokens.character_32_ref_class_name) then
				check_builtin_character_n_ref_feature_validity (a_feature, current_universe.character_32_type, tokens.builtin_character_32_ref_class)
			elseif l_name.same_class_name (tokens.character_32_class_name) then
				check_builtin_character_n_feature_validity (a_feature, tokens.builtin_character_32_class)
			elseif l_name.same_class_name (tokens.boolean_ref_class_name) then
				check_builtin_boolean_ref_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.boolean_class_name) then
				check_builtin_boolean_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.pointer_ref_class_name) then
				check_builtin_pointer_ref_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.pointer_class_name) then
				check_builtin_pointer_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.arguments_32_class_name) then
				check_builtin_arguments_32_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.com_failure_class_name) then
				check_builtin_com_failure_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.memory_class_name) then
				check_builtin_memory_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.exception_manager_class_name) then
				check_builtin_exception_manager_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.exception_manager_factory_class_name) then
				check_builtin_exception_manager_factory_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.ise_exception_manager_class_name) then
				check_builtin_ise_exception_manager_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.identified_routines_class_name) then
				check_builtin_identified_routines_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.ise_runtime_class_name) then
				check_builtin_ise_runtime_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.platform_class_name) then
				check_builtin_platform_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.procedure_class_name) then
				check_builtin_procedure_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.function_class_name) then
				check_builtin_function_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.tuple_class_name) then
				check_builtin_tuple_feature_validity (a_feature)
			elseif l_name.same_class_name (tokens.integer_8_ref_class_name) then
				check_builtin_integer_n_ref_feature_validity (a_feature, current_universe.integer_8_type, tokens.builtin_integer_8_ref_class)
			elseif l_name.same_class_name (tokens.integer_8_class_name) then
				check_builtin_integer_n_feature_validity (a_feature, tokens.builtin_integer_8_class)
			elseif l_name.same_class_name (tokens.integer_16_ref_class_name) then
				check_builtin_integer_n_ref_feature_validity (a_feature, current_universe.integer_16_type, tokens.builtin_integer_16_ref_class)
			elseif l_name.same_class_name (tokens.integer_16_class_name) then
				check_builtin_integer_n_feature_validity (a_feature, tokens.builtin_integer_16_class)
			elseif l_name.same_class_name (tokens.integer_32_ref_class_name) then
				check_builtin_integer_n_ref_feature_validity (a_feature, current_universe.integer_32_type, tokens.builtin_integer_32_ref_class)
			elseif l_name.same_class_name (tokens.integer_32_class_name) then
				check_builtin_integer_n_feature_validity (a_feature, tokens.builtin_integer_32_class)
			elseif l_name.same_class_name (tokens.integer_64_ref_class_name) then
				check_builtin_integer_n_ref_feature_validity (a_feature, current_universe.integer_64_type, tokens.builtin_integer_64_ref_class)
			elseif l_name.same_class_name (tokens.integer_64_class_name) then
				check_builtin_integer_n_feature_validity (a_feature, tokens.builtin_integer_64_class)
			elseif l_name.same_class_name (tokens.natural_8_ref_class_name) then
				check_builtin_integer_n_ref_feature_validity (a_feature, current_universe.natural_8_type, tokens.builtin_natural_8_ref_class)
			elseif l_name.same_class_name (tokens.natural_8_class_name) then
				check_builtin_integer_n_feature_validity (a_feature, tokens.builtin_natural_8_class)
			elseif l_name.same_class_name (tokens.natural_16_ref_class_name) then
				check_builtin_integer_n_ref_feature_validity (a_feature, current_universe.natural_16_type, tokens.builtin_natural_16_ref_class)
			elseif l_name.same_class_name (tokens.natural_16_class_name) then
				check_builtin_integer_n_feature_validity (a_feature, tokens.builtin_natural_16_class)
			elseif l_name.same_class_name (tokens.natural_32_ref_class_name) then
				check_builtin_integer_n_ref_feature_validity (a_feature, current_universe.natural_32_type, tokens.builtin_natural_32_ref_class)
			elseif l_name.same_class_name (tokens.natural_32_class_name) then
				check_builtin_integer_n_feature_validity (a_feature, tokens.builtin_natural_32_class)
			elseif l_name.same_class_name (tokens.natural_64_ref_class_name) then
				check_builtin_integer_n_ref_feature_validity (a_feature, current_universe.natural_64_type, tokens.builtin_natural_64_ref_class)
			elseif l_name.same_class_name (tokens.natural_64_class_name) then
				check_builtin_integer_n_feature_validity (a_feature, tokens.builtin_natural_64_class)
			elseif l_name.same_class_name (tokens.real_32_ref_class_name) then
				check_builtin_real_n_ref_feature_validity (a_feature, current_universe.real_32_type, tokens.builtin_real_32_ref_class)
			elseif l_name.same_class_name (tokens.real_32_class_name) then
				check_builtin_real_n_feature_validity (a_feature, tokens.builtin_real_32_class)
			elseif l_name.same_class_name (tokens.real_64_ref_class_name) then
				check_builtin_real_n_ref_feature_validity (a_feature, current_universe.real_64_type, tokens.builtin_real_64_ref_class)
			elseif l_name.same_class_name (tokens.real_64_class_name) then
				check_builtin_real_n_feature_validity (a_feature, tokens.builtin_real_64_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown, tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_any_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "ANY".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_any_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (13)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.conforms_to_feature_name, <<current_universe.any_type.type>>, current_universe.boolean_type, tokens.builtin_any_conforms_to, l_builtin_features)
				register_builtin_feature (tokens.deep_twin_feature_name, Void, tokens.like_current, tokens.builtin_any_deep_twin, l_builtin_features)
				register_builtin_feature (tokens.generating_type_feature_name, Void, current_universe.type_detachable_like_current_type, tokens.builtin_any_generating_type, l_builtin_features)
				register_builtin_feature (tokens.generator_feature_name, Void, current_universe.string_type, tokens.builtin_any_generator, l_builtin_features)
				register_builtin_feature (tokens.is_deep_equal_feature_name, <<tokens.like_current.type>>, current_universe.boolean_type, tokens.builtin_any_is_deep_equal, l_builtin_features)
				register_builtin_feature (tokens.is_equal_feature_name, <<tokens.like_current.type>>, current_universe.boolean_type, tokens.builtin_any_is_equal, l_builtin_features)
				register_builtin_feature (tokens.same_type_feature_name, <<current_universe.any_type.type>>, current_universe.boolean_type, tokens.builtin_any_same_type, l_builtin_features)
				register_builtin_feature (tokens.standard_is_equal_feature_name, <<tokens.like_current.type>>, current_universe.boolean_type, tokens.builtin_any_standard_is_equal, l_builtin_features)
				register_builtin_feature (tokens.standard_twin_feature_name, Void, tokens.like_current, tokens.builtin_any_standard_twin, l_builtin_features)
				register_builtin_feature (tokens.tagged_out_feature_name, Void, current_universe.string_type, tokens.builtin_any_tagged_out, l_builtin_features)
				register_builtin_feature (tokens.twin_feature_name, Void, tokens.like_current, tokens.builtin_any_twin, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.copy_feature_name, <<tokens.like_current.type>>, Void, tokens.builtin_any_copy, l_builtin_features)
				register_builtin_feature (tokens.standard_copy_feature_name, <<tokens.like_current.type>>, Void, tokens.builtin_any_standard_copy, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_arguments_32_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "ARGUMENTS_32".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_arguments_32_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (3)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.argument_count_feature_name, Void, current_universe.integer_type, tokens.builtin_arguments_32_argument_count, l_builtin_features)
				register_builtin_feature (tokens.i_th_argument_pointer_feature_name, <<current_universe.integer_type>>, current_universe.pointer_type, tokens.builtin_arguments_32_i_th_argument_pointer, l_builtin_features)
				register_builtin_feature (tokens.i_th_argument_string_feature_name, <<current_universe.integer_type>>, current_universe.immutable_string_32_type, tokens.builtin_arguments_32_i_th_argument_string, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_boolean_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "BOOLEAN".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_boolean_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (7)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.conjuncted_feature_name, <<current_universe.boolean_type.type>>, current_universe.boolean_type, tokens.builtin_boolean_and, l_builtin_features)
				register_builtin_feature (tokens.conjuncted_semistrict_feature_name, <<current_universe.boolean_type.type>>, current_universe.boolean_type, tokens.builtin_boolean_and_then, l_builtin_features)
				register_builtin_feature (tokens.disjuncted_feature_name, <<current_universe.boolean_type.type>>, current_universe.boolean_type, tokens.builtin_boolean_or, l_builtin_features)
				register_builtin_feature (tokens.disjuncted_exclusive_feature_name, <<current_universe.boolean_type.type>>, current_universe.boolean_type, tokens.builtin_boolean_xor, l_builtin_features)
				register_builtin_feature (tokens.disjuncted_semistrict_feature_name, <<current_universe.boolean_type.type>>, current_universe.boolean_type, tokens.builtin_boolean_or_else, l_builtin_features)
				register_builtin_feature (tokens.implication_feature_name, <<current_universe.boolean_type.type>>, current_universe.boolean_type, tokens.builtin_boolean_implies, l_builtin_features)
				register_builtin_feature (tokens.negated_feature_name, Void, current_universe.boolean_type, tokens.builtin_boolean_not, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_boolean_ref_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "BOOLEAN_REF".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_boolean_ref_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (2)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.item_feature_name, Void, current_universe.boolean_type, tokens.builtin_boolean_ref_item, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.set_item_feature_name, <<current_universe.boolean_type.type>>, Void, tokens.builtin_boolean_ref_set_item, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_character_n_feature_validity (a_feature: ET_EXTERNAL_ROUTINE; a_builtin_class_code: NATURAL_8)
			-- Check validity of built-in `a_feature' from class "CHARACTER_N".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
		do
			builtin_features.search (a_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (4)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, a_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.code_feature_name, Void, current_universe.integer_type, tokens.builtin_character_n_code, l_builtin_features)
				register_builtin_feature (tokens.natural_32_code_feature_name, Void, current_universe.natural_32_type, tokens.builtin_character_n_natural_32_code, l_builtin_features)
				register_builtin_feature (tokens.to_character_8_feature_name, Void, current_universe.character_8_type, tokens.builtin_character_n_to_character_8, l_builtin_features)
				register_builtin_feature (tokens.to_character_32_feature_name, Void, current_universe.character_32_type, tokens.builtin_character_n_to_character_32, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, a_builtin_class_code, l_builtin_features)
		end

	check_builtin_character_n_ref_feature_validity (a_feature: ET_EXTERNAL_ROUTINE; a_character_n_type: ET_CLASS_TYPE; a_builtin_class_code: NATURAL_8)
			-- Check validity of built-in `a_feature' from class "CHARACTER_N_REF".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_character_n_type_not_void: a_character_n_type /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
		do
			builtin_features.search (a_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (2)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, a_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.item_feature_name, Void, a_character_n_type, tokens.builtin_character_n_ref_item, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.set_item_feature_name, <<a_character_n_type.type>>, Void, tokens.builtin_character_n_ref_set_item, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, a_builtin_class_code, l_builtin_features)
		end

	check_builtin_com_failure_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "COM_FAILURE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_com_failure_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (7)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.c_strlen_feature_name, <<current_universe.pointer_type.type>>, current_universe.integer_32_type, tokens.builtin_com_failure_c_strlen, l_builtin_features)
				register_builtin_feature (tokens.ccom_hresult_feature_name, <<current_universe.pointer_type.type>>, current_universe.integer_type, tokens.builtin_com_failure_ccom_hresult, l_builtin_features)
				register_builtin_feature (tokens.ccom_hresult_code_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_com_failure_ccom_hresult_code, l_builtin_features)
				register_builtin_feature (tokens.ccom_hresult_facility_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_com_failure_ccom_hresult_facility, l_builtin_features)
				register_builtin_feature (tokens.character_size_feature_name, Void, current_universe.integer_32_type, tokens.builtin_com_failure_character_size, l_builtin_features)
				register_builtin_feature (tokens.cwin_error_text_feature_name, <<current_universe.integer_type.type>>, current_universe.pointer_type, tokens.builtin_com_failure_cwin_error_text, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.cwin_local_free_feature_name, <<current_universe.pointer_type.type>>, Void, tokens.builtin_com_failure_cwin_local_free, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_exception_manager_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "EXCEPTION_MANAGER".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_exception_manager_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (11)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.exception_from_code_feature_name, <<current_universe.integer_type.type>>, current_universe.detachable_exception_type, tokens.builtin_exception_manager_exception_from_code, l_builtin_features)
				register_builtin_feature (tokens.is_caught_feature_name, <<current_universe.type_detachable_exception_type.type>>, current_universe.boolean_type, tokens.builtin_exception_manager_is_caught, l_builtin_features)
				register_builtin_feature (tokens.is_ignorable_feature_name, <<current_universe.type_detachable_exception_type.type>>, current_universe.boolean_type, tokens.builtin_exception_manager_is_ignorable, l_builtin_features)
				register_builtin_feature (tokens.is_ignored_feature_name, <<current_universe.type_detachable_exception_type.type>>, current_universe.boolean_type, tokens.builtin_exception_manager_is_ignored, l_builtin_features)
				register_builtin_feature (tokens.is_raisable_feature_name, <<current_universe.type_detachable_exception_type.type>>, current_universe.boolean_type, tokens.builtin_exception_manager_is_raisable, l_builtin_features)
				register_builtin_feature (tokens.last_exception_feature_name, Void, current_universe.detachable_exception_type, tokens.builtin_exception_manager_last_exception, l_builtin_features)
				register_builtin_feature (tokens.type_of_code_feature_name, <<current_universe.integer_type.type>>, current_universe.detachable_type_exception_type, tokens.builtin_exception_manager_type_of_code, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.catch_feature_name, <<current_universe.type_detachable_exception_type.type>>, Void, tokens.builtin_exception_manager_catch, l_builtin_features)
				register_builtin_feature (tokens.ignore_feature_name, <<current_universe.type_detachable_exception_type.type>>, Void, tokens.builtin_exception_manager_ignore, l_builtin_features)
				register_builtin_feature (tokens.raise_feature_name, <<current_universe.exception_type.type>>, Void, tokens.builtin_exception_manager_raise, l_builtin_features)
				register_builtin_feature (tokens.set_is_ignored_feature_name, <<current_universe.type_detachable_exception_type.type, current_universe.boolean_type.type>>, Void, tokens.builtin_exception_manager_set_is_ignored, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_exception_manager_factory_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "EXCEPTION_MANAGER_FACTORY".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_exception_manager_factory_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (1)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.exception_manager_feature_name, Void, current_universe.exception_manager_type, tokens.builtin_exception_manager_factory_exception_manager, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_function_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "FUNCTION".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
			l_open_args: ET_FORMAL_PARAMETER_TYPE
			l_result_type: ET_FORMAL_PARAMETER_TYPE
		do
			l_builtin_class_code := tokens.builtin_function_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (2)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
				l_open_args := current_class.formal_parameter_type (1)
				l_result_type := current_class.formal_parameter_type (2)
					-- Functions.
				register_builtin_feature (tokens.fast_item_feature_name, <<current_universe.pointer_type.type, current_universe.pointer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.boolean_type.type, current_universe.integer_type.type, current_universe.integer_type.type, current_universe.pointer_type.type>>, l_result_type, tokens.builtin_function_fast_item, l_builtin_features)
				register_builtin_feature (tokens.item_feature_name, <<detachable_separate_formal_parameter_type (l_open_args).type>>, l_result_type, tokens.builtin_function_item, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_identified_routines_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "IDENTIFIED_ROUTINES".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_identified_routines_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (3)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.eif_id_object_feature_name, <<current_universe.integer_type.type>>, current_universe.detachable_any_type, tokens.builtin_identified_routines_eif_id_object, l_builtin_features)
				register_builtin_feature (tokens.eif_object_id_feature_name, <<current_universe.any_type.type>>, current_universe.integer_type, tokens.builtin_identified_routines_eif_object_id, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.eif_object_id_free_feature_name, <<current_universe.integer_type.type>>, Void, tokens.builtin_identified_routines_eif_object_id_free, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_integer_n_feature_validity (a_feature: ET_EXTERNAL_ROUTINE; a_builtin_class_code: NATURAL_8)
			-- Check validity of built-in `a_feature' from classes "INTEGER_N" and "NATURAL_N".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_integer_n_type: ET_CLASS_TYPE
		do
			builtin_features.search (a_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (30)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, a_builtin_class_code)
				l_integer_n_type := current_class
					-- Functions.
				register_builtin_feature (tokens.as_integer_8_feature_name, Void, current_universe.integer_8_type, tokens.builtin_integer_n_as_integer_8, l_builtin_features)
				register_builtin_feature (tokens.as_integer_16_feature_name, Void, current_universe.integer_16_type, tokens.builtin_integer_n_as_integer_16, l_builtin_features)
				register_builtin_feature (tokens.as_integer_32_feature_name, Void, current_universe.integer_32_type, tokens.builtin_integer_n_as_integer_32, l_builtin_features)
				register_builtin_feature (tokens.as_integer_64_feature_name, Void, current_universe.integer_64_type, tokens.builtin_integer_n_as_integer_64, l_builtin_features)
				register_builtin_feature (tokens.as_natural_8_feature_name, Void, current_universe.natural_8_type, tokens.builtin_integer_n_as_natural_8, l_builtin_features)
				register_builtin_feature (tokens.as_natural_16_feature_name, Void, current_universe.natural_16_type, tokens.builtin_integer_n_as_natural_16, l_builtin_features)
				register_builtin_feature (tokens.as_natural_32_feature_name, Void, current_universe.natural_32_type, tokens.builtin_integer_n_as_natural_32, l_builtin_features)
				register_builtin_feature (tokens.as_natural_64_feature_name, Void, current_universe.natural_64_type, tokens.builtin_integer_n_as_natural_64, l_builtin_features)
				register_builtin_feature (tokens.bit_and_feature_name, <<l_integer_n_type.type>>, l_integer_n_type, tokens.builtin_integer_n_bit_and, l_builtin_features)
				register_builtin_feature (tokens.bit_not_feature_name, Void, l_integer_n_type, tokens.builtin_integer_n_bit_not, l_builtin_features)
				register_builtin_feature (tokens.bit_or_feature_name, <<l_integer_n_type.type>>, l_integer_n_type, tokens.builtin_integer_n_bit_or, l_builtin_features)
				register_builtin_feature (tokens.bit_shift_left_feature_name, <<current_universe.integer_type.type>>, l_integer_n_type, tokens.builtin_integer_n_bit_shift_left, l_builtin_features)
				register_builtin_feature (tokens.bit_shift_right_feature_name, <<current_universe.integer_type.type>>, l_integer_n_type, tokens.builtin_integer_n_bit_shift_right, l_builtin_features)
				register_builtin_feature (tokens.bit_xor_feature_name, <<l_integer_n_type.type>>, l_integer_n_type, tokens.builtin_integer_n_bit_xor, l_builtin_features)
				register_builtin_feature (tokens.identity_feature_name, Void, l_integer_n_type, tokens.builtin_integer_n_identity, l_builtin_features)
				register_builtin_feature (tokens.integer_quotient_feature_name, <<l_integer_n_type.type>>, l_integer_n_type, tokens.builtin_integer_n_integer_quotient, l_builtin_features)
				register_builtin_feature (tokens.integer_remainder_feature_name, <<l_integer_n_type.type>>, l_integer_n_type, tokens.builtin_integer_n_integer_remainder, l_builtin_features)
				register_builtin_feature (tokens.is_less_feature_name, <<l_integer_n_type.type>>, current_universe.boolean_type, tokens.builtin_integer_n_is_less, l_builtin_features)
				register_builtin_feature (tokens.minus_feature_name, <<l_integer_n_type.type>>, l_integer_n_type, tokens.builtin_integer_n_minus, l_builtin_features)
				register_builtin_feature (tokens.opposite_feature_name, Void, l_integer_n_type, tokens.builtin_integer_n_opposite, l_builtin_features)
				register_builtin_feature (tokens.plus_feature_name, <<l_integer_n_type.type>>, l_integer_n_type, tokens.builtin_integer_n_plus, l_builtin_features)
				register_builtin_feature (tokens.power_feature_name, <<current_universe.real_64_type.type>>, current_universe.real_64_type, tokens.builtin_integer_n_power, l_builtin_features)
				register_builtin_feature (tokens.product_feature_name, <<l_integer_n_type.type>>, l_integer_n_type, tokens.builtin_integer_n_product, l_builtin_features)
				register_builtin_feature (tokens.quotient_feature_name, <<l_integer_n_type.type>>, current_universe.real_64_type, tokens.builtin_integer_n_quotient, l_builtin_features)
				register_builtin_feature (tokens.to_character_8_feature_name, Void, current_universe.character_8_type, tokens.builtin_integer_n_to_character_8, l_builtin_features)
				register_builtin_feature (tokens.to_character_32_feature_name, Void, current_universe.character_32_type, tokens.builtin_integer_n_to_character_32, l_builtin_features)
				register_builtin_feature (tokens.to_double_feature_name, Void, current_universe.real_64_type, tokens.builtin_integer_n_to_double, l_builtin_features)
				register_builtin_feature (tokens.to_real_feature_name, Void, current_universe.real_32_type, tokens.builtin_integer_n_to_real, l_builtin_features)
				register_builtin_feature (tokens.to_real_32_feature_name, Void, current_universe.real_32_type, tokens.builtin_integer_n_to_real_32, l_builtin_features)
				register_builtin_feature (tokens.to_real_64_feature_name, Void, current_universe.real_64_type, tokens.builtin_integer_n_to_real_64, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, a_builtin_class_code, l_builtin_features)
		end

	check_builtin_integer_n_ref_feature_validity (a_feature: ET_EXTERNAL_ROUTINE; a_integer_n_type: ET_CLASS_TYPE; a_builtin_class_code: NATURAL_8)
			-- Check validity of built-in `a_feature' from classes "INTEGER_N_REF" and "NATURAL_N_REF".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_integer_n_type_not_void: a_integer_n_type /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
		do
			builtin_features.search (a_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (2)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, a_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.item_feature_name, Void, a_integer_n_type, tokens.builtin_integer_n_ref_item, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.set_item_feature_name, <<a_integer_n_type.type>>, Void, tokens.builtin_integer_n_ref_set_item, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, a_builtin_class_code, l_builtin_features)
		end

	check_builtin_ise_exception_manager_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "ISE_EXCEPTION_MANAGER".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_ise_exception_manager_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (1)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Procedures.
				register_builtin_feature (tokens.developer_raise_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.pointer_type.type>>, Void, tokens.builtin_ise_exception_manager_developer_raise, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_ise_runtime_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "ISE_RUNTIME".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_ise_runtime_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (109)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.attached_type_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_attached_type, l_builtin_features)
				register_builtin_feature (tokens.boolean_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_boolean_field, l_builtin_features)
				register_builtin_feature (tokens.boolean_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_boolean_field_at, l_builtin_features)
				register_builtin_feature (tokens.character_8_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.character_8_type, tokens.builtin_ise_runtime_character_8_field, l_builtin_features)
				register_builtin_feature (tokens.character_8_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.character_8_type, tokens.builtin_ise_runtime_character_8_field_at, l_builtin_features)
				register_builtin_feature (tokens.character_32_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.character_32_type, tokens.builtin_ise_runtime_character_32_field, l_builtin_features)
				register_builtin_feature (tokens.character_32_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.character_32_type, tokens.builtin_ise_runtime_character_32_field_at, l_builtin_features)
				register_builtin_feature (tokens.check_assert_feature_name, <<current_universe.boolean_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_check_assert, l_builtin_features)
				register_builtin_feature (tokens.compiler_version_feature_name, Void, current_universe.integer_type, tokens.builtin_ise_runtime_compiler_version, l_builtin_features)
				register_builtin_feature (tokens.detachable_type_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_detachable_type, l_builtin_features)
				register_builtin_feature (tokens.dynamic_type_feature_name, <<current_universe.any_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_dynamic_type, l_builtin_features)
				register_builtin_feature (tokens.dynamic_type_at_offset_feature_name, <<current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.integer_32_type, tokens.builtin_ise_runtime_dynamic_type_at_offset, l_builtin_features)
				register_builtin_feature (tokens.eif_gen_param_id_feature_name, <<current_universe.integer_type.type, current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_eif_gen_param_id, l_builtin_features)
				register_builtin_feature (tokens.field_count_of_type_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_field_count_of_type, l_builtin_features)
				register_builtin_feature (tokens.field_name_of_type_feature_name, <<current_universe.integer_type.type, current_universe.integer_type.type>>, current_universe.pointer_type, tokens.builtin_ise_runtime_field_name_of_type, l_builtin_features)
				register_builtin_feature (tokens.field_offset_of_type_feature_name, <<current_universe.integer_type.type, current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_field_offset_of_type, l_builtin_features)
				register_builtin_feature (tokens.field_static_type_of_type_feature_name, <<current_universe.integer_type.type, current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_field_static_type_of_type, l_builtin_features)
				register_builtin_feature (tokens.field_type_of_type_feature_name, <<current_universe.integer_type.type, current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_field_type_of_type, l_builtin_features)
				register_builtin_feature (tokens.generating_type_of_type_feature_name, <<current_universe.integer_type.type>>, current_universe.string_type, tokens.builtin_ise_runtime_generating_type_of_type, l_builtin_features)
				register_builtin_feature (tokens.generator_of_type_feature_name, <<current_universe.integer_type.type>>, current_universe.string_type, tokens.builtin_ise_runtime_generator_of_type, l_builtin_features)
				register_builtin_feature (tokens.generic_parameter_count_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_generic_parameter_count, l_builtin_features)
				register_builtin_feature (tokens.in_assertion_feature_name, Void, current_universe.boolean_type, tokens.builtin_ise_runtime_in_assertion, l_builtin_features)
				register_builtin_feature (tokens.integer_8_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.integer_8_type, tokens.builtin_ise_runtime_integer_8_field, l_builtin_features)
				register_builtin_feature (tokens.integer_8_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.integer_8_type, tokens.builtin_ise_runtime_integer_8_field_at, l_builtin_features)
				register_builtin_feature (tokens.integer_16_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.integer_16_type, tokens.builtin_ise_runtime_integer_16_field, l_builtin_features)
				register_builtin_feature (tokens.integer_16_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.integer_16_type, tokens.builtin_ise_runtime_integer_16_field_at, l_builtin_features)
				register_builtin_feature (tokens.integer_32_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.integer_32_type, tokens.builtin_ise_runtime_integer_32_field, l_builtin_features)
				register_builtin_feature (tokens.integer_32_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.integer_32_type, tokens.builtin_ise_runtime_integer_32_field_at, l_builtin_features)
				register_builtin_feature (tokens.integer_64_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.integer_64_type, tokens.builtin_ise_runtime_integer_64_field, l_builtin_features)
				register_builtin_feature (tokens.integer_64_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.integer_64_type, tokens.builtin_ise_runtime_integer_64_field_at, l_builtin_features)
				register_builtin_feature (tokens.is_attached_type_feature_name, <<current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_attached_type, l_builtin_features)
				register_builtin_feature (tokens.is_copy_semantics_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_copy_semantics_field, l_builtin_features)
				register_builtin_feature (tokens.is_expanded_feature_name, <<current_universe.pointer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_expanded, l_builtin_features)
				register_builtin_feature (tokens.is_field_expanded_of_type_feature_name, <<current_universe.integer_type.type, current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_field_expanded_of_type, l_builtin_features)
				register_builtin_feature (tokens.is_field_transient_of_type_feature_name, <<current_universe.integer_type.type, current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_field_transient_of_type, l_builtin_features)
				register_builtin_feature (tokens.is_object_marked_feature_name, <<current_universe.pointer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_object_marked, l_builtin_features)
				register_builtin_feature (tokens.is_special_feature_name, <<current_universe.pointer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_special, l_builtin_features)
				register_builtin_feature (tokens.is_special_copy_semantics_item_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_special_copy_semantics_item, l_builtin_features)
				register_builtin_feature (tokens.is_special_of_expanded_feature_name, <<current_universe.pointer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_special_of_expanded, l_builtin_features)
				register_builtin_feature (tokens.is_special_of_reference_feature_name, <<current_universe.pointer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_special_of_reference, l_builtin_features)
				register_builtin_feature (tokens.is_special_of_reference_or_basic_type_feature_name, <<current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_special_of_reference_or_basic_type, l_builtin_features)
				register_builtin_feature (tokens.is_special_of_reference_type_feature_name, <<current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_special_of_reference_type, l_builtin_features)
				register_builtin_feature (tokens.is_tuple_feature_name, <<current_universe.pointer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_tuple, l_builtin_features)
				register_builtin_feature (tokens.is_tuple_type_feature_name, <<current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_is_tuple_type, l_builtin_features)
				register_builtin_feature (tokens.natural_8_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.natural_8_type, tokens.builtin_ise_runtime_natural_8_field, l_builtin_features)
				register_builtin_feature (tokens.natural_8_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.natural_8_type, tokens.builtin_ise_runtime_natural_8_field_at, l_builtin_features)
				register_builtin_feature (tokens.natural_16_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.natural_16_type, tokens.builtin_ise_runtime_natural_16_field, l_builtin_features)
				register_builtin_feature (tokens.natural_16_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.natural_16_type, tokens.builtin_ise_runtime_natural_16_field_at, l_builtin_features)
				register_builtin_feature (tokens.natural_32_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.natural_32_type, tokens.builtin_ise_runtime_natural_32_field, l_builtin_features)
				register_builtin_feature (tokens.natural_32_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.natural_32_type, tokens.builtin_ise_runtime_natural_32_field_at, l_builtin_features)
				register_builtin_feature (tokens.natural_64_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.natural_64_type, tokens.builtin_ise_runtime_natural_64_field, l_builtin_features)
				register_builtin_feature (tokens.natural_64_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.natural_64_type, tokens.builtin_ise_runtime_natural_64_field_at, l_builtin_features)
				register_builtin_feature (tokens.new_instance_of_feature_name, <<current_universe.integer_type.type>>, current_universe.any_type, tokens.builtin_ise_runtime_new_instance_of, l_builtin_features)
				register_builtin_feature (tokens.new_special_of_reference_instance_of_feature_name, <<current_universe.integer_type.type>>, current_universe.special_detachable_any_type, tokens.builtin_ise_runtime_new_special_of_reference_instance_of, l_builtin_features)
				register_builtin_feature (tokens.new_tuple_instance_of_feature_name, <<current_universe.integer_type.type>>, current_universe.tuple_type, tokens.builtin_ise_runtime_new_tuple_instance_of, l_builtin_features)
				register_builtin_feature (tokens.new_type_instance_of_feature_name, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type, tokens.builtin_ise_runtime_new_type_instance_of, l_builtin_features)
				register_builtin_feature (tokens.object_size_feature_name, <<current_universe.pointer_type.type>>, current_universe.natural_64_type, tokens.builtin_ise_runtime_object_size, l_builtin_features)
				register_builtin_feature (tokens.once_objects_feature_name, <<current_universe.integer_type.type>>, current_universe.special_any_type, tokens.builtin_ise_runtime_once_objects, l_builtin_features)
				register_builtin_feature (tokens.persistent_field_count_of_type_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_persistent_field_count_of_type, l_builtin_features)
				register_builtin_feature (tokens.pointer_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.pointer_type, tokens.builtin_ise_runtime_pointer_field, l_builtin_features)
				register_builtin_feature (tokens.pointer_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.pointer_type, tokens.builtin_ise_runtime_pointer_field_at, l_builtin_features)
				register_builtin_feature (tokens.pre_ecma_mapping_status_feature_name, Void, current_universe.boolean_type, tokens.builtin_ise_runtime_pre_ecma_mapping_status, l_builtin_features)
				register_builtin_feature (tokens.raw_reference_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.pointer_type, tokens.builtin_ise_runtime_raw_reference_field_at, l_builtin_features)
				register_builtin_feature (tokens.raw_reference_field_at_offset_feature_name, <<current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.pointer_type, tokens.builtin_ise_runtime_raw_reference_field_at_offset, l_builtin_features)
				register_builtin_feature (tokens.real_32_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.real_32_type, tokens.builtin_ise_runtime_real_32_field, l_builtin_features)
				register_builtin_feature (tokens.real_32_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.real_32_type, tokens.builtin_ise_runtime_real_32_field_at, l_builtin_features)
				register_builtin_feature (tokens.real_64_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.real_64_type, tokens.builtin_ise_runtime_real_64_field, l_builtin_features)
				register_builtin_feature (tokens.real_64_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.real_64_type, tokens.builtin_ise_runtime_real_64_field_at, l_builtin_features)
				register_builtin_feature (tokens.reference_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.detachable_any_type, tokens.builtin_ise_runtime_reference_field, l_builtin_features)
				register_builtin_feature (tokens.reference_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.detachable_any_type, tokens.builtin_ise_runtime_reference_field_at, l_builtin_features)
				register_builtin_feature (tokens.reference_field_at_offset_feature_name, <<current_universe.pointer_type.type, current_universe.integer_type.type>>, current_universe.any_type, tokens.builtin_ise_runtime_reference_field_at_offset, l_builtin_features)
				register_builtin_feature (tokens.storable_version_of_type_feature_name, <<current_universe.integer_type.type>>, current_universe.detachable_string_type, tokens.builtin_ise_runtime_storable_version_of_type, l_builtin_features)
				register_builtin_feature (tokens.type_conforms_to_feature_name, <<current_universe.integer_type.type, current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_ise_runtime_type_conforms_to, l_builtin_features)
				register_builtin_feature (tokens.type_id_from_name_feature_name, <<current_universe.pointer_type.type>>, current_universe.integer_type, tokens.builtin_ise_runtime_type_id_from_name, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.lock_marking_feature_name, Void, Void, tokens.builtin_ise_runtime_lock_marking, l_builtin_features)
				register_builtin_feature (tokens.mark_object_feature_name, <<current_universe.pointer_type.type>>, Void, tokens.builtin_ise_runtime_mark_object, l_builtin_features)
				register_builtin_feature (tokens.set_boolean_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.boolean_type.type>>, Void, tokens.builtin_ise_runtime_set_boolean_field, l_builtin_features)
				register_builtin_feature (tokens.set_boolean_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.boolean_type.type>>, Void, tokens.builtin_ise_runtime_set_boolean_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_character_8_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.character_8_type.type>>, Void, tokens.builtin_ise_runtime_set_character_8_field, l_builtin_features)
				register_builtin_feature (tokens.set_character_8_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.character_8_type.type>>, Void, tokens.builtin_ise_runtime_set_character_8_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_character_32_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.character_32_type.type>>, Void, tokens.builtin_ise_runtime_set_character_32_field, l_builtin_features)
				register_builtin_feature (tokens.set_character_32_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.character_32_type.type>>, Void, tokens.builtin_ise_runtime_set_character_32_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_integer_8_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.integer_8_type.type>>, Void, tokens.builtin_ise_runtime_set_integer_8_field, l_builtin_features)
				register_builtin_feature (tokens.set_integer_8_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.integer_8_type.type>>, Void, tokens.builtin_ise_runtime_set_integer_8_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_integer_16_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.integer_16_type.type>>, Void, tokens.builtin_ise_runtime_set_integer_16_field, l_builtin_features)
				register_builtin_feature (tokens.set_integer_16_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.integer_16_type.type>>, Void, tokens.builtin_ise_runtime_set_integer_16_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_integer_32_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.integer_32_type.type>>, Void, tokens.builtin_ise_runtime_set_integer_32_field, l_builtin_features)
				register_builtin_feature (tokens.set_integer_32_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.integer_32_type.type>>, Void, tokens.builtin_ise_runtime_set_integer_32_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_integer_64_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.integer_64_type.type>>, Void, tokens.builtin_ise_runtime_set_integer_64_field, l_builtin_features)
				register_builtin_feature (tokens.set_integer_64_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.integer_64_type.type>>, Void, tokens.builtin_ise_runtime_set_integer_64_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_natural_8_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.natural_8_type.type>>, Void, tokens.builtin_ise_runtime_set_natural_8_field, l_builtin_features)
				register_builtin_feature (tokens.set_natural_8_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.natural_8_type.type>>, Void, tokens.builtin_ise_runtime_set_natural_8_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_natural_16_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.natural_16_type.type>>, Void, tokens.builtin_ise_runtime_set_natural_16_field, l_builtin_features)
				register_builtin_feature (tokens.set_natural_16_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.natural_16_type.type>>, Void, tokens.builtin_ise_runtime_set_natural_16_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_natural_32_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.natural_32_type.type>>, Void, tokens.builtin_ise_runtime_set_natural_32_field, l_builtin_features)
				register_builtin_feature (tokens.set_natural_32_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.natural_32_type.type>>, Void, tokens.builtin_ise_runtime_set_natural_32_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_natural_64_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.natural_64_type.type>>, Void, tokens.builtin_ise_runtime_set_natural_64_field, l_builtin_features)
				register_builtin_feature (tokens.set_natural_64_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.natural_64_type.type>>, Void, tokens.builtin_ise_runtime_set_natural_64_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_pointer_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.pointer_type.type>>, Void, tokens.builtin_ise_runtime_set_pointer_field, l_builtin_features)
				register_builtin_feature (tokens.set_pointer_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.pointer_type.type>>, Void, tokens.builtin_ise_runtime_set_pointer_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_pre_ecma_mapping_feature_name, <<current_universe.boolean_type>>, Void, tokens.builtin_ise_runtime_set_pre_ecma_mapping, l_builtin_features)
				register_builtin_feature (tokens.set_real_32_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.real_32_type.type>>, Void, tokens.builtin_ise_runtime_set_real_32_field, l_builtin_features)
				register_builtin_feature (tokens.set_real_32_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.real_32_type.type>>, Void, tokens.builtin_ise_runtime_set_real_32_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_real_64_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.real_64_type.type>>, Void, tokens.builtin_ise_runtime_set_real_64_field, l_builtin_features)
				register_builtin_feature (tokens.set_real_64_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.real_64_type.type>>, Void, tokens.builtin_ise_runtime_set_real_64_field_at, l_builtin_features)
				register_builtin_feature (tokens.set_reference_field_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.detachable_any_type.type>>, Void, tokens.builtin_ise_runtime_set_reference_field, l_builtin_features)
				register_builtin_feature (tokens.set_reference_field_at_feature_name, <<current_universe.integer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.detachable_any_type.type>>, Void, tokens.builtin_ise_runtime_set_reference_field_at, l_builtin_features)
				register_builtin_feature (tokens.unlock_marking_feature_name, Void, Void, tokens.builtin_ise_runtime_unlock_marking, l_builtin_features)
				register_builtin_feature (tokens.unmark_object_feature_name, <<current_universe.pointer_type.type>>, Void, tokens.builtin_ise_runtime_unmark_object, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_memory_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "MEMORY".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_memory_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (2)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.find_referers_feature_name, <<current_universe.any_type.type, current_universe.integer_type.type>>, current_universe.special_any_type, tokens.builtin_memory_find_referers, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.free_feature_name, <<current_universe.any_type.type>>, Void, tokens.builtin_memory_free, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_platform_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "PLATFORM".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_platform_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (16)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.boolean_bytes_feature_name, Void, current_universe.integer_type, tokens.builtin_platform_boolean_bytes, l_builtin_features)
				register_builtin_feature (tokens.character_bytes_feature_name, Void, current_universe.integer_type, tokens.builtin_platform_character_bytes, l_builtin_features)
				register_builtin_feature (tokens.double_bytes_feature_name, Void, current_universe.integer_type, tokens.builtin_platform_double_bytes, l_builtin_features)
				register_builtin_feature (tokens.integer_bytes_feature_name, Void, current_universe.integer_type, tokens.builtin_platform_integer_bytes, l_builtin_features)
				register_builtin_feature (tokens.is_64_bits_feature_name, Void, current_universe.boolean_type, tokens.builtin_platform_is_64_bits, l_builtin_features)
				register_builtin_feature (tokens.is_dotnet_feature_name, Void, current_universe.boolean_type, tokens.builtin_platform_is_dotnet, l_builtin_features)
				register_builtin_feature (tokens.is_mac_feature_name, Void, current_universe.boolean_type, tokens.builtin_platform_is_mac, l_builtin_features)
				register_builtin_feature (tokens.is_scoop_capable_feature_name, Void, current_universe.boolean_type, tokens.builtin_platform_is_scoop_capable, l_builtin_features)
				register_builtin_feature (tokens.is_thread_capable_feature_name, Void, current_universe.boolean_type, tokens.builtin_platform_is_thread_capable, l_builtin_features)
				register_builtin_feature (tokens.is_unix_feature_name, Void, current_universe.boolean_type, tokens.builtin_platform_is_unix, l_builtin_features)
				register_builtin_feature (tokens.is_vms_feature_name, Void, current_universe.boolean_type, tokens.builtin_platform_is_vms, l_builtin_features)
				register_builtin_feature (tokens.is_vxworks_feature_name, Void, current_universe.boolean_type, tokens.builtin_platform_is_vxworks, l_builtin_features)
				register_builtin_feature (tokens.is_windows_feature_name, Void, current_universe.boolean_type, tokens.builtin_platform_is_windows, l_builtin_features)
				register_builtin_feature (tokens.pointer_bytes_feature_name, Void, current_universe.integer_type, tokens.builtin_platform_pointer_bytes, l_builtin_features)
				register_builtin_feature (tokens.real_bytes_feature_name, Void, current_universe.integer_type, tokens.builtin_platform_real_bytes, l_builtin_features)
				register_builtin_feature (tokens.wide_character_bytes_feature_name, Void, current_universe.integer_type, tokens.builtin_platform_wide_character_bytes, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_pointer_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "POINTER".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_pointer_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (5)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.hash_code_feature_name, Void, current_universe.integer_type, tokens.builtin_pointer_hash_code, l_builtin_features)
				register_builtin_feature (tokens.is_default_pointer_feature_name, Void, current_universe.boolean_type, tokens.builtin_pointer_is_default_pointer, l_builtin_features)
				register_builtin_feature (tokens.out_feature_name, Void, current_universe.string_type, tokens.builtin_pointer_out, l_builtin_features)
				register_builtin_feature (tokens.plus_feature_name, <<current_universe.integer_type.type>>, current_universe.pointer_type, tokens.builtin_pointer_plus, l_builtin_features)
				register_builtin_feature (tokens.to_integer_32_feature_name, Void, current_universe.integer_32_type, tokens.builtin_pointer_to_integer_32, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_pointer_ref_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "POINTER_REF".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_pointer_ref_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (2)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.item_feature_name, Void, current_universe.pointer_type, tokens.builtin_pointer_ref_item, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.set_item_feature_name, <<current_universe.pointer_type.type>>, Void, tokens.builtin_pointer_ref_set_item, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_procedure_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "PROCEDURE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
			l_open_args: ET_FORMAL_PARAMETER_TYPE
		do
			l_builtin_class_code := tokens.builtin_procedure_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (2)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
				l_open_args := current_class.formal_parameter_type (1)
					-- Procedures.
				register_builtin_feature (tokens.call_feature_name, <<detachable_separate_formal_parameter_type (l_open_args).type>>, Void, tokens.builtin_procedure_call, l_builtin_features)
				register_builtin_feature (tokens.fast_call_feature_name, <<current_universe.pointer_type.type, current_universe.pointer_type.type, current_universe.pointer_type.type, current_universe.integer_type.type, current_universe.boolean_type.type, current_universe.integer_type.type, current_universe.integer_type.type, current_universe.pointer_type.type>>, Void, tokens.builtin_procedure_fast_call, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_real_n_feature_validity (a_feature: ET_EXTERNAL_ROUTINE; a_builtin_class_code: NATURAL_8)
			-- Check validity of built-in `a_feature' from classes "REAL_N".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_real_n_type: ET_CLASS_TYPE
		do
			builtin_features.search (a_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (20)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, a_builtin_class_code)
				l_real_n_type := current_class
					-- Functions.
				register_builtin_feature (tokens.ceiling_real_32_feature_name, Void, current_universe.real_32_type, tokens.builtin_real_n_ceiling_real_32, l_builtin_features)
				register_builtin_feature (tokens.ceiling_real_64_feature_name, Void, current_universe.real_64_type, tokens.builtin_real_n_ceiling_real_64, l_builtin_features)
				register_builtin_feature (tokens.floor_real_32_feature_name, Void, current_universe.real_32_type, tokens.builtin_real_n_floor_real_32, l_builtin_features)
				register_builtin_feature (tokens.floor_real_64_feature_name, Void, current_universe.real_64_type, tokens.builtin_real_n_floor_real_64, l_builtin_features)
				register_builtin_feature (tokens.identity_feature_name, Void, l_real_n_type, tokens.builtin_real_n_identity, l_builtin_features)
				register_builtin_feature (tokens.is_less_feature_name, <<l_real_n_type.type>>, current_universe.boolean_type, tokens.builtin_real_n_is_less, l_builtin_features)
				register_builtin_feature (tokens.is_nan_feature_name, Void, current_universe.boolean_type, tokens.builtin_real_n_is_nan, l_builtin_features)
				register_builtin_feature (tokens.is_negative_infinity_feature_name, Void, current_universe.boolean_type, tokens.builtin_real_n_is_negative_infinity, l_builtin_features)
				register_builtin_feature (tokens.is_positive_infinity_feature_name, Void, current_universe.boolean_type, tokens.builtin_real_n_is_positive_infinity, l_builtin_features)
				register_builtin_feature (tokens.minus_feature_name, <<l_real_n_type.type>>, l_real_n_type, tokens.builtin_real_n_minus, l_builtin_features)
				register_builtin_feature (tokens.opposite_feature_name, Void, l_real_n_type, tokens.builtin_real_n_opposite, l_builtin_features)
				register_builtin_feature (tokens.out_feature_name, Void, current_universe.string_type, tokens.builtin_real_n_out, l_builtin_features)
				register_builtin_feature (tokens.plus_feature_name, <<l_real_n_type.type>>, l_real_n_type, tokens.builtin_real_n_plus, l_builtin_features)
				register_builtin_feature (tokens.power_feature_name, <<current_universe.real_64_type.type>>, current_universe.real_64_type, tokens.builtin_real_n_power, l_builtin_features)
				register_builtin_feature (tokens.product_feature_name, <<l_real_n_type.type>>, l_real_n_type, tokens.builtin_real_n_product, l_builtin_features)
				register_builtin_feature (tokens.quotient_feature_name, <<l_real_n_type.type>>, l_real_n_type, tokens.builtin_real_n_quotient, l_builtin_features)
				register_builtin_feature (tokens.to_double_feature_name, Void, current_universe.real_64_type, tokens.builtin_real_n_to_double, l_builtin_features)
				register_builtin_feature (tokens.truncated_to_integer_feature_name, Void, current_universe.integer_32_type, tokens.builtin_real_n_truncated_to_integer, l_builtin_features)
				register_builtin_feature (tokens.truncated_to_integer_64_feature_name, Void, current_universe.integer_64_type, tokens.builtin_real_n_truncated_to_integer_64, l_builtin_features)
				register_builtin_feature (tokens.truncated_to_real_feature_name, Void, current_universe.real_32_type, tokens.builtin_real_n_truncated_to_real, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, a_builtin_class_code, l_builtin_features)
		end

	check_builtin_real_n_ref_feature_validity (a_feature: ET_EXTERNAL_ROUTINE; a_real_n_type: ET_CLASS_TYPE; a_builtin_class_code: NATURAL_8)
			-- Check validity of built-in `a_feature' from classes "REAL_N_REF".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_real_n_type_not_void: a_real_n_type /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
		do
			builtin_features.search (a_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (5)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, a_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.item_feature_name, Void, a_real_n_type, tokens.builtin_real_n_ref_item, l_builtin_features)
				register_builtin_feature (tokens.nan_feature_name, Void, a_real_n_type, tokens.builtin_real_n_ref_nan, l_builtin_features)
				register_builtin_feature (tokens.negative_infinity_feature_name, Void, a_real_n_type, tokens.builtin_real_n_ref_negative_infinity, l_builtin_features)
				register_builtin_feature (tokens.positive_infinity_feature_name, Void, a_real_n_type, tokens.builtin_real_n_ref_positive_infinity, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.set_item_feature_name, <<a_real_n_type.type>>, Void, tokens.builtin_real_n_ref_set_item, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, a_builtin_class_code, l_builtin_features)
		end

	check_builtin_special_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "SPECIAL".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
			l_formal_parameter: ET_FORMAL_PARAMETER_TYPE
		do
			l_builtin_class_code := tokens.builtin_special_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (10)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
				l_formal_parameter := current_class.formal_parameter_type (1)
					-- Functions.
				register_builtin_feature (tokens.aliased_resized_area_feature_name, <<current_universe.integer_type.type>>, tokens.like_current, tokens.builtin_special_aliased_resized_area, l_builtin_features)
				register_builtin_feature (tokens.base_address_feature_name, Void, current_universe.pointer_type, tokens.builtin_special_base_address, l_builtin_features)
				register_builtin_feature (tokens.capacity_feature_name, Void, current_universe.integer_type, tokens.builtin_special_capacity, l_builtin_features)
				register_builtin_feature (tokens.count_feature_name, Void, current_universe.integer_type, tokens.builtin_special_count, l_builtin_features)
				register_builtin_feature (tokens.element_size_feature_name, Void, current_universe.integer_type, tokens.builtin_special_element_size, l_builtin_features)
				register_builtin_feature (tokens.item_feature_name, <<current_universe.integer_type.type>>, l_formal_parameter, tokens.builtin_special_item, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.extend_feature_name, <<l_formal_parameter.type>>, Void, tokens.builtin_special_extend, l_builtin_features)
				register_builtin_feature (tokens.make_empty_feature_name, <<current_universe.integer_type.type>>, Void, tokens.builtin_special_make_empty, l_builtin_features)
				register_builtin_feature (tokens.put_feature_name, <<l_formal_parameter.type, current_universe.integer_type.type>>, Void, tokens.builtin_special_put, l_builtin_features)
				register_builtin_feature (tokens.set_count_feature_name, <<current_universe.integer_type.type>>, Void, tokens.builtin_special_set_count, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_tuple_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "TUPLE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
		do
			l_builtin_class_code := tokens.builtin_tuple_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (34)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
					-- Functions.
				register_builtin_feature (tokens.boolean_item_feature_name, <<current_universe.integer_type.type>>, current_universe.boolean_type, tokens.builtin_tuple_boolean_item, l_builtin_features)
				register_builtin_feature (tokens.character_8_item_feature_name, <<current_universe.integer_type.type>>, current_universe.character_8_type, tokens.builtin_tuple_character_8_item, l_builtin_features)
				register_builtin_feature (tokens.character_32_item_feature_name, <<current_universe.integer_type.type>>, current_universe.character_32_type, tokens.builtin_tuple_character_32_item, l_builtin_features)
				register_builtin_feature (tokens.count_feature_name, Void, current_universe.integer_type, tokens.builtin_tuple_count, l_builtin_features)
				register_builtin_feature (tokens.integer_8_item_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_8_type, tokens.builtin_tuple_integer_8_item, l_builtin_features)
				register_builtin_feature (tokens.integer_16_item_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_16_type, tokens.builtin_tuple_integer_16_item, l_builtin_features)
				register_builtin_feature (tokens.integer_32_item_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_32_type, tokens.builtin_tuple_integer_32_item, l_builtin_features)
				register_builtin_feature (tokens.integer_64_item_feature_name, <<current_universe.integer_type.type>>, current_universe.integer_64_type, tokens.builtin_tuple_integer_64_item, l_builtin_features)
				register_builtin_feature (tokens.item_code_feature_name, <<current_universe.integer_type.type>>, current_universe.natural_8_type, tokens.builtin_tuple_item_code, l_builtin_features)
				register_builtin_feature (tokens.natural_8_item_feature_name, <<current_universe.integer_type.type>>, current_universe.natural_8_type, tokens.builtin_tuple_natural_8_item, l_builtin_features)
				register_builtin_feature (tokens.natural_16_item_feature_name, <<current_universe.integer_type.type>>, current_universe.natural_16_type, tokens.builtin_tuple_natural_16_item, l_builtin_features)
				register_builtin_feature (tokens.natural_32_item_feature_name, <<current_universe.integer_type.type>>, current_universe.natural_32_type, tokens.builtin_tuple_natural_32_item, l_builtin_features)
				register_builtin_feature (tokens.natural_64_item_feature_name, <<current_universe.integer_type.type>>, current_universe.natural_64_type, tokens.builtin_tuple_natural_64_item, l_builtin_features)
				register_builtin_feature (tokens.object_comparison_feature_name, Void, current_universe.boolean_type, tokens.builtin_tuple_object_comparison, l_builtin_features)
				register_builtin_feature (tokens.pointer_item_feature_name, <<current_universe.integer_type.type>>, current_universe.pointer_type, tokens.builtin_tuple_pointer_item, l_builtin_features)
				register_builtin_feature (tokens.real_32_item_feature_name, <<current_universe.integer_type.type>>, current_universe.real_32_type, tokens.builtin_tuple_real_32_item, l_builtin_features)
				register_builtin_feature (tokens.real_64_item_feature_name, <<current_universe.integer_type.type>>, current_universe.real_64_type, tokens.builtin_tuple_real_64_item, l_builtin_features)
				register_builtin_feature (tokens.reference_item_feature_name, <<current_universe.integer_type.type>>, current_universe.detachable_separate_any_type, tokens.builtin_tuple_reference_item, l_builtin_features)
					-- Procedures.
				register_builtin_feature (tokens.put_boolean_feature_name, <<current_universe.boolean_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_boolean, l_builtin_features)
				register_builtin_feature (tokens.put_character_8_feature_name, <<current_universe.character_8_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_character_8, l_builtin_features)
				register_builtin_feature (tokens.put_character_32_feature_name, <<current_universe.character_32_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_character_32, l_builtin_features)
				register_builtin_feature (tokens.put_integer_8_feature_name, <<current_universe.integer_8_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_integer_8, l_builtin_features)
				register_builtin_feature (tokens.put_integer_16_feature_name, <<current_universe.integer_16_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_integer_16, l_builtin_features)
				register_builtin_feature (tokens.put_integer_32_feature_name, <<current_universe.integer_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_integer_32, l_builtin_features)
				register_builtin_feature (tokens.put_integer_64_feature_name, <<current_universe.integer_64_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_integer_64, l_builtin_features)
				register_builtin_feature (tokens.put_natural_8_feature_name, <<current_universe.natural_8_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_natural_8, l_builtin_features)
				register_builtin_feature (tokens.put_natural_16_feature_name, <<current_universe.natural_16_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_natural_16, l_builtin_features)
				register_builtin_feature (tokens.put_natural_32_feature_name, <<current_universe.natural_32_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_natural_32, l_builtin_features)
				register_builtin_feature (tokens.put_natural_64_feature_name, <<current_universe.natural_64_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_natural_64, l_builtin_features)
				register_builtin_feature (tokens.put_pointer_feature_name, <<current_universe.pointer_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_pointer, l_builtin_features)
				register_builtin_feature (tokens.put_real_32_feature_name, <<current_universe.real_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_real_32, l_builtin_features)
				register_builtin_feature (tokens.put_real_64_feature_name, <<current_universe.double_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_real_64, l_builtin_features)
				register_builtin_feature (tokens.put_reference_feature_name, <<current_universe.detachable_separate_any_type.type, current_universe.integer_type.type>>, Void, tokens.builtin_tuple_put_reference, l_builtin_features)
				register_builtin_feature (tokens.set_object_comparison_feature_name, <<current_universe.boolean_type.type>>, Void, tokens.builtin_tuple_set_object_comparison, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_builtin_type_feature_validity (a_feature: ET_EXTERNAL_ROUTINE)
			-- Check validity of built-in `a_feature' from class "TYPE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME]
			l_builtin_class_code: NATURAL_8
			l_formal_parameter: ET_FORMAL_PARAMETER_TYPE
		do
			l_builtin_class_code := tokens.builtin_type_class
			builtin_features.search (l_builtin_class_code)
			if builtin_features.found then
				l_builtin_features := builtin_features.found_item
			else
				create l_builtin_features.make_map (9)
				l_builtin_features.set_key_equality_tester (feature_name_tester)
				builtin_features.force_last (l_builtin_features, l_builtin_class_code)
				l_formal_parameter := current_class.formal_parameter_type (1)
					-- Functions.
				register_builtin_feature (tokens.default_feature_name, Void, l_formal_parameter, tokens.builtin_type_default, l_builtin_features)
				register_builtin_feature (tokens.generic_parameter_type_feature_name, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type, tokens.builtin_type_generic_parameter_type, l_builtin_features)
				register_builtin_feature (tokens.generic_parameter_count_feature_name, Void, current_universe.integer_type, tokens.builtin_type_generic_parameter_count, l_builtin_features)
				register_builtin_feature (tokens.has_default_feature_name, Void, current_universe.boolean_type, tokens.builtin_type_has_default, l_builtin_features)
				register_builtin_feature (tokens.is_attached_feature_name, Void, current_universe.boolean_type, tokens.builtin_type_is_attached, l_builtin_features)
				register_builtin_feature (tokens.is_deferred_feature_name, Void, current_universe.boolean_type, tokens.builtin_type_is_deferred, l_builtin_features)
				register_builtin_feature (tokens.is_expanded_feature_name, Void, current_universe.boolean_type, tokens.builtin_type_is_expanded, l_builtin_features)
				register_builtin_feature (tokens.runtime_name_feature_name, Void, current_universe.string_type, tokens.builtin_type_runtime_name, l_builtin_features)
				register_builtin_feature (tokens.type_id_feature_name, Void, current_universe.integer_type, tokens.builtin_type_type_id, l_builtin_features)
			end
			check_expected_builtin_feature_validity (a_feature, l_builtin_class_code, l_builtin_features)
		end

	check_expected_builtin_feature_validity (a_feature: ET_EXTERNAL_ROUTINE; a_builtin_class_code: NATURAL_8; a_expected_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME])
			-- Check validity of built-in `a_feature' from class "ISE_RUNTIME".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_expected_features_not_void: a_expected_features /= Void
		local
			l_expected_feature: TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8]
		do
			a_expected_features.search (a_feature.name)
			if a_expected_features.found then
				l_expected_feature := a_expected_features.found_item
				a_feature.set_builtin_code (a_builtin_class_code, l_expected_feature.builtin_feature_code)
				check_signature_validity (a_feature, l_expected_feature.arguments, l_expected_feature.type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown, tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_signature_validity (a_feature: ET_EXTERNAL_ROUTINE; a_expected_arguments: detachable ARRAY [ET_TYPE]; a_expected_type: detachable ET_TYPE)
			-- Check validity of arguments of built-in `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			no_void_argument: a_expected_arguments /= Void implies not ANY_ARRAY_.has (a_expected_arguments, Void)
		local
			l_formals: detachable ET_FORMAL_ARGUMENT_LIST
			l_type: detachable ET_TYPE
			i, nb: INTEGER
			l_has_error: BOOLEAN
		do
			l_formals := a_feature.arguments
			if a_expected_arguments = Void or else a_expected_arguments.count = 0 then
				l_has_error := l_formals /= Void and then l_formals.count /= 0
			else
				nb := a_expected_arguments.count
				if l_formals = Void or else l_formals.count /= nb then
					l_has_error := True
				else
					from i := 1 until i > nb loop
						if not l_formals.formal_argument (i).type.same_syntactical_type (a_expected_arguments.item (i), current_class, current_class) then
							l_has_error := True
								-- Jump out of the loop.
							i := nb + 1
						end
						i := i + 1
					end
				end
			end
			l_type := a_feature.type
			if a_expected_type = Void then
				l_has_error := l_type /= Void
			else
				l_has_error := l_type = Void or else not l_type.same_syntactical_type (a_expected_type, current_class, current_class)
			end
			if l_has_error then
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, a_expected_arguments, a_expected_type)
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		do
			check_external_feature_validity (a_feature)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		do
			check_external_feature_validity (a_feature)
		end

feature {NONE} -- Implementation

	builtin_features: DS_HASH_TABLE [DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME], NATURAL_8]
			-- List of known built-in features, indexed by built-in class codes, and by feature names

	register_builtin_feature (a_feature_name: ET_FEATURE_NAME; a_arguments: detachable ARRAY [ET_TYPE]; a_type: detachable ET_TYPE; a_builtin_feature_code: NATURAL_8; a_builtin_features: DS_HASH_TABLE [TUPLE [arguments: detachable ARRAY [ET_TYPE]; type: detachable ET_TYPE; builtin_feature_code: NATURAL_8], ET_FEATURE_NAME])
			-- Register built-in feature `a_feature_name' to `a_builtin_features'.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_builtin_features_not_void: a_builtin_features /= Void
		do
			a_builtin_features.force_last ([a_arguments, a_type, a_builtin_feature_code], a_feature_name)
		end

	detachable_separate_formal_parameter_type (a_formal_parameter: ET_FORMAL_PARAMETER_TYPE): ET_FORMAL_PARAMETER_TYPE
			-- Detachable separate version of formal generic paramater `a_formal_parameter'
		require
			a_formal_parameter_not_void: a_formal_parameter /= Void
		do
			create Result.make (tokens.detachable_separate_type_mark, a_formal_parameter.name, a_formal_parameter.index, a_formal_parameter.implementation_class)
		ensure
			detachable_separate_formal_parameter_type_not_void: Result /= Void
			detachable_type_mark: attached Result.type_mark as l_type_mark1 and then l_type_mark1.is_detachable_mark
			separate_type_mark: attached Result.type_mark as l_type_mark2 and then l_type_mark2.is_separate_mark
			same_name: Result.name = a_formal_parameter.name
			same_index: Result.index = a_formal_parameter.index
			same_implementation_class: Result.implementation_class = a_formal_parameter.implementation_class
		end

invariant

	builtin_features_not_void: builtin_features /= Void
	no_void_expected_builtin_features: not builtin_features.has_void_item

end
