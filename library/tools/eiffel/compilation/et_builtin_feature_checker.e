note

	description:

		"Eiffel built-in feature validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class ET_BUILTIN_FEATURE_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_external_function,
			process_external_procedure
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	make

feature -- Validity checking

	check_builtin_feature_validity (a_feature: ET_FEATURE)
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

	check_external_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of `a_feature', written in `current_class',
			-- if it appears to be a built-in feature.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
			if STRING_.same_case_insensitive (a_feature.language.manifest_string.value, tokens.builtin_marker) then
				check_builtin_function_validity (a_feature)
			elseif STRING_.same_case_insensitive (a_feature.language.manifest_string.value, tokens.builtin_static_marker) then
				check_builtin_function_validity (a_feature)
			elseif STRING_.same_case_insensitive (a_feature.language.manifest_string.value, tokens.static_builtin_marker) then
				check_builtin_function_validity (a_feature)
			end
		end

	check_external_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of `a_feature', written in `current_class',
			-- if it appears to be a built-in feature.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
			if STRING_.same_case_insensitive (a_feature.language.manifest_string.value, tokens.builtin_marker) then
				check_builtin_procedure_validity (a_feature)
			elseif STRING_.same_case_insensitive (a_feature.language.manifest_string.value, tokens.builtin_static_marker) then
				check_builtin_procedure_validity (a_feature)
			elseif STRING_.same_case_insensitive (a_feature.language.manifest_string.value, tokens.static_builtin_marker) then
				check_builtin_procedure_validity (a_feature)
			end
		end

	check_builtin_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature', written in `current_class'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_name: ET_CLASS_NAME
		do
			l_name := current_class.name
			if l_name.same_class_name (tokens.any_class_name) then
				check_builtin_any_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.type_class_name) then
				check_builtin_type_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.special_class_name) then
				check_builtin_special_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.character_8_ref_class_name) then
				check_builtin_sized_character_ref_function_validity (a_feature, current_universe.character_8_type, tokens.builtin_character_8_class)
			elseif l_name.same_class_name (tokens.character_8_class_name) then
				check_builtin_sized_character_function_validity (a_feature, tokens.builtin_character_8_class)
			elseif l_name.same_class_name (tokens.character_32_ref_class_name) then
				check_builtin_sized_character_ref_function_validity (a_feature, current_universe.character_32_type, tokens.builtin_character_32_class)
			elseif l_name.same_class_name (tokens.character_32_class_name) then
				check_builtin_sized_character_function_validity (a_feature, tokens.builtin_character_32_class)
			elseif l_name.same_class_name (tokens.boolean_ref_class_name) then
				check_builtin_boolean_ref_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.boolean_class_name) then
				check_builtin_boolean_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.pointer_ref_class_name) then
				check_builtin_pointer_ref_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.pointer_class_name) then
				check_builtin_pointer_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.arguments_32_class_name) then
				check_builtin_arguments_32_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.memory_class_name) then
				check_builtin_memory_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.identified_routines_class_name) then
				check_builtin_identified_routines_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.internal_class_name) then
				check_builtin_internal_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.platform_class_name) then
				check_builtin_platform_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.procedure_class_name) then
				check_builtin_procedure_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.function_class_name) then
				check_builtin_function_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.tuple_class_name) then
				check_builtin_tuple_function_validity (a_feature)
			elseif l_name.same_class_name (tokens.integer_8_ref_class_name) then
				check_builtin_sized_integer_ref_function_validity (a_feature, current_universe.integer_8_type, tokens.builtin_integer_8_class)
			elseif l_name.same_class_name (tokens.integer_8_class_name) then
				check_builtin_sized_integer_function_validity (a_feature, tokens.builtin_integer_8_class)
			elseif l_name.same_class_name (tokens.integer_16_ref_class_name) then
				check_builtin_sized_integer_ref_function_validity (a_feature, current_universe.integer_16_type, tokens.builtin_integer_16_class)
			elseif l_name.same_class_name (tokens.integer_16_class_name) then
				check_builtin_sized_integer_function_validity (a_feature, tokens.builtin_integer_16_class)
			elseif l_name.same_class_name (tokens.integer_32_ref_class_name) then
				check_builtin_sized_integer_ref_function_validity (a_feature, current_universe.integer_32_type, tokens.builtin_integer_32_class)
			elseif l_name.same_class_name (tokens.integer_32_class_name) then
				check_builtin_sized_integer_function_validity (a_feature, tokens.builtin_integer_32_class)
			elseif l_name.same_class_name (tokens.integer_64_ref_class_name) then
				check_builtin_sized_integer_ref_function_validity (a_feature, current_universe.integer_64_type, tokens.builtin_integer_64_class)
			elseif l_name.same_class_name (tokens.integer_64_class_name) then
				check_builtin_sized_integer_function_validity (a_feature, tokens.builtin_integer_64_class)
			elseif l_name.same_class_name (tokens.natural_8_ref_class_name) then
				check_builtin_sized_integer_ref_function_validity (a_feature, current_universe.natural_8_type, tokens.builtin_natural_8_class)
			elseif l_name.same_class_name (tokens.natural_8_class_name) then
				check_builtin_sized_integer_function_validity (a_feature, tokens.builtin_natural_8_class)
			elseif l_name.same_class_name (tokens.natural_16_ref_class_name) then
				check_builtin_sized_integer_ref_function_validity (a_feature, current_universe.natural_16_type, tokens.builtin_natural_16_class)
			elseif l_name.same_class_name (tokens.natural_16_class_name) then
				check_builtin_sized_integer_function_validity (a_feature, tokens.builtin_natural_16_class)
			elseif l_name.same_class_name (tokens.natural_32_ref_class_name) then
				check_builtin_sized_integer_ref_function_validity (a_feature, current_universe.natural_32_type, tokens.builtin_natural_32_class)
			elseif l_name.same_class_name (tokens.natural_32_class_name) then
				check_builtin_sized_integer_function_validity (a_feature, tokens.builtin_natural_32_class)
			elseif l_name.same_class_name (tokens.natural_64_ref_class_name) then
				check_builtin_sized_integer_ref_function_validity (a_feature, current_universe.natural_64_type, tokens.builtin_natural_64_class)
			elseif l_name.same_class_name (tokens.natural_64_class_name) then
				check_builtin_sized_integer_function_validity (a_feature, tokens.builtin_natural_64_class)
			elseif l_name.same_class_name (tokens.real_32_ref_class_name) then
				check_builtin_sized_real_ref_function_validity (a_feature, current_universe.real_32_type, tokens.builtin_real_32_class)
			elseif l_name.same_class_name (tokens.real_32_class_name) then
				check_builtin_sized_real_function_validity (a_feature, tokens.builtin_real_32_class)
			elseif l_name.same_class_name (tokens.real_64_ref_class_name) then
				check_builtin_sized_real_ref_function_validity (a_feature, current_universe.real_64_type, tokens.builtin_real_64_class)
			elseif l_name.same_class_name (tokens.real_64_class_name) then
				check_builtin_sized_real_function_validity (a_feature, tokens.builtin_real_64_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_any_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "ANY".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.twin_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_twin))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'twin: like Current'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
				elseif not a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class) then
						-- The signature should be 'twin: like Current'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
				end
			elseif a_feature.name.same_feature_name (tokens.is_equal_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_is_equal))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'is_equal (other: like Current): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class) then
						-- The signature should be 'is_equal (other: like Current): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_equal (other: like Current): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.standard_is_equal_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_is_equal))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'standard_is_equal (other: like Current): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class) then
						-- The signature should be 'standard_is_equal (other: like Current): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'standard_is_equal (other: like Current): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.same_type_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_same_type))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'same_type (other: ANY): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.any_type, current_class, current_class) then
						-- The signature should be 'same_type (other: ANY): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'same_type (other: ANY): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.conforms_to_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_conforms_to))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'conforms_to (other: ANY): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.any_type, current_class, current_class) then
						-- The signature should be 'conforms_to (other: ANY): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'conforms_to (other: ANY): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.generator_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_generator))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'generator: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.string_type, current_class, current_class) then
						-- The signature should be 'generator: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.generating_type_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_generating_type))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'generating_type: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.string_type, current_class, current_class) then
						-- The signature should be 'generating_type: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.tagged_out_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_tagged_out))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'tagged_out: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.string_type, current_class, current_class) then
						-- The signature should be 'tagged_out: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.standard_twin_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_twin))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'standard_twin: like Current'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
				elseif not a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class) then
						-- The signature should be 'standard_twin: like Current'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
				end
			elseif a_feature.name.same_feature_name (tokens.is_deep_equal_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_is_deep_equal))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'is_deep_equal (other: like Current): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class) then
						-- The signature should be 'is_deep_equal (other: like Current): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_deep_equal (other: like Current): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.deep_twin_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_deep_twin))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'deep_twin: like Current'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
				elseif not a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class) then
						-- The signature should be 'deep_twin: like Current'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
				end
			elseif a_feature.name.same_feature_name (tokens.standard_copy_feature_name) then
					-- 'ANY.standard_copy' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_copy))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.copy_feature_name) then
					-- 'ANY.copy' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_copy))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_type_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "TYPE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_type_type_any: ET_GENERIC_CLASS_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_formal_parameter: ET_FORMAL_PARAMETER_TYPE
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.base_class_name_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_base_class_name))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'base_class_name: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.string_type, current_class, current_class) then
						-- The signature should be 'base_class_name: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.boolean_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_boolean_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'boolean_field (i: INTEGER; object: G): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'boolean_field (i: INTEGER; object: G): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'boolean_field (i: INTEGER; object: G): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'boolean_field (i: INTEGER; object: G): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.character_8_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_character_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'character_8_field (i: INTEGER; object: G): CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_8_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'character_8_field (i: INTEGER; object: G): CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_8_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'character_8_field (i: INTEGER; object: G): CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.character_8_type, current_class, current_class) then
						-- The signature should be 'character_8_field (i: INTEGER; object: G): CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.character_32_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_character_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'character_32_field (i: INTEGER; object: G): CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_32_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'character_32_field (i: INTEGER; object: G): CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_32_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'character_32_field (i: INTEGER; object: G): CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.character_32_type, current_class, current_class) then
						-- The signature should be 'character_32_field (i: INTEGER; object: G): CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.default_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_default))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'default: G'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_formal_parameter)
				elseif not a_feature.type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'default: G'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_formal_parameter)
				end
			elseif a_feature.name.same_feature_name (tokens.field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'field (i: INTEGER; object: G): detachable ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.detachable_any_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'field (i: INTEGER; object: G): detachable ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.detachable_any_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'field (i: INTEGER; object: G): detachable ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.detachable_any_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.detachable_any_type, current_class, current_class) then
						-- The signature should be 'field (i: INTEGER; object: G): detachable ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.detachable_any_type)
				end
			elseif a_feature.name.same_feature_name (tokens.field_count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_field_count))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'field_count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'field_count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.field_name_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_field_name))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'field_name (i: INTEGER): STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.string_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'field_name (i: INTEGER): STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.string_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.string_type, current_class, current_class) then
						-- The signature should be 'field_name (i: INTEGER): STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.field_static_type_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_field_static_type))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'field_static_type (i: INTEGER): TYPE [detachable ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'field_static_type (i: INTEGER): TYPE [detachable ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.type_detachable_any_type, current_class, current_class) then
						-- The signature should be 'field_static_type (i: INTEGER): TYPE [detachable ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type)
				end
			elseif a_feature.name.same_feature_name (tokens.field_type_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_field_type))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'field_type (i: INTEGER): INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'field_type (i: INTEGER): INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'field_type (i: INTEGER): INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.generating_type_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generating_type))
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (current_universe.type_any_type)
				create l_type_type_any.make (Void, tokens.type_class_name, l_parameters, current_universe.type_any_type.named_base_class)
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'generating_type: TYPE [TYPE [ANY]]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_type_type_any)
				elseif not a_feature.type.same_syntactical_type (l_type_type_any, current_class, current_class) then
						-- The signature should be 'generating_type: TYPE [TYPE [ANY]]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_type_type_any)
				end
			elseif a_feature.name.same_feature_name (tokens.generic_parameter_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generic_parameter))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'generic_parameter (i: INTEGER): TYPE [detachable ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'generic_parameter (i: INTEGER): TYPE [detachable ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.type_detachable_any_type, current_class, current_class) then
						-- The signature should be 'generic_parameter (i: INTEGER): TYPE [detachable ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type)
				end
			elseif a_feature.name.same_feature_name (tokens.generic_parameter_count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generic_parameter_count))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'generic_parameter_count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'generic_parameter_count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.has_default_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_has_default))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'has_default: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'has_default: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_8_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_integer_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'integer_8_field (i: INTEGER; object: G): INTEGER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_8_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'integer_8_field (i: INTEGER; object: G): INTEGER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_8_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'integer_8_field (i: INTEGER; object: G): INTEGER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_8_type, current_class, current_class) then
						-- The signature should be 'integer_8_field (i: INTEGER; object: G): INTEGER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_16_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_integer_16_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'integer_16_field (i: INTEGER; object: G): INTEGER_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_16_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'integer_16_field (i: INTEGER; object: G): INTEGER_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_16_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'integer_16_field (i: INTEGER; object: G): INTEGER_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_16_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_16_type, current_class, current_class) then
						-- The signature should be 'integer_16_field (i: INTEGER; object: G): INTEGER_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_16_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_32_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_integer_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'integer_32_field (i: INTEGER; object: G): INTEGER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_32_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'integer_32_field (i: INTEGER; object: G): INTEGER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_32_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'integer_32_field (i: INTEGER; object: G): INTEGER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_32_type, current_class, current_class) then
						-- The signature should be 'integer_32_field (i: INTEGER; object: G): INTEGER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_64_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_integer_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'integer_64_field (i: INTEGER; object: G): INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_64_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'integer_64_field (i: INTEGER; object: G): INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_64_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'integer_64_field (i: INTEGER; object: G): INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_64_type, current_class, current_class) then
						-- The signature should be 'integer_64_field (i: INTEGER; object: G): INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_expanded_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_is_expanded))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_expanded: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_expanded: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.name_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_name))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'name: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.string_type, current_class, current_class) then
						-- The signature should be 'name: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_8_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_natural_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'natural_8_field (i: INTEGER; object: G): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_8_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'natural_8_field (i: INTEGER; object: G): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_8_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'natural_8_field (i: INTEGER; object: G): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_8_type, current_class, current_class) then
						-- The signature should be 'natural_8_field (i: INTEGER; object: G): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_16_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_natural_16_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'natural_16_field (i: INTEGER; object: G): NATURAL_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_16_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'natural_16_field (i: INTEGER; object: G): NATURAL_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_16_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'natural_16_field (i: INTEGER; object: G): NATURAL_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_16_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_16_type, current_class, current_class) then
						-- The signature should be 'natural_16_field (i: INTEGER; object: G): NATURAL_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_16_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_32_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_natural_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'natural_32_field (i: INTEGER; object: G): NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_32_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'natural_32_field (i: INTEGER; object: G): NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_32_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'natural_32_field (i: INTEGER; object: G): NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_32_type, current_class, current_class) then
						-- The signature should be 'natural_32_field (i: INTEGER; object: G): NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_64_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_natural_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'natural_64_field (i: INTEGER; object: G): NATURAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_64_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'natural_64_field (i: INTEGER; object: G): NATURAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_64_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'natural_64_field (i: INTEGER; object: G): NATURAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_64_type, current_class, current_class) then
						-- The signature should be 'natural_64_field (i: INTEGER; object: G): NATURAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.pointer_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_pointer_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'pointer_field (i: INTEGER; object: G): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.pointer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'pointer_field (i: INTEGER; object: G): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.pointer_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'pointer_field (i: INTEGER; object: G): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.pointer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.pointer_type, current_class, current_class) then
						-- The signature should be 'pointer_field (i: INTEGER; object: G): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.pointer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.real_32_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_real_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'real_32_field (i: INTEGER; object: G): REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_32_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'real_32_field (i: INTEGER; object: G): REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_32_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'real_32_field (i: INTEGER; object: G): REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_32_type, current_class, current_class) then
						-- The signature should be 'real_32_field (i: INTEGER; object: G): REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.real_64_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_real_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'real_64_field (i: INTEGER; object: G): REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_64_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'real_64_field (i: INTEGER; object: G): REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_64_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'real_64_field (i: INTEGER; object: G): REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
						-- The signature should be 'real_64_field (i: INTEGER; object: G): REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.runtime_name_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_runtime_name))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'runtime_name: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.string_type, current_class, current_class) then
						-- The signature should be 'runtime_name: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.type_id_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_type_id))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'type_id: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'type_id: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.set_boolean_field_feature_name) then
					-- 'TYPE.set_boolean_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_boolean_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.boolean_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_character_8_field_feature_name) then
					-- 'TYPE.set_character_8_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_character_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_8_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_character_32_field_feature_name) then
					-- 'TYPE.set_character_32_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_character_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_32_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_integer_8_field_feature_name) then
					-- 'TYPE.set_integer_8_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_integer_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_8_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_integer_16_field_feature_name) then
					-- 'TYPE.set_integer_16_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_integer_16_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_16_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_integer_32_field_feature_name) then
					-- 'TYPE.set_integer_32_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_integer_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_32_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_integer_64_field_feature_name) then
					-- 'TYPE.set_integer_64_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_integer_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_64_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_natural_8_field_feature_name) then
					-- 'TYPE.set_natural_8_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_natural_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_8_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_natural_16_field_feature_name) then
					-- 'TYPE.set_natural_16_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_natural_16_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_16_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_natural_32_field_feature_name) then
					-- 'TYPE.set_natural_32_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_natural_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_32_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_natural_64_field_feature_name) then
					-- 'TYPE.set_natural_64_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_natural_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_64_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_pointer_field_feature_name) then
					-- 'TYPE.set_pointer_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_pointer_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.pointer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_real_32_field_feature_name) then
					-- 'TYPE.set_real_32_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_real_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_32_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_real_64_field_feature_name) then
					-- 'TYPE.set_real_64_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_real_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_64_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_reference_field_feature_name) then
					-- 'TYPE.set_reference_field' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_reference_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.detachable_any_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_special_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "SPECIAL".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_formal_parameter: ET_FORMAL_PARAMETER_TYPE
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_item))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'item (i: INTEGER): G'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_formal_parameter)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'item (i: INTEGER): G'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_formal_parameter)
				elseif not a_feature.type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'item (i: INTEGER): G'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_formal_parameter)
				end
			elseif a_feature.name.same_feature_name (tokens.capacity_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_capacity))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'capapcity: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'capapcity: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_count))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.element_size_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_element_size))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'element_size: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'element_size: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.aliased_resized_area_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_aliased_resized_area))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'aliased_resized_area (n: INTEGER): like Current'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, tokens.like_current)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'aliased_resized_area (n: INTEGER): like Current'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, tokens.like_current)
				elseif not a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class) then
						-- The signature should be 'aliased_resized_area (n: INTEGER): like Current'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, tokens.like_current)
				end
			elseif a_feature.name.same_feature_name (tokens.base_address_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_base_address))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'base_address: POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.pointer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.pointer_type, current_class, current_class) then
						-- The signature should be 'base_address: POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.pointer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.extend_feature_name) then
					-- 'SPECIAL.extend' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_extend))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_formal_parameter.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.make_empty_feature_name) then
					-- 'SPECIAL.make_empty' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_make_empty))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_feature_name) then
					-- 'SPECIAL.put' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_put))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_formal_parameter.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_count_feature_name) then
					-- 'SPECIAL.set_count' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_set_count))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_character_ref_function_validity (a_feature: ET_EXTERNAL_FUNCTION; a_character_type: ET_CLASS_TYPE; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from the ref class of sized `a_character_type'.
			-- `a_builtin_class_code' is the built-in code of base class of `a_character_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_character_type_not_void: a_character_type /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: CHARACTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_character_type)
				elseif not a_feature.type.same_syntactical_type (a_character_type, current_class, current_class) then
						-- The signature should be 'item: CHARACTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_character_type)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'CHARACTER_REF.set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_set_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<a_character_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_character_function_validity (a_feature: ET_EXTERNAL_FUNCTION; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from a sized character class whose
			-- built-in code is `a_builtin_class_code'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.code_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_code))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'code: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'code: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_32_code_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_natural_32_code))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'natural_32_code: NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_32_type, current_class, current_class) then
						-- The signature should be 'natural_32_code: NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.to_character_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_to_character_8))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_character_8: CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.character_8_type, current_class, current_class) then
						-- The signature should be 'to_character_8: CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.to_character_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_to_character_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_character_32: CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.character_32_type, current_class, current_class) then
						-- The signature should be 'to_character_32: CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_32_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_boolean_ref_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "BOOLEAN_REF".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'item: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'BOOLEAN_REF.set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_set_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_boolean_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "BOOLEAN".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.conjuncted_feature_name) or a_feature.name.same_feature_name (tokens.infix_and_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_and))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'conjuncted (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'conjuncted (other: BOOLEAN): BOOLEAN'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'conjuncted (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.conjuncted_semistrict_feature_name) or a_feature.name.same_feature_name (tokens.infix_and_then_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_and_then))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'conjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'conjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'conjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.disjuncted_feature_name) or a_feature.name.same_feature_name (tokens.infix_or_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_or))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'disjuncted (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'disjuncted (other: BOOLEAN): BOOLEAN'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'disjuncted (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.disjuncted_semistrict_feature_name) or a_feature.name.same_feature_name (tokens.infix_or_else_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_or_else))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'disjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'disjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'disjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.negated_feature_name) or a_feature.name.same_feature_name (tokens.prefix_not_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_not))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'negated: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_1_latest and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'negated: BOOLEAN'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.implication_feature_name) or a_feature.name.same_feature_name (tokens.infix_implies_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_implies))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'implication (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'implication (other: BOOLEAN): BOOLEAN'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'implication (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.disjuncted_exclusive_feature_name) or a_feature.name.same_feature_name (tokens.infix_xor_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_xor))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'disjuncted_exclusive (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'disjuncted_exclusive (other: BOOLEAN): BOOLEAN'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'disjuncted_exclusive (other: BOOLEAN): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, current_universe.boolean_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_pointer_ref_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "POINTER_REF".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.pointer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.pointer_type, current_class, current_class) then
						-- The signature should be 'item: POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.pointer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'POINTER_REF.set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_set_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.pointer_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_pointer_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "POINTER".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_plus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'plus (offset: INTEGER): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'plus (offset: INTEGER): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.pointer_type, current_class, current_class) then
						-- The signature should be 'plus (offset: INTEGER): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.to_integer_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_to_integer_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_integer_32: INTEGER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_32_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class)) then
							-- The signature should be 'to_integer_32: INTEGER_32'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_32_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.out_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_out))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'out: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.string_type, current_class, current_class) then
						-- The signature should be 'out: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.hash_code_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_hash_code))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'hash_code: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'hash_code: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_default_pointer_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_is_default_pointer))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_default_pointer: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_default_pointer: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_arguments_32_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "ARGUMENTS_32".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.argument_count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_arguments_32_feature (tokens.builtin_arguments_32_argument_count))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'argument_count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'argument_count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.i_th_argument_pointer_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_arguments_32_feature (tokens.builtin_arguments_32_i_th_argument_pointer))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'i_th_argument_pointer (i: INTEGER): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'i_th_argument_pointer (i: INTEGER): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.pointer_type, current_class, current_class) then
						-- The signature should be 'i_th_argument_pointer (i: INTEGER): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_memory_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "MEMORY".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.find_referers_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_memory_feature (tokens.builtin_memory_find_referers))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'find_referers (target: ANY; result_type: INTEGER): SPECIAL [ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type, current_universe.integer_type.type>>, current_universe.special_any_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.any_type, current_class, current_class) then
						-- The signature should be 'find_referers (target: ANY; result_type: INTEGER): SPECIAL [ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type, current_universe.integer_type.type>>, current_universe.special_any_type)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'find_referers (target: ANY; result_type: INTEGER): SPECIAL [ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type, current_universe.integer_type.type>>, current_universe.special_any_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.special_any_type, current_class, current_class) then
						-- The signature should be 'find_referers (target: ANY; result_type: INTEGER): SPECIAL [ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type, current_universe.integer_type.type>>, current_universe.special_any_type)
				end
			elseif a_feature.name.same_feature_name (tokens.free_feature_name) then
					-- 'MEMORY.free' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_memory_feature (tokens.builtin_memory_free))
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_identified_routines_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "IDENTIFIED_ROUTINES".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.eif_id_object_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_id_object))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'eif_id_object (an_id: INTEGER): detachable ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.detachable_any_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'eif_id_object (an_id: INTEGER): detachable ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.detachable_any_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.detachable_any_type, current_class, current_class) then
						-- The signature should be 'eif_id_object (an_id: INTEGER): detachable ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.detachable_any_type)
				end
			elseif a_feature.name.same_feature_name (tokens.eif_object_id_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_object_id))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'eif_object_id (an_object: ANY): INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.any_type, current_class, current_class) then
						-- The signature should be 'eif_object_id (an_object: ANY): INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'eif_object_id (an_object: ANY): INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.eif_object_id_free_feature_name) then
					-- 'IDENTIFIED_ROUTINES.eif_object_id_free' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_object_id_free))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_internal_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "INTERNAL".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.type_of_type_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_internal_feature (tokens.builtin_internal_type_of_type))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'type_of_type (a_type_id: INTEGER): detachable TYPE [detachable ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.detachable_type_detachable_any_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'type_of_type (a_type_id: INTEGER): detachable TYPE [detachable ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.detachable_type_detachable_any_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.detachable_type_detachable_any_type, current_class, current_class) then
						-- The signature should be 'type_of_type (a_type_id: INTEGER): detachable TYPE [detachable ANY]'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.detachable_type_detachable_any_type)
				end
			elseif a_feature.name.same_feature_name (tokens.max_type_id_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_internal_feature (tokens.builtin_internal_max_type_id))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'max_type_id: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'max_type_id: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_platform_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "PLATFORM".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.is_dotnet_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_dotnet))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_dotnet: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_dotnet: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_mac_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_mac))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_mac: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_mac: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_unix_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_unix))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_unix: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_unix: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_vms_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_vms))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_vms: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_vms: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_vxworks_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_vxworks))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_vxworks: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_vxworks: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_windows_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_windows))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_windows: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_windows: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.boolean_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_boolean_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'boolean_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'boolean_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.character_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_character_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'character_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'character_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.double_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_double_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'double_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'double_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_integer_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'integer_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'integer_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.pointer_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_pointer_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'pointer_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'pointer_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.real_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_real_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'real_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'real_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_scoop_capable_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_scoop_capable))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_scoop_capable: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_scoop_capable: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_thread_capable_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_thread_capable))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_thread_capable: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_thread_capable: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.wide_character_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_wide_character_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'wide_character_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'wide_character_bytes: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_procedure_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "PROCEDURE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_open_args: ET_FORMAL_PARAMETER_TYPE
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.call_feature_name) then
					-- 'call' should be a procedure.
				l_open_args := current_class.formal_parameter_type (2)
				a_feature.set_builtin_code (tokens.builtin_procedure_feature (tokens.builtin_procedure_call))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<detachable_formal_parameter_type (l_open_args).type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_function_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "FUNCTION".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_open_args: ET_FORMAL_PARAMETER_TYPE
			l_result_type: ET_FORMAL_PARAMETER_TYPE
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				l_open_args := current_class.formal_parameter_type (2)
				l_result_type := current_class.formal_parameter_type (3)
				a_feature.set_builtin_code (tokens.builtin_function_feature (tokens.builtin_function_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'item (args: detachable OPEN_ARGS): RESULT_TYPE'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<detachable_formal_parameter_type (l_open_args).type>>, l_result_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type_with_type_marks (l_open_args, tokens.detachable_keyword, current_class, Void, current_class) then
						-- The signature should be 'item (args: detachable OPEN_ARGS): RESULT_TYPE'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<detachable_formal_parameter_type (l_open_args).type>>, l_result_type)
				elseif not a_feature.type.same_syntactical_type (l_result_type, current_class, current_class) then
						-- The signature should be 'item (args: detachable OPEN_ARGS): RESULT_TYPE'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<detachable_formal_parameter_type (l_open_args).type>>, l_result_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_tuple_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of built-in `a_feature' from class "TUPLE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.boolean_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_boolean_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'boolean_item (i: INTEGER): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'boolean_item (i: INTEGER): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'boolean_item (i: INTEGER): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.character_8_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_character_8_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'character_8_item (i: INTEGER): CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.character_8_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'character_8_item (i: INTEGER): CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.character_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.character_8_type, current_class, current_class) then
						-- The signature should be 'character_8_item (i: INTEGER): CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.character_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.character_32_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_character_32_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'character_32_item (i: INTEGER): CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.character_32_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'character_32_item (i: INTEGER): CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.character_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.character_32_type, current_class, current_class) then
						-- The signature should be 'character_32_item (i: INTEGER): CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.character_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_count))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'count: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_8_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_8_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_8_item (i: INTEGER): INTEGER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_8_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'integer_8_item (i: INTEGER): INTEGER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_8_type, current_class, current_class) then
						-- The signature should be 'integer_8_item (i: INTEGER): INTEGER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_16_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_16_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_16_item (i: INTEGER): INTEGER_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_16_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'integer_16_item (i: INTEGER): INTEGER_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_16_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_16_type, current_class, current_class) then
						-- The signature should be 'integer_16_item (i: INTEGER): INTEGER_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_16_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_32_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_32_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_32_item (i: INTEGER): INTEGER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_32_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'integer_32_item (i: INTEGER): INTEGER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_32_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class)) then
							-- The signature should be 'integer_32_item (i: INTEGER): INTEGER_32'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_32_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.integer_64_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_64_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_64_item (i: INTEGER): INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_64_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'integer_64_item (i: INTEGER): INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_64_type, current_class, current_class) then
						-- The signature should be 'integer_64_item (i: INTEGER): INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.item_code_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_item_code))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'item_code (i: INTEGER): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_8_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'item_code (i: INTEGER): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_8_type, current_class, current_class) then
						-- The signature should be 'item_code (i: INTEGER): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_8_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_8_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'natural_8_item (i: INTEGER): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_8_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'natural_8_item (i: INTEGER): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_8_type, current_class, current_class) then
						-- The signature should be 'natural_8_item (i: INTEGER): NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_16_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_16_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'natural_16_item (i: INTEGER): NATURAL_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_16_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'natural_16_item (i: INTEGER): NATURAL_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_16_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_16_type, current_class, current_class) then
						-- The signature should be 'natural_16_item (i: INTEGER): NATURAL_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_16_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_32_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_32_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'natural_32_item (i: INTEGER): NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_32_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'natural_32_item (i: INTEGER): NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_32_type, current_class, current_class) then
						-- The signature should be 'natural_32_item (i: INTEGER): NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_64_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_64_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'natural_64_item (i: INTEGER): NATURAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_64_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'natural_64_item (i: INTEGER): NATURAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_64_type, current_class, current_class) then
						-- The signature should be 'natural_64_item (i: INTEGER): NATURAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.object_comparison_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_object_comparison))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'object_comparison: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'object_comparison: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.pointer_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_pointer_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'pointer_item (i: INTEGER): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'pointer_item (i: INTEGER): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.pointer_type, current_class, current_class) then
						-- The signature should be 'pointer_item (i: INTEGER): POINTER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.real_32_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_real_32_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'real_32_item (i: INTEGER): REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.real_32_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'real_32_item (i: INTEGER): REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.real_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_32_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.real_type, current_class, current_class)) then
							-- The signature should be 'real_32_item (i: INTEGER): REAL_32'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.real_32_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.real_64_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_real_64_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'real_64_item (i: INTEGER): REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.real_64_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'real_64_item (i: INTEGER): REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.real_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'real_64_item (i: INTEGER): REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.real_64_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.reference_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_reference_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'reference_item (i: INTEGER): ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.any_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'reference_item (i: INTEGER): ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.any_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.any_type, current_class, current_class) then
						-- The signature should be 'reference_item (i: INTEGER): ANY'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.any_type)
				end
			elseif a_feature.name.same_feature_name (tokens.put_boolean_feature_name) then
					-- 'TUPLE.put_boolean' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_boolean))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_character_8_feature_name) then
					-- 'TUPLE.put_character_8' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_character_8))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.character_8_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_character_32_feature_name) then
					-- 'TUPLE.put_character_32' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_character_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.character_32_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_integer_8_feature_name) then
					-- 'TUPLE.put_integer_8' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_8))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_8_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_integer_16_feature_name) then
					-- 'TUPLE.put_integer_16' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_16))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_16_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_integer_32_feature_name) then
					-- 'TUPLE.put_integer_32' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_integer_64_feature_name) then
					-- 'TUPLE.put_integer_64' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_64))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_64_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_natural_8_feature_name) then
					-- 'TUPLE.put_natural_8' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_8))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_8_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_natural_16_feature_name) then
					-- 'TUPLE.put_natural_16' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_16))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_16_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_natural_32_feature_name) then
					-- 'TUPLE.put_natural_32' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_32_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_natural_64_feature_name) then
					-- 'TUPLE.put_natural_64' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_64))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_64_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_pointer_feature_name) then
					-- 'TUPLE.put_pointer' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_pointer))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.pointer_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_real_32_feature_name) then
					-- 'TUPLE.put_real_32' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_real_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_real_64_feature_name) then
					-- 'TUPLE.put_real_64' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_real_64))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.double_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_reference_feature_name) then
					-- 'TUPLE.put_reference' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_reference))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.detachable_any_type.type, current_universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_object_comparison_feature_name) then
					-- 'TUPLE.set_object_comparison' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_set_object_comparison))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_integer_ref_function_validity (a_feature: ET_EXTERNAL_FUNCTION; a_integer_type: ET_CLASS_TYPE; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from the ref class of sized `a_integer_type'.
			-- `a_builtin_class_code' is the built-in code of base class of `a_integer_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_integer_type_not_void: a_integer_type /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_integer_type)
				elseif not a_feature.type.same_syntactical_type (a_integer_type, current_class, current_class) then
						-- The signature should be 'item: INTEGER'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_set_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<a_integer_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_integer_function_validity (a_feature: ET_EXTERNAL_FUNCTION; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from a sized integer class whose
			-- built-in code is `a_builtin_class_code'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_integer_type: ET_CLASS_TYPE
		do
				-- List function names first, then procedure names.
			l_integer_type := current_class
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_plus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'plus (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'plus (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'plus (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.minus_feature_name) or a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_minus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'minus (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'minus (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'minus (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.product_feature_name) or a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_times))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'product (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'product (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'product (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_divide))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'quotient (other: INTEGER_xx): REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, current_universe.real_64_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'quotient (other: INTEGER_xx): REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, current_universe.real_64_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'quotient (other: INTEGER_xx): REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, current_universe.real_64_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.integer_quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_div_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_div))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_quotient (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'integer_quotient (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'integer_quotient (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.integer_remainder_feature_name) or a_feature.name.same_feature_name (tokens.infix_mod_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_mod))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_remainder (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'integer_remainder (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'integer_remainder (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.power_feature_name) or a_feature.name.same_feature_name (tokens.infix_power_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_power))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'power (other: REAL_64): REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_64_type.type>>, current_universe.real_64_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'power (other: REAL_64): REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_64_type.type>>, current_universe.real_64_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'power (other: REAL_64): REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_64_type.type>>, current_universe.real_64_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.opposite_feature_name) or a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_opposite))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'opposite: INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_integer_type)
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'opposite: INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.is_less_feature_name) or a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_lt))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'is_less (other: INTEGER_xx): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'is_less (other: INTEGER_xx): BOOLEAN'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, current_universe.boolean_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_less (other: INTEGER_xx): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.to_character_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_character_8))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_character_8: CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.character_8_type, current_class, current_class) then
						-- The signature should be 'to_character_8: CHARACTER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.to_character_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_character_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_character_32: CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.character_32_type, current_class, current_class) then
						-- The signature should be 'to_character_32: CHARACTER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.to_real_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_real: REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_32_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.real_type, current_class, current_class)) then
							-- The signature should be 'to_real: REAL_32'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.to_real_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_real_32: REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_32_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.real_type, current_class, current_class)) then
							-- The signature should be 'to_real_32: REAL_32'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.to_real_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_real_64: REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'to_real_64: REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.to_double_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_double))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_double: REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'to_double: REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.as_natural_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_8))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_natural_8: NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_8_type, current_class, current_class) then
						-- The signature should be 'as_natural_8: NATURAL_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.as_natural_16_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_16))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_natural_16: NATURAL_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_16_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_16_type, current_class, current_class) then
						-- The signature should be 'as_natural_16: NATURAL_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_16_type)
				end
			elseif a_feature.name.same_feature_name (tokens.as_natural_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_natural_32: NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_32_type, current_class, current_class) then
						-- The signature should be 'as_natural_32: NATURAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.as_natural_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_natural_64: NATURAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.natural_64_type, current_class, current_class) then
						-- The signature should be 'as_natural_64: NATURAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.as_integer_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_8))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_integer_8: INTEGER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_8_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_8_type, current_class, current_class) then
						-- The signature should be 'as_integer_8: INTEGER_8'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_8_type)
				end
			elseif a_feature.name.same_feature_name (tokens.as_integer_16_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_16))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_integer_16: INTEGER_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_16_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_16_type, current_class, current_class) then
						-- The signature should be 'as_integer_16: INTEGER_16'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_16_type)
				end
			elseif a_feature.name.same_feature_name (tokens.as_integer_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_integer_32: INTEGER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_32_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class)) then
							-- The signature should be 'as_integer_32: INTEGER_32'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_32_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.as_integer_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_integer_64: INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_64_type, current_class, current_class) then
						-- The signature should be 'as_integer_64: INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.bit_or_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_or))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_or (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'bit_or (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'bit_or (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_and_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_and))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_and (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'bit_and (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'bit_and (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_shift_left_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_shift_left))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_shift_left (other: INTEGER): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'bit_shift_left (other: INTEGER): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_integer_type)
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'bit_shift_left (other: INTEGER): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_shift_right_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_shift_right))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_shift_right (other: INTEGER): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'bit_shift_right (other: INTEGER): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_integer_type)
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'bit_shift_right (other: INTEGER): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_xor_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_xor))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_xor (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'bit_xor (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'bit_xor (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_integer_type.type>>, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_not_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_not))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'bit_not: INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_integer_type)
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'bit_not: INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_integer_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.identity_feature_name) or a_feature.name.same_feature_name (tokens.prefix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_identity))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'identity: INTEGER_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_integer_type)
				elseif not a_feature.type.same_syntactical_type (l_integer_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'identity: INTEGER_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_integer_type)
					end
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_real_ref_function_validity (a_feature: ET_EXTERNAL_FUNCTION; a_real_type: ET_CLASS_TYPE; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from the ref class of sized `a_real_type'.
			-- `a_builtin_class_code' is the built-in code of base class of `a_real_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
				elseif not a_feature.type.same_syntactical_type (a_real_type, current_class, current_class) then
						-- The signature should be 'item: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
				end
			elseif a_feature.name.same_feature_name (tokens.nan_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_nan))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'nan: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
				elseif not a_feature.type.same_syntactical_type (a_real_type, current_class, current_class) then
						-- The signature should be 'nan: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
				end
			elseif a_feature.name.same_feature_name (tokens.negative_infinity_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_negative_infinity))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'negative_infinity: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
				elseif not a_feature.type.same_syntactical_type (a_real_type, current_class, current_class) then
						-- The signature should be 'negative_infinity: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
				end
			elseif a_feature.name.same_feature_name (tokens.positive_infinity_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_positive_infinity))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'positive_infinity: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
				elseif not a_feature.type.same_syntactical_type (a_real_type, current_class, current_class) then
						-- The signature should be 'positive_infinity: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_set_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<a_real_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_real_function_validity (a_feature: ET_EXTERNAL_FUNCTION; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from a sized real class whose
			-- built-in code is `a_builtin_class_code'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_real_type: ET_CLASS_TYPE
		do
				-- List function names first, then procedure names.
			l_real_type := current_class
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_plus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'plus (other: REAL_xx): REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'plus (other: REAL_xx): REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'plus (other: REAL_xx): REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.minus_feature_name) or a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_minus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'minus (other: REAL_xx): REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'minus (other: REAL_xx): REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'minus (other: REAL_xx): REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.product_feature_name) or a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_times))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'product (other: REAL_xx): REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'product (other: REAL_xx): REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'product (other: REAL_xx): REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_divide))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'quotient (other: REAL_xx): REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'quotient (other: REAL_xx): REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
					end
				elseif not a_feature.type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'quotient (other: REAL_xx): REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, l_real_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.power_feature_name) or a_feature.name.same_feature_name (tokens.infix_power_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_power))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'power (other: REAL_64): REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_64_type.type>>, current_universe.real_64_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'power (other: REAL_64): REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_64_type.type>>, current_universe.real_64_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'power (other: REAL_64): REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_64_type.type>>, current_universe.real_64_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.opposite_feature_name) or a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_opposite))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'opposite: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_real_type)
				elseif not a_feature.type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'opposite: REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_real_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.identity_feature_name) or a_feature.name.same_feature_name (tokens.prefix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_identity))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'identity: REAL_xx'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_real_type)
				elseif not a_feature.type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then a_feature.type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'identity: REAL_xx'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_real_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.is_less_feature_name) or a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_lt))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'is_less (other: REAL_xx): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, current_universe.boolean_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class)) then
							-- The signature should be 'is_less (other: REAL_xx): BOOLEAN'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, current_universe.boolean_type)
					end
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_less (other: REAL_xx): BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_real_type.type>>, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_nan_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_is_nan))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_nan: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_nan: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_negative_infinity_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_is_negative_infinity))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_negative_infinity: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_negative_infinity: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_positive_infinity_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_is_positive_infinity))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_positive_infinity: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'is_positive_infinity: BOOLEAN'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
				end
			elseif a_feature.name.same_feature_name (tokens.truncated_to_integer_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_integer))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'truncated_to_integer: INTEGER_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_32_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.integer_type, current_class, current_class)) then
							-- The signature should be 'truncated_to_integer: INTEGER_32'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_32_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.truncated_to_integer_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_integer_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'truncated_to_integer_64: INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.integer_64_type, current_class, current_class) then
						-- The signature should be 'truncated_to_integer_64: INTEGER_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.truncated_to_real_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_real))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'truncated_to_real: REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_32_type, current_class, current_class) then
						-- The signature should be 'truncated_to_real: REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.to_double_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_to_double))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_double: REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'to_double: REAL_64'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.ceiling_real_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_ceiling_real_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'ceiling_real_32: REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_32_type, current_class, current_class) then
						-- The signature should be 'ceiling_real_32: REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.ceiling_real_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_ceiling_real_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'ceiling_real_64: REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
						-- The signature should be 'ceiling_real_64: REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.floor_real_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_floor_real_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'floor_real_32: REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_32_type, current_class, current_class) then
						-- The signature should be 'floor_real_32: REAL_32'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
				end
			elseif a_feature.name.same_feature_name (tokens.floor_real_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_floor_real_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'floor_real_64: REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
						-- The signature should be 'floor_real_64: REAL_64'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
				end
			elseif a_feature.name.same_feature_name (tokens.out_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_out))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'out: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				elseif not a_feature.type.same_syntactical_type (current_universe.string_type, current_class, current_class) then
						-- The signature should be 'out: STRING'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature', written in `current_class'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_name: ET_CLASS_NAME
		do
			l_name := current_class.name
			if l_name.same_class_name (tokens.any_class_name) then
				check_builtin_any_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.type_class_name) then
				check_builtin_type_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.special_class_name) then
				check_builtin_special_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.character_8_ref_class_name) then
				check_builtin_sized_character_ref_procedure_validity (a_feature, current_universe.character_8_type, tokens.builtin_character_8_class)
			elseif l_name.same_class_name (tokens.character_8_class_name) then
				check_builtin_sized_character_procedure_validity (a_feature, tokens.builtin_character_8_class)
			elseif l_name.same_class_name (tokens.character_32_ref_class_name) then
				check_builtin_sized_character_ref_procedure_validity (a_feature, current_universe.character_32_type, tokens.builtin_character_32_class)
			elseif l_name.same_class_name (tokens.character_32_class_name) then
				check_builtin_sized_character_procedure_validity (a_feature, tokens.builtin_character_32_class)
			elseif l_name.same_class_name (tokens.boolean_ref_class_name) then
				check_builtin_boolean_ref_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.boolean_class_name) then
				check_builtin_boolean_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.pointer_ref_class_name) then
				check_builtin_pointer_ref_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.pointer_class_name) then
				check_builtin_pointer_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.arguments_32_class_name) then
				check_builtin_arguments_32_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.memory_class_name) then
				check_builtin_memory_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.identified_routines_class_name) then
				check_builtin_identified_routines_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.internal_class_name) then
				check_builtin_internal_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.platform_class_name) then
				check_builtin_platform_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.procedure_class_name) then
				check_builtin_procedure_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.function_class_name) then
				check_builtin_function_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.tuple_class_name) then
				check_builtin_tuple_procedure_validity (a_feature)
			elseif l_name.same_class_name (tokens.integer_8_ref_class_name) then
				check_builtin_sized_integer_ref_procedure_validity (a_feature, current_universe.integer_8_type, tokens.builtin_integer_8_class)
			elseif l_name.same_class_name (tokens.integer_8_class_name) then
				check_builtin_sized_integer_procedure_validity (a_feature, tokens.builtin_integer_8_class)
			elseif l_name.same_class_name (tokens.integer_16_ref_class_name) then
				check_builtin_sized_integer_ref_procedure_validity (a_feature, current_universe.integer_16_type, tokens.builtin_integer_16_class)
			elseif l_name.same_class_name (tokens.integer_16_class_name) then
				check_builtin_sized_integer_procedure_validity (a_feature, tokens.builtin_integer_16_class)
			elseif l_name.same_class_name (tokens.integer_32_ref_class_name) then
				check_builtin_sized_integer_ref_procedure_validity (a_feature, current_universe.integer_32_type, tokens.builtin_integer_32_class)
			elseif l_name.same_class_name (tokens.integer_32_class_name) then
				check_builtin_sized_integer_procedure_validity (a_feature, tokens.builtin_integer_32_class)
			elseif l_name.same_class_name (tokens.integer_64_ref_class_name) then
				check_builtin_sized_integer_ref_procedure_validity (a_feature, current_universe.integer_64_type, tokens.builtin_integer_64_class)
			elseif l_name.same_class_name (tokens.integer_64_class_name) then
				check_builtin_sized_integer_procedure_validity (a_feature, tokens.builtin_integer_64_class)
			elseif l_name.same_class_name (tokens.natural_8_ref_class_name) then
				check_builtin_sized_integer_ref_procedure_validity (a_feature, current_universe.natural_8_type, tokens.builtin_natural_8_class)
			elseif l_name.same_class_name (tokens.natural_8_class_name) then
				check_builtin_sized_integer_procedure_validity (a_feature, tokens.builtin_natural_8_class)
			elseif l_name.same_class_name (tokens.natural_16_ref_class_name) then
				check_builtin_sized_integer_ref_procedure_validity (a_feature, current_universe.natural_16_type, tokens.builtin_natural_16_class)
			elseif l_name.same_class_name (tokens.natural_16_class_name) then
				check_builtin_sized_integer_procedure_validity (a_feature, tokens.builtin_natural_16_class)
			elseif l_name.same_class_name (tokens.natural_32_ref_class_name) then
				check_builtin_sized_integer_ref_procedure_validity (a_feature, current_universe.natural_32_type, tokens.builtin_natural_32_class)
			elseif l_name.same_class_name (tokens.natural_32_class_name) then
				check_builtin_sized_integer_procedure_validity (a_feature, tokens.builtin_natural_32_class)
			elseif l_name.same_class_name (tokens.natural_64_ref_class_name) then
				check_builtin_sized_integer_ref_procedure_validity (a_feature, current_universe.natural_64_type, tokens.builtin_natural_64_class)
			elseif l_name.same_class_name (tokens.natural_64_class_name) then
				check_builtin_sized_integer_procedure_validity (a_feature, tokens.builtin_natural_64_class)
			elseif l_name.same_class_name (tokens.real_32_ref_class_name) then
				check_builtin_sized_real_ref_procedure_validity (a_feature, current_universe.real_32_type, tokens.builtin_real_32_class)
			elseif l_name.same_class_name (tokens.real_32_class_name) then
				check_builtin_sized_real_procedure_validity (a_feature, tokens.builtin_real_32_class)
			elseif l_name.same_class_name (tokens.real_64_ref_class_name) then
				check_builtin_sized_real_ref_procedure_validity (a_feature, current_universe.real_64_type, tokens.builtin_real_64_class)
			elseif l_name.same_class_name (tokens.real_64_class_name) then
				check_builtin_sized_real_procedure_validity (a_feature, tokens.builtin_real_64_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_any_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "ANY".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.standard_copy_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_copy))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'standard_copy (other: like Current)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class) then
						-- The signature should be 'standard_copy (other: like Current)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.copy_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_copy))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'copy (other: like Current)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, current_class, current_class) then
						-- The signature should be 'copy (other: like Current)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.twin_feature_name) then
					-- 'ANY.twin' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_twin))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.is_equal_feature_name) then
					-- 'ANY.is_equal' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_is_equal))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.standard_is_equal_feature_name) then
					-- 'ANY.standard_is_equal' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_is_equal))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.same_type_feature_name) then
					-- 'ANY.same_type' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_same_type))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.conforms_to_feature_name) then
					-- 'ANY.conforms_to' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_conforms_to))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.generator_feature_name) then
					-- 'ANY.generator' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_generator))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.generating_type_feature_name) then
					-- 'ANY.generating_type' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_generating_type))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.tagged_out_feature_name) then
					-- 'ANY.tagged_out' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_tagged_out))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.standard_twin_feature_name) then
					-- 'ANY.standard_twin' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_twin))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.is_deep_equal_feature_name) then
					-- 'ANY.is_deep_equal' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_is_deep_equal))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.deep_twin_feature_name) then
					-- 'ANY.deep_twin' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_deep_twin))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_type_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "TYPE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_type_type_any: ET_GENERIC_CLASS_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_formal_parameter: ET_FORMAL_PARAMETER_TYPE
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.set_boolean_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_boolean_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_boolean_field (i: INTEGER; object: G; value: BOOLEAN)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.boolean_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_boolean_field (i: INTEGER; object: G; value: BOOLEAN)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.boolean_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_boolean_field (i: INTEGER; object: G; value: BOOLEAN)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.boolean_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'set_boolean_field (i: INTEGER; object: G; value: BOOLEAN)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.boolean_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_character_8_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_character_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_character_8_field (i: INTEGER; object: G; value: CHARACTER_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_8_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_character_8_field (i: INTEGER; object: G; value: CHARACTER_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_8_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_character_8_field (i: INTEGER; object: G; value: CHARACTER_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_8_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.character_8_type, current_class, current_class) then
						-- The signature should be 'set_character_8_field (i: INTEGER; object: G; value: CHARACTER_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_8_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_character_32_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_character_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_character_32_field (i: INTEGER; object: G; value: CHARACTER_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_32_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_character_32_field (i: INTEGER; object: G; value: CHARACTER_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_32_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_character_32_field (i: INTEGER; object: G; value: CHARACTER_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_32_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.character_32_type, current_class, current_class) then
						-- The signature should be 'set_character_32_field (i: INTEGER; object: G; value: CHARACTER_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.character_32_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_integer_8_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_integer_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_integer_8_field (i: INTEGER; object: G; value: INTEGER_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_8_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_integer_8_field (i: INTEGER; object: G; value: INTEGER_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_8_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_integer_8_field (i: INTEGER; object: G; value: INTEGER_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_8_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.integer_8_type, current_class, current_class) then
						-- The signature should be 'set_integer_8_field (i: INTEGER; object: G; value: INTEGER_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_8_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_integer_16_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_integer_16_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_integer_16_field (i: INTEGER; object: G; value: INTEGER_16)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_16_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_integer_16_field (i: INTEGER; object: G; value: INTEGER_16)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_16_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_integer_16_field (i: INTEGER; object: G; value: INTEGER_16)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_16_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.integer_16_type, current_class, current_class) then
						-- The signature should be 'set_integer_16_field (i: INTEGER; object: G; value: INTEGER_16)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_16_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_integer_32_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_integer_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_integer_32_field (i: INTEGER; object: G; value: INTEGER_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_32_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_integer_32_field (i: INTEGER; object: G; value: INTEGER_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_32_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_integer_32_field (i: INTEGER; object: G; value: INTEGER_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_32_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.integer_32_type, current_class, current_class) then
						-- The signature should be 'set_integer_32_field (i: INTEGER; object: G; value: INTEGER_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_32_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_integer_64_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_integer_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_integer_64_field (i: INTEGER; object: G; value: INTEGER_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_64_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_integer_64_field (i: INTEGER; object: G; value: INTEGER_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_64_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_integer_64_field (i: INTEGER; object: G; value: INTEGER_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_64_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.integer_64_type, current_class, current_class) then
						-- The signature should be 'set_integer_64_field (i: INTEGER; object: G; value: INTEGER_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.integer_64_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_natural_8_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_natural_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_natural_8_field (i: INTEGER; object: G; value: NATURAL_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_8_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_natural_8_field (i: INTEGER; object: G; value: NATURAL_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_8_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_natural_8_field (i: INTEGER; object: G; value: NATURAL_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_8_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.natural_8_type, current_class, current_class) then
						-- The signature should be 'set_natural_8_field (i: INTEGER; object: G; value: NATURAL_8)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_8_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_natural_16_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_natural_16_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_natural_16_field (i: INTEGER; object: G; value: NATURAL_16)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_16_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_natural_16_field (i: INTEGER; object: G; value: NATURAL_16)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_16_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_natural_16_field (i: INTEGER; object: G; value: NATURAL_16)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_16_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.natural_16_type, current_class, current_class) then
						-- The signature should be 'set_natural_16_field (i: INTEGER; object: G; value: NATURAL_16)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_16_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_natural_32_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_natural_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_natural_32_field (i: INTEGER; object: G; value: NATURAL_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_32_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_natural_32_field (i: INTEGER; object: G; value: NATURAL_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_32_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_natural_32_field (i: INTEGER; object: G; value: NATURAL_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_32_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.natural_32_type, current_class, current_class) then
						-- The signature should be 'set_natural_32_field (i: INTEGER; object: G; value: NATURAL_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_32_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_natural_64_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_natural_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_natural_64_field (i: INTEGER; object: G; value: NATURAL_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_64_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_natural_64_field (i: INTEGER; object: G; value: NATURAL_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_64_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_natural_64_field (i: INTEGER; object: G; value: NATURAL_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_64_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.natural_64_type, current_class, current_class) then
						-- The signature should be 'set_natural_64_field (i: INTEGER; object: G; value: NATURAL_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.natural_64_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_pointer_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_pointer_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_pointer_field (i: INTEGER; object: G; value: POINTER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.pointer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_pointer_field (i: INTEGER; object: G; value: POINTER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.pointer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_pointer_field (i: INTEGER; object: G; value: POINTER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.pointer_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.pointer_type, current_class, current_class) then
						-- The signature should be 'set_pointer_field (i: INTEGER; object: G; value: POINTER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.pointer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_real_32_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_real_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_real_32_field (i: INTEGER; object: G; value: REAL_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_32_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_real_32_field (i: INTEGER; object: G; value: REAL_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_32_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_real_32_field (i: INTEGER; object: G; value: REAL_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_32_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.real_32_type, current_class, current_class) then
						-- The signature should be 'set_real_32_field (i: INTEGER; object: G; value: REAL_32)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_32_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_real_64_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_real_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_real_64_field (i: INTEGER; object: G; value: REAL_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_64_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_real_64_field (i: INTEGER; object: G; value: REAL_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_64_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_real_64_field (i: INTEGER; object: G; value: REAL_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_64_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
						-- The signature should be 'set_real_64_field (i: INTEGER; object: G; value: REAL_64)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.real_64_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_reference_field_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_set_reference_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 3 then
						-- The signature should be 'set_reference_field (i: INTEGER; object: G; value: detachable ANY)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.detachable_any_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_reference_field (i: INTEGER; object: G; value: detachable ANY)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.detachable_any_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'set_reference_field (i: INTEGER; object: G; value: detachable ANY)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.detachable_any_type.type>>, Void)
				elseif not l_formals.formal_argument (3).type.same_syntactical_type (current_universe.detachable_any_type, current_class, current_class) then
						-- The signature should be 'set_reference_field (i: INTEGER; object: G; value: detachable ANY)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter, current_universe.detachable_any_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.base_class_name_feature_name) then
					-- 'TYPE.base_class_name' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_base_class_name))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.boolean_field_feature_name) then
					-- 'TYPE.boolean_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_boolean_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.character_8_field_feature_name) then
					-- 'TYPE.character_8_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_character_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_8_type)
			elseif a_feature.name.same_feature_name (tokens.character_32_field_feature_name) then
					-- 'TYPE.character_32_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_character_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.character_32_type)
			elseif a_feature.name.same_feature_name (tokens.default_feature_name) then
					-- 'TYPE.default' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_default))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_formal_parameter)
			elseif a_feature.name.same_feature_name (tokens.field_feature_name) then
					-- 'TYPE.field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.detachable_any_type)
			elseif a_feature.name.same_feature_name (tokens.field_count_feature_name) then
					-- 'TYPE.field_count' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_field_count))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.field_static_type_feature_name) then
					-- 'TYPE.field_static_type' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_field_static_type))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type)
			elseif a_feature.name.same_feature_name (tokens.field_type_feature_name) then
					-- 'TYPE.field_type' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_field_type))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.generating_type_feature_name) then
					-- 'TYPE.generating_type' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generating_type))
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (current_universe.type_any_type)
				create l_type_type_any.make (Void, tokens.type_class_name, l_parameters, current_universe.type_any_type.named_base_class)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, l_type_type_any)
			elseif a_feature.name.same_feature_name (tokens.generic_parameter_feature_name) then
					-- 'TYPE.generic_parameter' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generic_parameter))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.type_detachable_any_type)
			elseif a_feature.name.same_feature_name (tokens.generic_parameter_count_feature_name) then
					-- 'TYPE.generic_parameter_count' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generic_parameter_count))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.has_default_feature_name) then
					-- 'TYPE.has_default' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_has_default))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.integer_8_field_feature_name) then
					-- 'TYPE.integer_8_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_integer_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_8_type)
			elseif a_feature.name.same_feature_name (tokens.integer_16_field_feature_name) then
					-- 'TYPE.integer_16_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_integer_16_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_16_type)
			elseif a_feature.name.same_feature_name (tokens.integer_32_field_feature_name) then
					-- 'TYPE.integer_32_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_integer_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_32_type)
			elseif a_feature.name.same_feature_name (tokens.integer_64_field_feature_name) then
					-- 'TYPE.integer_64_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_integer_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.integer_64_type)
			elseif a_feature.name.same_feature_name (tokens.is_expanded_feature_name) then
					-- 'TYPE.is_expanded' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_is_expanded))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.name_feature_name) then
					-- 'TYPE.name' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_name))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.natural_8_field_feature_name) then
					-- 'TYPE.natural_8_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_natural_8_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_8_type)
			elseif a_feature.name.same_feature_name (tokens.natural_16_field_feature_name) then
					-- 'TYPE.natural_16_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_natural_16_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_16_type)
			elseif a_feature.name.same_feature_name (tokens.natural_32_field_feature_name) then
					-- 'TYPE.natural_32_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_natural_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_32_type)
			elseif a_feature.name.same_feature_name (tokens.natural_64_field_feature_name) then
					-- 'TYPE.natural_64_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_natural_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.natural_64_type)
			elseif a_feature.name.same_feature_name (tokens.pointer_field_feature_name) then
					-- 'TYPE.pointer_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_pointer_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.pointer_type)
			elseif a_feature.name.same_feature_name (tokens.real_32_field_feature_name) then
					-- 'TYPE.real_32_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_real_32_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_32_type)
			elseif a_feature.name.same_feature_name (tokens.real_64_field_feature_name) then
					-- 'TYPE.real_64_field' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_real_64_field))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type, l_formal_parameter>>, current_universe.real_64_type)
			elseif a_feature.name.same_feature_name (tokens.runtime_name_feature_name) then
					-- 'TYPE.runtime_name' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_runtime_name))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.type_id_feature_name) then
					-- 'TYPE.type_id' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_type_id))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_special_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "SPECIAL".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_formal_parameter: ET_FORMAL_PARAMETER_TYPE
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.extend_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_extend))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'extend (v: G)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_formal_parameter.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'extend (v: G)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_formal_parameter.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.make_empty_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_make_empty))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'make_empty (nb: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'make_empty (nb: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_put))
				l_formal_parameter := current_class.formal_parameter_type (1)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put (v: G; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_formal_parameter.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_formal_parameter, current_class, current_class) then
						-- The signature should be 'put (v: G; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_formal_parameter.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put (v: G; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<l_formal_parameter.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_set_count))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_count (i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'set_count (i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'SPECIAL.item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_item))
				l_formal_parameter := current_class.formal_parameter_type (1)
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, l_formal_parameter.type)
			elseif a_feature.name.same_feature_name (tokens.capacity_feature_name) then
					-- 'SPECIAL.capacity' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_capacity))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
					-- 'SPECIAL.count' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_count))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.element_size_feature_name) then
					-- 'SPECIAL.element_size' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_element_size))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.aliased_resized_area_feature_name) then
					-- 'SPECIAL.aliased_resized_area' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_aliased_resized_area))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.base_address_feature_name) then
					-- 'SPECIAL.base_address' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_base_address))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.pointer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_character_ref_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE; a_character_type: ET_CLASS_TYPE; a_builtin_class_code: INTEGER)
			-- Check validity of built-in`a_feature' from the ref class of sized `a_character_type'.
			-- `a_builtin_class_code' is the built-in code of base class of `a_character_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_character_type_not_void: a_character_type /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (c: CHARACTER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<a_character_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (a_character_type, current_class, current_class) then
						-- The signature should be 'set_item (c: CHARACTER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<a_character_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'CHARACTER_REF.item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_character_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_character_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from a sized character class whose
			-- built-in code is `a_builtin_class_code'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.code_feature_name) then
					-- 'CHARACTER.code' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_code))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.natural_32_code_feature_name) then
					-- 'CHARACTER.natural_32_code' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_natural_32_code))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_32_type)
			elseif a_feature.name.same_feature_name (tokens.to_character_8_feature_name) then
					-- 'CHARACTER.to_character_8' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_to_character_8))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_8_type)
			elseif a_feature.name.same_feature_name (tokens.to_character_32_feature_name) then
					-- 'CHARACTER.to_character_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_to_character_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_32_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_boolean_ref_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "BOOLEAN_REF".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (b: BOOLEAN)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'set_item (b: BOOLEAN)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'BOOLEAN_REF.item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_boolean_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "BOOLEAN".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.conjuncted_feature_name) or a_feature.name.same_feature_name (tokens.infix_and_feature_name) then
					-- 'BOOLEAN.conjuncted' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_and))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.conjuncted_semistrict_feature_name) or a_feature.name.same_feature_name (tokens.infix_and_then_feature_name) then
					-- 'BOOLEAN.conjuncted_seminstrict' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_and_then))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.disjuncted_feature_name) or a_feature.name.same_feature_name (tokens.infix_or_feature_name) then
					-- 'BOOLEAN.disjuncted' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_or))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.disjuncted_semistrict_feature_name) or a_feature.name.same_feature_name (tokens.infix_or_else_feature_name) then
					-- 'BOOLEAN.disjuncted_semistrict' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_or_else))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.implication_feature_name) or a_feature.name.same_feature_name (tokens.infix_implies_feature_name) then
					-- 'BOOLEAN.implication' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_implies))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.negated_feature_name) or a_feature.name.same_feature_name (tokens.prefix_not_feature_name) then
					-- 'BOOLEAN.negated' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_not))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.disjuncted_exclusive_feature_name) or a_feature.name.same_feature_name (tokens.infix_xor_feature_name) then
					-- 'BOOLEAN.disjuncted_exclusive' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_xor))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_pointer_ref_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "POINTER_REF".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (p: POINTER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.pointer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.pointer_type, current_class, current_class) then
						-- The signature should be 'set_item (p: POINTER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.pointer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'POINTER_REF.item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.pointer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_pointer_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "POINTER".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
					-- 'POINTER.plus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_plus))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.to_integer_32_feature_name) then
					-- 'POINTER.to_integer_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_to_integer_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.out_feature_name) then
					-- 'POINTER.out' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_out))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.hash_code_feature_name) then
					-- 'POINTER.hash_code' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_hash_code))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.is_default_pointer_feature_name) then
					-- 'POINTER.is_default_pointer' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_is_default_pointer))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_arguments_32_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "ARGUMENTS_32".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.argument_count_feature_name) then
					-- 'ARGUMENTS_32.argument_count' should be a function.
				a_feature.set_builtin_code (tokens.builtin_arguments_32_feature (tokens.builtin_arguments_32_argument_count))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.i_th_argument_pointer_feature_name) then
					-- 'ARGUMENTS.i_th_argument_pointer' should be a function.
				a_feature.set_builtin_code (tokens.builtin_arguments_32_feature (tokens.builtin_arguments_32_i_th_argument_pointer))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_memory_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "MEMORY".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.free_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_memory_feature (tokens.builtin_memory_free))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'free (object: ANY)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.any_type, current_class, current_class) then
						-- The signature should be 'free (object: ANY)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.argument_count_feature_name) then
					-- 'MEMORY.find_referers' should be a function.
				a_feature.set_builtin_code (tokens.builtin_memory_feature (tokens.builtin_memory_find_referers))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type, current_universe.integer_type.type>>, current_universe.special_any_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_identified_routines_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "IDENTIFIED_ROUTINES".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.eif_object_id_free_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_object_id_free))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'eif_object_id_free (an_id: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'eif_object_id_free (an_id: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.eif_id_object_feature_name) then
					-- 'IDENTIFIED_ROUTINES.eif_id_object' should be a function.
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_id_object))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.detachable_any_type)
			elseif a_feature.name.same_feature_name (tokens.eif_object_id_feature_name) then
					-- 'IDENTIFIED_ROUTINES.eif_object_id' should be a function.
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_object_id))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.any_type.type>>, current_universe.integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_internal_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "INTERNAL".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.type_of_type_feature_name) then
					-- 'INTERNAL.type_of_type' should be a function.
				a_feature.set_builtin_code (tokens.builtin_internal_feature (tokens.builtin_internal_type_of_type))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.detachable_type_detachable_any_type)
			elseif a_feature.name.same_feature_name (tokens.max_type_id_feature_name) then
					-- 'INTERNAL.max_type_id' should be a function.
				a_feature.set_builtin_code (tokens.builtin_internal_feature (tokens.builtin_internal_max_type_id))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_platform_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "PLATFORM".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.is_dotnet_feature_name) then
					-- 'PLATFORM.is_dotnet' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_dotnet))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.is_mac_feature_name) then
					-- 'PLATFORM.is_mac' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_mac))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.is_unix_feature_name) then
					-- 'PLATFORM.is_unix' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_unix))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.is_vms_feature_name) then
					-- 'PLATFORM.is_vms' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_vms))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.is_vxworks_feature_name) then
					-- 'PLATFORM.is_vxworks' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_vxworks))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.is_windows_feature_name) then
					-- 'PLATFORM.is_windows' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_windows))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.boolean_bytes_feature_name) then
					-- 'PLATFORM.boolean_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_boolean_bytes))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.character_bytes_feature_name) then
					-- 'PLATFORM.character_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_character_bytes))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.double_bytes_feature_name) then
					-- 'PLATFORM.double_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_double_bytes))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.integer_bytes_feature_name) then
					-- 'PLATFORM.integer_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_integer_bytes))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.pointer_bytes_feature_name) then
					-- 'PLATFORM.pointer_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_pointer_bytes))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.real_bytes_feature_name) then
					-- 'PLATFORM.real_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_real_bytes))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.is_scoop_capable_feature_name) then
					-- 'PLATFORM.is_scoop_capable' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_scoop_capable))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.is_thread_capable_feature_name) then
					-- 'PLATFORM.is_thread_capable' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_thread_capable))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.wide_character_bytes_feature_name) then
					-- 'PLATFORM.wide_character_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_wide_character_bytes))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_procedure_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "PROCEDURE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_open_args: ET_FORMAL_PARAMETER_TYPE
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.call_feature_name) then
				l_open_args := current_class.formal_parameter_type (2)
				a_feature.set_builtin_code (tokens.builtin_procedure_feature (tokens.builtin_procedure_call))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'call (args: detachable OPEN_ARGS)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<detachable_formal_parameter_type (l_open_args).type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type_with_type_marks (l_open_args, tokens.detachable_keyword, current_class, Void, current_class) then
						-- The signature should be 'call (args: detachable OPEN_ARGS)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<detachable_formal_parameter_type (l_open_args).type>>, Void)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_function_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)

			-- Check validity of built-in `a_feature' from class "FUNCTION".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_open_args: ET_FORMAL_PARAMETER_TYPE
			l_result_type: ET_FORMAL_PARAMETER_TYPE
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'item' should be a function.
				l_open_args := current_class.formal_parameter_type (2)
				l_result_type := current_class.formal_parameter_type (3)
				a_feature.set_builtin_code (tokens.builtin_function_feature (tokens.builtin_function_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<detachable_formal_parameter_type (l_open_args).type>>, l_result_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_tuple_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of built-in `a_feature' from class "TUPLE".
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			if a_feature.name.same_feature_name (tokens.put_boolean_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_boolean))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_boolean (v: BOOLEAN; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'put_boolean (v: BOOLEAN; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_boolean (v: BOOLEAN; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_character_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_character_8))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_character_8 (v: CHARACTER_8; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.character_8_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.character_8_type, current_class, current_class) then
						-- The signature should be 'put_character_8 (v: CHARACTER_8; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.character_8_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_character_8 (v: CHARACTER_8; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.character_8_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_character_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_character_32))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_character_32 (v: CHARACTER_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.character_32_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.character_32_type, current_class, current_class) then
						-- The signature should be 'put_character_32 (v: CHARACTER_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.character_32_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_character_32 (v: CHARACTER_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.character_32_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_integer_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_8))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_integer_8 (v: INTEGER_8; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_8_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_8_type, current_class, current_class) then
						-- The signature should be 'put_integer_8 (v: INTEGER_8; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_8_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_integer_8 (v: INTEGER_8; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_8_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_integer_16_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_16))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_integer_16 (v: INTEGER_16; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_16_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_16_type, current_class, current_class) then
						-- The signature should be 'put_integer_16 (v: INTEGER_16; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_16_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_integer_16 (v: INTEGER_16; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_16_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_integer_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_32))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_integer_32 (v: INTEGER_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_32_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_32_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_type, current_class, current_class)) then
							-- The signature should be 'put_integer_32 (v: INTEGER_32; i: INTEGER)'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_32_type.type, current_universe.integer_type.type>>, Void)
					end
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_integer_32 (v: INTEGER_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_32_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_integer_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_64))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_integer_64 (v: INTEGER_64; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_64_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.integer_64_type, current_class, current_class) then
						-- The signature should be 'put_integer_64 (v: INTEGER_64; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_64_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_integer_64 (v: INTEGER_64; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_64_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_natural_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_8))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_natural_8 (v: NATURAL_8; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_8_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.natural_8_type, current_class, current_class) then
						-- The signature should be 'put_natural_8 (v: NATURAL_8; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_8_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_natural_8 (v: NATURAL_8; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_8_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_natural_16_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_16))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_natural_16 (v: NATURAL_16; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_16_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.natural_16_type, current_class, current_class) then
						-- The signature should be 'put_natural_16 (v: NATURAL_16; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_16_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_natural_16 (v: NATURAL_16; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_16_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_natural_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_32))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_natural_32 (v: NATURAL_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_32_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.natural_32_type, current_class, current_class) then
						-- The signature should be 'put_natural_32 (v: NATURAL_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_32_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_natural_32 (v: NATURAL_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_32_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_natural_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_64))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_natural_64 (v: NATURAL_64; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_64_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.natural_64_type, current_class, current_class) then
						-- The signature should be 'put_natural_64 (v: NATURAL_64; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_64_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_natural_64 (v: NATURAL_64; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.natural_64_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_pointer_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_pointer))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_pointer (v: POINTER; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.pointer_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.pointer_type, current_class, current_class) then
						-- The signature should be 'put_pointer (v: POINTER; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.pointer_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_pointer (v: POINTER; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.pointer_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_real_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_real_32))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_real_32 (v: REAL_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_32_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.real_32_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (current_universe.real_type, current_class, current_class)) then
							-- The signature should be 'put_real_32 (v: REAL_32; i: INTEGER)'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_32_type.type, current_universe.integer_type.type>>, Void)
					end
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_real_32 (v: REAL_32; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_32_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_real_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_real_64))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_real_64 (v: REAL_64; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_64_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.real_64_type, current_class, current_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (current_universe.double_type, current_class, current_class)) then
							-- The signature should be 'put_real_64 (v: REAL_64; i: INTEGER)'.
						set_fatal_error
						error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_64_type.type, current_universe.integer_type.type>>, Void)
					end
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_real_64 (v: REAL_64; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.real_64_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_reference_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_reference))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_reference (v: detachable ANY; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.detachable_any_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.detachable_any_type, current_class, current_class) then
						-- The signature should be 'put_reference (v: detachable ANY; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.detachable_any_type.type, current_universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (current_universe.integer_type, current_class, current_class) then
						-- The signature should be 'put_reference (v: detachable ANY; i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.detachable_any_type.type, current_universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_object_comparison_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_set_object_comparison))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_object_comparison (b: BOOLEAN)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_universe.boolean_type, current_class, current_class) then
						-- The signature should be 'set_object_comparison (b: BOOLEAN)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.boolean_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.boolean_item_feature_name) then
					-- 'TUPLE.boolean_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_boolean_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.character_8_item_feature_name) then
					-- 'TUPLE.character_8_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_character_8_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.character_8_type)
			elseif a_feature.name.same_feature_name (tokens.character_32_item_feature_name) then
					-- 'TUPLE.character_32_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_character_32_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.character_32_type)
			elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
					-- 'TUPLE.count' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_count))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.integer_8_item_feature_name) then
					-- 'TUPLE.integer_8_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_8_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_8_type)
			elseif a_feature.name.same_feature_name (tokens.integer_16_item_feature_name) then
					-- 'TUPLE.integer_16_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_16_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_16_type)
			elseif a_feature.name.same_feature_name (tokens.integer_32_item_feature_name) then
					-- 'TUPLE.integer_32_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_32_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.integer_64_item_feature_name) then
					-- 'TUPLE.integer_64_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_64_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.integer_64_type)
			elseif a_feature.name.same_feature_name (tokens.item_code_feature_name) then
					-- 'TUPLE.item_code' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_item_code))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_8_type)
			elseif a_feature.name.same_feature_name (tokens.natural_8_item_feature_name) then
					-- 'TUPLE.natural_8_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_8_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_8_type)
			elseif a_feature.name.same_feature_name (tokens.natural_16_item_feature_name) then
					-- 'TUPLE.natural_16_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_16_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_16_type)
			elseif a_feature.name.same_feature_name (tokens.natural_32_item_feature_name) then
					-- 'TUPLE.natural_32_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_32_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_32_type)
			elseif a_feature.name.same_feature_name (tokens.natural_64_item_feature_name) then
					-- 'TUPLE.natural_64_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_64_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.natural_64_type)
			elseif a_feature.name.same_feature_name (tokens.object_comparison_feature_name) then
					-- 'TUPLE.object_comparison' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_object_comparison))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.pointer_item_feature_name) then
					-- 'TUPLE.pointer_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_pointer_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.pointer_type)
			elseif a_feature.name.same_feature_name (tokens.real_32_item_feature_name) then
					-- 'TUPLE.real_32_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_real_32_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.real_type)
			elseif a_feature.name.same_feature_name (tokens.real_64_item_feature_name) then
					-- 'TUPLE.real_64_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_real_64_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.reference_item_feature_name) then
					-- 'TUPLE.reference_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_reference_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, current_universe.any_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_integer_ref_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE; a_integer_type: ET_CLASS_TYPE; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from the ref class of sized `a_integer_type'.
			-- `a_builtin_class_code' is the built-in code of base class of `a_integer_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_integer_type_not_void: a_integer_type /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<a_integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (a_integer_type, current_class, current_class) then
						-- The signature should be 'set_item (i: INTEGER)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<a_integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_integer_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from a sized integer class whose
			-- built-in code is `a_builtin_class_code'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
					-- 'plus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_plus))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.minus_feature_name) or a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
					-- 'minus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_minus))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.product_feature_name) or a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
					-- 'product' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_times))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
					-- 'quotient' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_divide))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.integer_quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_div_feature_name) then
					-- 'integer_quotient' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_div))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.integer_remainder_feature_name) or a_feature.name.same_feature_name (tokens.infix_mod_feature_name) then
					-- 'integer_remainder' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_mod))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.power_feature_name) or a_feature.name.same_feature_name (tokens.infix_power_feature_name) then
					-- 'power' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_power))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.double_type.type>>, current_universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.opposite_feature_name) or a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
					-- 'opposite' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_opposite))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.identity_feature_name) or a_feature.name.same_feature_name (tokens.prefix_plus_feature_name) then
					-- 'identity' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_identity))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.is_less_feature_name) or a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
					-- 'is_less' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_lt))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.to_character_8_feature_name) then
					-- 'to_character_8' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_character_8))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_8_type)
			elseif a_feature.name.same_feature_name (tokens.to_character_32_feature_name) then
					-- 'to_character_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_character_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.character_32_type)
			elseif a_feature.name.same_feature_name (tokens.to_real_feature_name) then
					-- 'to_real' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_type)
			elseif a_feature.name.same_feature_name (tokens.to_real_32_feature_name) then
					-- 'to_real_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_type)
			elseif a_feature.name.same_feature_name (tokens.to_real_64_feature_name) then
					-- 'to_real_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real_64))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.to_double_feature_name) then
					-- 'to_double' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_double))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.as_natural_8_feature_name) then
					-- 'as_natural_8' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_8))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_8_type)
			elseif a_feature.name.same_feature_name (tokens.as_natural_16_feature_name) then
					-- 'as_natural_16' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_16))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_16_type)
			elseif a_feature.name.same_feature_name (tokens.as_natural_32_feature_name) then
					-- 'as_natural_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_32_type)
			elseif a_feature.name.same_feature_name (tokens.as_natural_64_feature_name) then
					-- 'as_natural_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_64))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.natural_64_type)
			elseif a_feature.name.same_feature_name (tokens.as_integer_8_feature_name) then
					-- 'as_integer_8' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_8))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_8_type)
			elseif a_feature.name.same_feature_name (tokens.as_integer_16_feature_name) then
					-- 'as_integer_16' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_16))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_16_type)
			elseif a_feature.name.same_feature_name (tokens.as_integer_32_feature_name) then
					-- 'as_integer_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.as_integer_64_feature_name) then
					-- 'as_integer_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_64))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_64_type)
			elseif a_feature.name.same_feature_name (tokens.bit_or_feature_name) then
					-- 'bit_or' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_or))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_and_feature_name) then
					-- 'bit_and' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_and))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_shift_left_feature_name) then
					-- 'bit_shift_left' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_shift_left))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_shift_right_feature_name) then
					-- 'bit_shift_right' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_shift_right))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.integer_type.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_xor_feature_name) then
					-- 'bit_xor' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_xor))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_not_feature_name) then
					-- 'bit_not' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_not))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_real_ref_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE; a_real_type: ET_CLASS_TYPE; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from the ref class of sized `a_real_type'.
			-- `a_builtin_class_code' is the built-in code of base class of `a_real_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_real_type_not_void: a_real_type /= Void
		local
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (r: REAL_xx)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<a_real_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (a_real_type, current_class, current_class) then
						-- The signature should be 'set_item (r: REAL_xx)'.
					set_fatal_error
					error_handler.report_gvkbs0a_error (current_class, a_feature, <<a_real_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_item))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
			elseif a_feature.name.same_feature_name (tokens.nan_feature_name) then
					-- 'nan' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_nan))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
			elseif a_feature.name.same_feature_name (tokens.negative_infinity_feature_name) then
					-- 'negative_infinity' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_negative_infinity))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
			elseif a_feature.name.same_feature_name (tokens.positive_infinity_feature_name) then
					-- 'positive_infinity' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_positive_infinity))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, a_real_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

	check_builtin_sized_real_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE; a_builtin_class_code: INTEGER)
			-- Check validity of built-in `a_feature' from a sized real class whose
			-- built-in code is `a_builtin_class_code'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- List function names first, then procedure names.
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
					-- 'plus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_plus))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.minus_feature_name) or a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
					-- 'minus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_minus))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.product_feature_name) or a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
					-- 'product' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_times))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
					-- 'quotient' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_divide))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.power_feature_name) or a_feature.name.same_feature_name (tokens.infix_power_feature_name) then
					-- 'power' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_power))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<current_universe.double_type.type>>, current_universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.opposite_feature_name) or a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
					-- 'opposite' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_opposite))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.identity_feature_name) or a_feature.name.same_feature_name (tokens.prefix_plus_feature_name) then
					-- 'identity' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_identity))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.is_less_feature_name) or a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
					-- 'is_less' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_lt))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, <<tokens.like_current.type>>, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.is_nan_feature_name) then
					-- 'is_nan' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_is_nan))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.is_negative_infinity_feature_name) then
					-- 'is_negative_infinity' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_is_negative_infinity))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.is_positive_infinity_feature_name) then
					-- 'is_positive_infinity' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_is_positive_infinity))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.boolean_type)
			elseif a_feature.name.same_feature_name (tokens.truncated_to_integer_feature_name) then
					-- 'truncated_to_integer' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_integer))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.truncated_to_integer_64_feature_name) then
					-- 'truncated_to_integer_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_integer_64))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.integer_64_type)
			elseif a_feature.name.same_feature_name (tokens.truncated_to_real_feature_name) then
					-- 'truncated_to_real' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_real))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
			elseif a_feature.name.same_feature_name (tokens.to_double_feature_name) then
					-- 'to_double' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_to_double))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.ceiling_real_32_feature_name) then
					-- 'ceiling_real_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_ceiling_real_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
			elseif a_feature.name.same_feature_name (tokens.ceiling_real_64_feature_name) then
					-- 'ceiling_real_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_ceiling_real_64))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
			elseif a_feature.name.same_feature_name (tokens.floor_real_32_feature_name) then
					-- 'floor_real_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_floor_real_32))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_32_type)
			elseif a_feature.name.same_feature_name (tokens.floor_real_64_feature_name) then
					-- 'floor_real_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_floor_real_64))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.real_64_type)
			elseif a_feature.name.same_feature_name (tokens.out_feature_name) then
					-- 'out' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_out))
				set_fatal_error
				error_handler.report_gvkbs0a_error (current_class, a_feature, Void, current_universe.string_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error
					error_handler.report_gvkbu1a_error (current_class, a_feature)
				end
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		do
			check_external_function_validity (a_feature)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		do
			check_external_procedure_validity (a_feature)
		end

feature {NONE} -- Implementation

	detachable_formal_parameter_type (a_formal_parameter: ET_FORMAL_PARAMETER_TYPE): ET_FORMAL_PARAMETER_TYPE
			-- Detachable version of formal generic paramater `a_formal_parameter'
		require
			a_formal_parameter_not_void: a_formal_parameter /= Void
		do
			create Result.make (tokens.detachable_keyword, a_formal_parameter.name, a_formal_parameter.index, a_formal_parameter.implementation_class)
		ensure
			detachable_formal_parameter_type_not_void: Result /= Void
			detachable_type_mark: attached Result.type_mark as l_type_mark and then l_type_mark.is_detachable_mark
			same_name: Result.name = a_formal_parameter.name
			same_index: Result.index = a_formal_parameter.index
			same_implementation_class: Result.implementation_class = a_formal_parameter.implementation_class
		end

end
