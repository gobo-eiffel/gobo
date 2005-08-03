indexing

	description:

		"Eiffel feature validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_CHECKER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_bit_constant,
			process_bracket_expression,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
			process_call_instruction,
			process_check_instruction,
			process_constant_attribute,
			process_convert_expression,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_current,
			process_current_address,
			process_debug_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_procedure,
			process_equality_expression,
			process_expression_address,
			process_external_function,
			process_external_procedure,
			process_false_constant,
			process_feature_address,
			process_hexadecimal_integer_constant,
			process_identifier,
			process_if_instruction,
			process_infix_cast_expression,
			process_infix_expression,
			process_inspect_instruction,
			process_loop_instruction,
			process_manifest_array,
			process_manifest_tuple,
			process_manifest_type,
			process_old_expression,
			process_once_function,
			process_once_manifest_string,
			process_once_procedure,
			process_parenthesized_expression,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_result,
			process_result_address,
			process_retry_instruction,
			process_semicolon_symbol,
			process_special_manifest_string,
			process_static_call_expression,
			process_static_call_instruction,
			process_strip_expression,
			process_true_constant,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_unique_attribute,
			process_verbatim_string,
			process_void
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

create

	make

create {ET_FEATURE_CHECKER}

	make_from_checker

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new feature validity checker.
		do
			universe := a_universe
			create type_checker.make (a_universe)
			current_class := a_universe.unknown_class
			current_type := current_class
			current_feature := dummy_feature
			feature_impl := dummy_feature
			create actual_context.make_with_capacity (current_type, 10)
			create formal_context.make_with_capacity (current_type, 10)
			create instruction_context.make_with_capacity (current_type, 10)
			create expression_context.make_with_capacity (current_type, 10)
			create assertion_context.make_with_capacity (current_type, 10)
			current_target_type := a_universe.any_class
			current_context := actual_context
		end

	make_from_checker (a_checker: like Current) is
			-- Create a new feature validity checker from `a_checker'.
		require
			a_checker_not_void: a_checker /= Void
		do
			if ANY_.same_types (Current, a_checker) then
				standard_copy (a_checker)
				current_class := universe.unknown_class
				current_type := current_class
				current_feature := dummy_feature
				feature_impl := dummy_feature
				create actual_context.make_with_capacity (current_type, 10)
				create formal_context.make_with_capacity (current_type, 10)
				create instruction_context.make_with_capacity (current_type, 10)
				create expression_context.make_with_capacity (current_type, 10)
				create assertion_context.make_with_capacity (current_type, 10)
				current_target_type := universe.any_class
				current_context := actual_context
			else
				make (a_checker.universe)
			end
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last feature?

	implementation_checked (a_feature: ET_FEATURE): BOOLEAN is
			-- Has the implementation of `a_feature' been checked?
		require
			a_feature_not_void: a_feature /= Void
		do
			if in_assertion then
				Result := a_feature.implementation_feature.assertions_checked
			else
				Result := a_feature.implementation_feature.implementation_checked
			end
		end

	has_implementation_error (a_feature: ET_FEATURE): BOOLEAN is
			-- Has a fatal error occurred during checking
			-- of implementation of `a_feature'?
		require
			a_feature_not_void: a_feature /= Void
		do
			if in_assertion then
				Result := a_feature.implementation_feature.has_assertions_error
			else
				Result := a_feature.implementation_feature.has_implementation_error
			end
		end

feature -- Validity checking

	check_feature_validity (a_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_feature' in `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
		local
			old_feature: ET_FEATURE
			old_feature_impl: ET_FEATURE
			old_class: ET_CLASS
			old_type: ET_BASE_TYPE
			a_current_class: ET_CLASS
			a_feature_impl: ET_FEATURE
			a_class_impl: ET_CLASS
		do
			has_fatal_error := False
				-- First, make sure that the interface of `a_current_type' is valid.
			a_current_class := a_current_type.direct_base_class (universe)
			a_current_class.process (universe.interface_checker)
			if not a_current_class.interface_checked or else a_current_class.has_interface_error then
				set_fatal_error
			else
					-- Check that this feature has already been checked in the
					-- context of its implementation class.
				a_class_impl := a_feature.implementation_class
				if a_class_impl /= a_current_type then
					a_feature_impl := a_feature.implementation_feature
					if a_feature_impl.implementation_checked then
						if a_feature_impl.has_implementation_error then
							set_fatal_error
						end
					else
						check_feature_validity (a_feature_impl, a_class_impl)
					end
				end
				if not has_fatal_error then
					old_feature_impl := feature_impl
					feature_impl := a_feature
					old_feature := current_feature
					current_feature := a_feature
					old_class := current_class
					current_class := a_current_class
					old_type := current_type
					current_type := a_current_type
					internal_call := True
					a_feature.process (Current)
					if internal_call then
							-- Internal error.
						internal_call := False
						set_fatal_error
						error_handler.report_giabr_error
					end
					if current_type = a_class_impl then
						a_feature.set_implementation_checked
						if has_fatal_error then
							a_feature.set_implementation_error
						end
					end
					current_class := old_class
					current_type := old_type
					current_feature := old_feature
					feature_impl := old_feature_impl
				end
			end
		end

	check_precursor_feature_validity (a_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_feature' which is the precursor of a feature from `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
		do
			in_precursor := True
			check_feature_validity (a_feature, a_current_type)
			in_precursor := False
		end

	check_instructions_validity (a_compound: ET_COMPOUND; a_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_coumpound' in `a_current_feature' of `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_compound_not_void: a_compound /= Void
			a_feature_impl_not_void: a_feature_impl /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			-- implementation_checked: if inherited, then `a_compound' has already been checked in implementation class of `a_feature_impl'
		local
			old_feature: ET_FEATURE
			old_feature_impl: ET_FEATURE
			old_class: ET_CLASS
			old_type: ET_BASE_TYPE
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
			old_feature_impl := feature_impl
			feature_impl := a_feature_impl
			old_feature := current_feature
			current_feature := a_current_feature
			old_type := current_type
			current_type := a_current_type
			old_class := current_class
			current_class := a_current_type.direct_base_class (universe)
			nb := a_compound.count
			from i := 1 until i > nb loop
				has_fatal_error := False
				in_instruction := True
				internal_call := True
				a_compound.item (i).process (Current)
				if internal_call then
						-- Internal error.
					internal_call := False
					set_fatal_error
					error_handler.report_giaaz_error
				end
				if in_instruction then
						-- Internal error.
					in_instruction := False
					set_fatal_error
					error_handler.report_giady_error
				end
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
			current_class := old_class
			current_type := old_type
			current_feature := old_feature
			feature_impl := old_feature_impl
		end

	check_rescue_validity (a_compound: ET_COMPOUND; a_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_coumpound' in rescue clause of `a_current_feature' of `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_compound_not_void: a_compound /= Void
			a_feature_impl_not_void: a_feature_impl /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			-- implementation_checked: if inherited, then `a_compound' has already been checked in implementation class of `a_feature_impl'
		do
			in_rescue := True
			check_instructions_validity (a_compound, a_feature_impl, a_current_feature, a_current_type)
			in_rescue := False
		end

	check_expression_validity (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_target_type: ET_TYPE_CONTEXT; a_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `an_expression' (whose target is of type
			-- `a_target_type') in `a_current_feature' of `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred. Otherwise
			-- the type of `an_expression' is appended to `a_context'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
			a_feature_impl_not_void: a_feature_impl /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			-- implementation_checked: if inherited, then `an_expression' has already been checked in implementation class of `a_feature_impl'
		local
			old_feature: ET_FEATURE
			old_feature_impl: ET_FEATURE
			old_class: ET_CLASS
			old_type: ET_BASE_TYPE
			old_context: ET_NESTED_TYPE_CONTEXT
			old_target_type: ET_TYPE_CONTEXT
		do
			has_fatal_error := False
			old_feature_impl := feature_impl
			feature_impl := a_feature_impl
			old_feature := current_feature
			current_feature := a_current_feature
			old_type := current_type
			current_type := a_current_type
			old_class := current_class
			current_class := a_current_type.direct_base_class (universe)
			old_target_type := current_target_type
			current_target_type := a_target_type
			old_context := current_context
			current_context := a_context
			internal_call := True
			an_expression.process (Current)
			if internal_call then
					-- Internal error.
				internal_call := False
				set_fatal_error
				error_handler.report_giaaj_error
			end
			if not has_fatal_error then
				universe.report_expression_supplier (a_context, current_class, current_feature)
			end
			current_class := old_class
			current_type := old_type
			feature_impl := old_feature_impl
			current_feature := old_feature
			current_context := old_context
			current_target_type := old_target_type
		end

	check_actual_arguments_validity (an_actuals: ET_ACTUAL_ARGUMENTS; a_context: ET_NESTED_TYPE_CONTEXT;
		a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS;
		a_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check actual arguments validity when calling `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_context_not_void: a_context /= Void
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_impl_not_void: a_feature_impl /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			-- implementation_checked: if inherited, then `an_actuals' have already been checked in implementation class of `a_feature_impl'
		local
			old_feature: ET_FEATURE
			old_feature_impl: ET_FEATURE
			old_class: ET_CLASS
			old_type: ET_BASE_TYPE
			a_class_impl: ET_CLASS
			an_actual: ET_EXPRESSION
			an_actual_list: ET_ACTUAL_ARGUMENT_LIST
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			an_actual_named_type: ET_NAMED_TYPE
			a_formal_named_type: ET_NAMED_TYPE
			a_convert_feature: ET_CONVERT_FEATURE
			a_conversion_feature: ET_FEATURE
			a_convert_expression: ET_CONVERT_EXPRESSION
			a_convert_to_expression: ET_CONVERT_TO_EXPRESSION
			a_convert_class: ET_CLASS
			a_convert_name: ET_FEATURE_NAME
			an_expression_comma: ET_EXPRESSION_COMMA
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_formal_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			old_feature_impl := feature_impl
			feature_impl := a_feature_impl
			old_feature := current_feature
			current_feature := a_current_feature
			old_type := current_type
			current_type := a_current_type
			old_class := current_class
			current_class := a_current_type.direct_base_class (universe)
			a_formals := a_feature.arguments
			if an_actuals = Void or else an_actuals.is_empty then
				if a_formals /= Void and then not a_formals.is_empty then
					set_fatal_error
					a_class_impl := feature_impl.implementation_class
					if current_class = a_class_impl then
						if a_class /= Void then
							if a_name.is_precursor then
								error_handler.report_vdpr4a_error (current_class, a_name.precursor_keyword, a_feature, a_class)
							else
								error_handler.report_vuar1a_error (current_class, a_name, a_feature, a_class)
							end
						else
							error_handler.report_vuar1c_error (current_class, a_name, a_feature)
						end
					elseif not has_implementation_error (feature_impl) then
							-- Internal error: this error should have been reported when
							-- processing the implementation of `feature_impl' or in
							-- the feature flattener when redeclaring `a_feature' in an
							-- ancestor of `a_class' or `current_class'.
						error_handler.report_giaco_error
					end
				end
			elseif a_formals = Void or else a_formals.count /= an_actuals.count then
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if current_class = a_class_impl then
					if a_class /= Void then
						if a_name.is_precursor then
							error_handler.report_vdpr4a_error (current_class, a_name.precursor_keyword, a_feature, a_class)
						else
							error_handler.report_vuar1a_error (current_class, a_name, a_feature, a_class)
						end
					else
						error_handler.report_vuar1c_error (current_class, a_name, a_feature)
					end
				elseif not has_implementation_error (feature_impl) then
						-- Internal error: this error should have been reported when
						-- processing the implementation of `feature_impl' or in
						-- the feature flattener when redeclaring `a_feature' in an
						-- ancestor of `a_class' or `current_class'.
					error_handler.report_giacp_error
				end
			else
				actual_context.reset (current_type)
				l_formal_context := a_context
				l_formal_type := tokens.like_current
				nb := an_actuals.count
				from i := 1 until i > nb loop
					an_actual := an_actuals.actual_argument (i)
					a_formal := a_formals.formal_argument (i)
					l_formal_context.force_last (a_formal.type)
					check_expression_validity (an_actual, actual_context, l_formal_context, feature_impl, current_feature, current_type)
					if has_fatal_error then
						had_error := True
					elseif not actual_context.conforms_to_type (l_formal_type, l_formal_context, universe) then
						a_class_impl := feature_impl.implementation_class
						if current_class /= a_class_impl then
								-- Convertibility should be resolved in the implementation class.
							a_convert_feature := Void
						elseif an_actual_list /= Void then
							a_convert_feature := type_checker.convert_feature (actual_context, l_formal_context)
						else
							an_actual_list ?= an_actuals
							if an_actual_list /= Void then
								a_convert_feature := type_checker.convert_feature (actual_context, l_formal_context)
							end
						end
						if a_convert_feature /= Void then
							if a_convert_feature.is_convert_from then
								a_convert_class := l_formal_context.base_class (universe)
							elseif a_convert_feature.is_convert_to then
								a_convert_class := actual_context.base_class (universe)
							else
								a_convert_class := Void
							end
							if a_convert_class /= Void then
								a_convert_class.process (universe.feature_flattener)
								if not a_convert_class.features_flattened or else a_convert_class.has_flattening_error then
										-- Error already reported by the feature flattener.
									had_error := True
									set_fatal_error
									a_convert_feature := Void
								end
							end
							if a_convert_feature /= Void then
									-- Insert the conversion feature call in the AST.
								if a_convert_feature.is_convert_to then
									create a_convert_to_expression.make (an_actual, a_convert_feature)
									a_convert_expression := a_convert_to_expression
									a_convert_name := a_convert_feature.name
									a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
									if a_conversion_feature /= Void then
										report_qualified_call_expression (a_convert_to_expression, actual_context, a_conversion_feature)
									else
											-- Internal error: the seed of the convert feature should correspond
											-- to a feature of `a_convert_class'.
										set_fatal_error
										error_handler.report_gibds_error
									end
								elseif a_convert_feature.is_convert_from then
									create a_convert_expression.make (an_actual, a_convert_feature)
									a_convert_name := a_convert_feature.name
									a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
									if a_conversion_feature /= Void then
										report_creation_expression (a_convert_expression, actual_context.named_type (universe), a_conversion_feature, an_actual)
									else
											-- Internal error: the seed of the convert feature should correspond
											-- to a feature of `a_convert_class'.
										set_fatal_error
										error_handler.report_giban_error
									end
								else
									create a_convert_expression.make (an_actual, a_convert_feature)
									a_convert_expression.set_index (an_actual.index)
								end
								an_expression_comma ?= an_actual_list.item (i)
								if an_expression_comma /= Void then
									an_expression_comma.set_expression (a_convert_expression)
								else
									an_actual_list.put (a_convert_expression, i)
								end
							end
						elseif
							current_class /= a_class_impl and
							(current_class = universe.boolean_class or
							current_class = universe.character_class or
							current_class = universe.wide_character_class or
							current_class = universe.integer_class or
							current_class = universe.integer_8_class or
							current_class = universe.integer_16_class or
							current_class = universe.integer_32_class or
							current_class = universe.integer_64_class or
							current_class = universe.natural_class or
							current_class = universe.natural_8_class or
							current_class = universe.natural_16_class or
							current_class = universe.natural_32_class or
							current_class = universe.natural_64_class or
							current_class = universe.real_class or
							current_class = universe.double_class or
							current_class = universe.pointer_class or
							current_class = universe.typed_pointer_class)
						then
							-- Compatibility with ISE 5.6.0610.
						else
							had_error := True
							set_fatal_error
							an_actual_named_type := actual_context.named_type (universe)
							a_formal_named_type := l_formal_context.named_type (universe)
							if a_class /= Void then
								if a_name.is_precursor then
									if current_class = a_class_impl then
										error_handler.report_vdpr4c_error (current_class, a_name.precursor_keyword, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
									else
										error_handler.report_vdpr4d_error (current_class, a_class_impl, a_name.precursor_keyword, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
									end
								else
									if current_class = a_class_impl then
										error_handler.report_vuar2a_error (current_class, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
									else
										error_handler.report_vuar2b_error (current_class, a_class_impl, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
									end
								end
							else
								if current_class = a_class_impl then
									error_handler.report_vuar2c_error (current_class, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
								else
									error_handler.report_vuar2d_error (current_class, a_class_impl, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
								end
							end
						end
					end
					l_formal_context.remove_last
					actual_context.wipe_out
					i := i + 1
				end
				if had_error then
					set_fatal_error
				end
			end
			current_class := old_class
			current_type := old_type
			current_feature := old_feature
			feature_impl := old_feature_impl
		end

	check_preconditions_validity (a_preconditions: ET_PRECONDITIONS;
		a_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_preconditions' of `a_current_feature' in `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_preconditions_not_void: a_preconditions /= Void
			a_feature_impl_not_void: a_feature_impl /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
		local
			old_feature: ET_FEATURE
			old_feature_impl: ET_FEATURE
			old_class: ET_CLASS
			old_type: ET_BASE_TYPE
			a_current_class: ET_CLASS
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			i, nb: INTEGER
			an_expression: ET_EXPRESSION
			boolean_type: ET_CLASS_TYPE
			a_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- First, make sure that the interface of `a_current_type' is valid.
			a_current_class := a_current_type.direct_base_class (universe)
			a_current_class.process (universe.interface_checker)
			if not a_current_class.interface_checked or else a_current_class.has_interface_error then
				set_fatal_error
			else
				a_class_impl := a_feature_impl.implementation_class
				if a_class_impl /= a_current_class then
					a_feature := a_feature_impl.implementation_feature
					if a_feature.assertions_checked then
						if a_feature.has_assertions_error then
							set_fatal_error
						end
					else
						check_preconditions_validity (a_preconditions, a_feature, a_feature, a_class_impl)
					end
				end
				if not has_fatal_error then
					old_feature_impl := feature_impl
					feature_impl := a_feature_impl
					old_feature := current_feature
					current_feature := a_current_feature
					old_type := current_type
					current_type := a_current_type
					old_class := current_class
					current_class := a_current_class
					in_assertion := True
					in_precondition := True
					boolean_type := universe.boolean_class
					assertion_context.set_root_context (current_type)
					nb := a_preconditions.count
					from i := 1 until i > nb loop
						an_expression := a_preconditions.assertion (i).expression
						if an_expression /= Void then
							check_expression_validity (an_expression, assertion_context, boolean_type, feature_impl, current_feature, current_type)
							if has_fatal_error then
								had_error := True
							elseif not assertion_context.same_named_type (boolean_type, current_type, universe) then
								had_error := True
								set_fatal_error
								a_named_type := assertion_context.named_type (universe)
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
								else
									error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
								end
							end
							assertion_context.wipe_out
						end
						i := i + 1
					end
					if had_error then
						set_fatal_error
					end
					in_assertion := False
					in_precondition := False
					current_class := old_class
					current_type := old_type
					current_feature := old_feature
					feature_impl := old_feature_impl
				end
			end
		end

	check_postconditions_validity (a_postconditions: ET_POSTCONDITIONS;
		a_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_postconditions' of `a_current_feature' in `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_postconditions_not_void: a_postconditions /= Void
			a_feature_impl_not_void: a_feature_impl /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
		local
			old_feature: ET_FEATURE
			old_feature_impl: ET_FEATURE
			old_class: ET_CLASS
			old_type: ET_BASE_TYPE
			a_current_class: ET_CLASS
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			i, nb: INTEGER
			an_expression: ET_EXPRESSION
			boolean_type: ET_CLASS_TYPE
			a_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- First, make sure that the interface of `a_current_type' is valid.
			a_current_class := a_current_type.direct_base_class (universe)
			a_current_class.process (universe.interface_checker)
			if not a_current_class.interface_checked or else a_current_class.has_interface_error then
				set_fatal_error
			else
				a_class_impl := a_feature_impl.implementation_class
				if a_class_impl /= a_current_class then
					a_feature := a_feature_impl.implementation_feature
					if a_feature.assertions_checked then
						if a_feature.has_assertions_error then
							set_fatal_error
						end
					else
						check_postconditions_validity (a_postconditions, a_feature, a_feature, a_class_impl)
					end
				end
				if not has_fatal_error then
					old_feature_impl := feature_impl
					feature_impl := a_feature_impl
					old_feature := current_feature
					current_feature := a_current_feature
					old_type := current_type
					current_type := a_current_type
					old_class := current_class
					current_class := a_current_class
					in_assertion := True
					in_postcondition := True
					boolean_type := universe.boolean_class
					assertion_context.set_root_context (current_type)
					nb := a_postconditions.count
					from i := 1 until i > nb loop
						an_expression := a_postconditions.assertion (i).expression
						if an_expression /= Void then
							check_expression_validity (an_expression, assertion_context, boolean_type, feature_impl, current_feature, current_type)
							if has_fatal_error then
								had_error := True
							elseif not assertion_context.same_named_type (boolean_type, current_type, universe) then
								had_error := True
								set_fatal_error
								a_named_type := assertion_context.named_type (universe)
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
								else
									error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
								end
							end
							assertion_context.wipe_out
						end
						i := i + 1
					end
					if had_error then
						set_fatal_error
					end
					in_assertion := False
					in_postcondition := False
					current_class := old_class
					current_type := old_type
					current_feature := old_feature
					feature_impl := old_feature_impl
				end
			end
		end

	check_invariants_validity (an_invariants: ET_INVARIANTS; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `an_invariants' in `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_invariants_not_void: an_invariants /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
		local
			old_feature: ET_FEATURE
			old_feature_impl: ET_FEATURE
			old_class: ET_CLASS
			old_type: ET_BASE_TYPE
			a_current_class: ET_CLASS
			a_class_impl: ET_CLASS
			i, nb: INTEGER
			an_expression: ET_EXPRESSION
			boolean_type: ET_CLASS_TYPE
			a_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- First, make sure that the interface of `a_current_type' is valid.
			a_current_class := a_current_type.direct_base_class (universe)
			a_current_class.process (universe.interface_checker)
			if not a_current_class.interface_checked or else a_current_class.has_interface_error then
				set_fatal_error
			else
				a_class_impl := an_invariants.implementation_class
				if a_class_impl /= a_current_class then
					if an_invariants.assertions_checked then
						if an_invariants.has_assertions_error then
							set_fatal_error
						end
					else
						check_invariants_validity (an_invariants, a_class_impl)
					end
				end
				if not has_fatal_error then
					old_feature_impl := feature_impl
					feature_impl := an_invariants
					old_feature := current_feature
					current_feature := an_invariants
					old_type := current_type
					current_type := a_current_type
					old_class := current_class
					current_class := a_current_class
					in_assertion := True
					in_invariant := True
					boolean_type := universe.boolean_class
					assertion_context.set_root_context (current_type)
					nb := an_invariants.count
					from i := 1 until i > nb loop
						an_expression := an_invariants.assertion (i).expression
						if an_expression /= Void then
							check_expression_validity (an_expression, assertion_context, boolean_type, feature_impl, current_feature, current_type)
							if has_fatal_error then
								had_error := True
							elseif not assertion_context.same_named_type (boolean_type, current_type, universe) then
								had_error := True
								set_fatal_error
								a_named_type := assertion_context.named_type (universe)
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
								else
									error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
								end
							end
							assertion_context.wipe_out
						end
						i := i + 1
					end
					if had_error then
						set_fatal_error
					end
					if current_class = a_class_impl then
						an_invariants.set_assertions_checked
						if has_fatal_error then
							an_invariants.set_assertions_error
						end
					end
					in_assertion := False
					in_invariant := False
					current_class := old_class
					current_type := old_type
					current_feature := old_feature
					feature_impl := old_feature_impl
				end
			end
		end

feature {NONE} -- Feature validity

	check_attribute_validity (a_feature: ET_ATTRIBUTE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_type: ET_TYPE
		do
			has_fatal_error := False
			a_type := a_feature.type
			check_signature_type_validity (a_type)
			if not has_fatal_error then
				report_current_type_needed
				universe.report_result_supplier (a_type, current_class, a_feature)
			end
		end

	check_constant_attribute_validity (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_type: ET_TYPE
			a_constant: ET_CONSTANT
			a_class_impl: ET_CLASS
			a_bit_type: ET_BIT_TYPE
		do
			has_fatal_error := False
			a_type := a_feature.type
			check_signature_type_validity (a_type)
			if not has_fatal_error then
				universe.report_result_supplier (a_type, current_class, a_feature)
				a_constant := a_feature.constant
				if a_constant.is_boolean_constant then
					if not a_type.same_named_type (universe.boolean_class, current_type, current_type, universe) then
						set_fatal_error
						a_class_impl := a_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc1a_error (current_class, a_feature)
						else
							error_handler.report_vqmc1b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_character_constant then
					if not a_type.same_named_type (universe.character_class, current_type, current_type, universe) then
						set_fatal_error
						a_class_impl := a_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc2a_error (current_class, a_feature)
						else
							error_handler.report_vqmc2b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_integer_constant then
					if a_type.same_named_type (universe.integer_class, current_type, current_type, universe) then
						-- OK.
					elseif a_type.same_named_type (universe.integer_8_class, current_type, current_type, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.integer_16_class, current_type, current_type, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.integer_32_class, current_type, current_type, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.integer_64_class, current_type, current_type, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.natural_class, current_type, current_type, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.natural_8_class, current_type, current_type, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.natural_16_class, current_type, current_type, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.natural_32_class, current_type, current_type, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.natural_64_class, current_type, current_type, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					else
						set_fatal_error
						a_class_impl := a_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc3a_error (current_class, a_feature)
						else
							error_handler.report_vqmc3b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_real_constant then
					if a_type.same_named_type (universe.real_class, current_type, current_type, universe) then
						-- OK.
					elseif a_type.same_named_type (universe.double_class, current_type, current_type, universe) then
						-- OK.
					else
						set_fatal_error
						a_class_impl := a_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc4a_error (current_class, a_feature)
						else
							error_handler.report_vqmc4b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_string_constant then
					if
						not a_type.same_named_type (universe.string_type, current_type, current_type, universe) and
						not a_type.same_named_type (universe.string_class, current_type, current_type, universe)
					then
						set_fatal_error
						a_class_impl := a_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc5a_error (current_class, a_feature)
						else
							error_handler.report_vqmc5b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_bit_constant then
					a_bit_type ?= a_type.named_type (current_type, universe)
					if a_bit_type /= Void then
-- TODO: check bit size.
					else
						set_fatal_error
						a_class_impl := a_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc6a_error (current_class, a_feature)
						else
							error_handler.report_vqmc6b_error (current_class, a_class_impl, a_feature)
						end
					end
				else
						-- Internal error: no other kind of constant.
					set_fatal_error
					error_handler.report_giabs_error
				end
			end
		end

	check_deferred_function_validity (a_feature: ET_DEFERRED_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_formal_arguments_validity (an_arguments)
				had_error := has_fatal_error
			end
			a_type := a_feature.type
			check_signature_type_validity (a_type)
			if had_error then
				set_fatal_error
			end
			if not has_fatal_error then
				report_result_declaration (a_type)
				universe.report_result_supplier (a_type, current_class, a_feature)
			end
		end

	check_deferred_procedure_validity (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			has_fatal_error := False
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_formal_arguments_validity (an_arguments)
			end
		end

	check_do_function_validity (a_feature: ET_DO_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type: ET_TYPE
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND
			had_error: BOOLEAN
		do
			has_fatal_error := False
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_formal_arguments_validity (an_arguments)
				had_error := has_fatal_error
			end
			a_type := a_feature.type
			check_signature_type_validity (a_type)
			had_error := had_error or has_fatal_error
			if not had_error then
				report_result_declaration (a_type)
				universe.report_result_supplier (a_type, current_class, a_feature)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound, a_feature, a_feature, current_type)
					had_error := had_error or has_fatal_error
				end
				a_compound := a_feature.rescue_clause
				if a_compound /= Void then
					check_rescue_validity (a_compound, a_feature, a_feature, current_type)
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_do_procedure_validity (a_feature: ET_DO_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND
			had_error: BOOLEAN
		do
			has_fatal_error := False
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_formal_arguments_validity (an_arguments)
				had_error := has_fatal_error
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound, a_feature, a_feature, current_type)
					had_error := had_error or has_fatal_error
				end
				a_compound := a_feature.rescue_clause
				if a_compound /= Void then
					check_rescue_validity (a_compound, a_feature, a_feature, current_type)
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_external_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_formal_arguments_validity (an_arguments)
				had_error := has_fatal_error
			end
			a_type := a_feature.type
			check_signature_type_validity (a_type)
			if had_error then
				set_fatal_error
			end
			if not has_fatal_error then
				report_result_declaration (a_type)
				universe.report_result_supplier (a_type, current_class, a_feature)
			end
		end

	check_external_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			has_fatal_error := False
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_formal_arguments_validity (an_arguments)
			end
		end

	check_once_function_validity (a_feature: ET_ONCE_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type: ET_TYPE
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND
			had_error: BOOLEAN
		do
			has_fatal_error := False
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_formal_arguments_validity (an_arguments)
				had_error := has_fatal_error
			end
			a_type := a_feature.type
			check_signature_type_validity (a_type)
			had_error := had_error or has_fatal_error
			if not had_error then
				report_result_declaration (a_type)
				universe.report_result_supplier (a_type, current_class, a_feature)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound, a_feature, a_feature, current_type)
					had_error := had_error or has_fatal_error
				end
				a_compound := a_feature.rescue_clause
				if a_compound /= Void then
					check_rescue_validity (a_compound, a_feature, a_feature, current_type)
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_once_procedure_validity (a_feature: ET_ONCE_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND
			had_error: BOOLEAN
		do
			has_fatal_error := False
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_formal_arguments_validity (an_arguments)
				had_error := has_fatal_error
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound, a_feature, a_feature, current_type)
					had_error := had_error or has_fatal_error
				end
				a_compound := a_feature.rescue_clause
				if a_compound /= Void then
					check_rescue_validity (a_compound, a_feature, a_feature, current_type)
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_unique_attribute_validity (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_type: ET_TYPE
			a_class_impl: ET_CLASS
		do
			has_fatal_error := False
			a_type := a_feature.type
			check_signature_type_validity (a_type)
			if not has_fatal_error then
				universe.report_result_supplier (a_type, current_class, a_feature)
				if a_type.same_named_type (universe.integer_class, current_type, current_type, universe) then
					-- OK.
				elseif a_type.same_named_type (universe.integer_8_class, current_type, current_type, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.integer_16_class, current_type, current_type, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.integer_32_class, current_type, current_type, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.integer_64_class, current_type, current_type, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.natural_class, current_type, current_type, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.natural_8_class, current_type, current_type, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.natural_16_class, current_type, current_type, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.natural_32_class, current_type, current_type, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.natural_64_class, current_type, current_type, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				else
					set_fatal_error
					a_class_impl := a_feature.implementation_class
					if current_class = a_class_impl then
						error_handler.report_vqui0a_error (current_class, a_feature)
					else
						error_handler.report_vqui0b_error (current_class, a_class_impl, a_feature)
					end
				end
			end
		end

feature {NONE} -- Locals/Formal arguments validity

	check_formal_arguments_validity (an_arguments: ET_FORMAL_ARGUMENT_LIST) is
			-- Check validity of `an_arguments'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_arguments_not_void: an_arguments /= Void
		local
			i, nb: INTEGER
			a_type: ET_TYPE
			a_formal: ET_FORMAL_ARGUMENT
			had_error: BOOLEAN
		do
			has_fatal_error := False
			nb := an_arguments.count
			from i := 1 until i > nb loop
				a_formal := an_arguments.formal_argument (i)
				a_type := a_formal.type
				check_signature_type_validity (a_type)
				if has_fatal_error then
					had_error := True
				else
					report_formal_argument_declaration (a_formal)
					universe.report_argument_supplier (a_type, current_class, current_feature)
				end
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
		end

	check_locals_validity (a_locals: ET_LOCAL_VARIABLE_LIST) is
			-- Check validity of `a_locals'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_locals_not_void: a_locals /= Void
		local
			a_class_impl: ET_CLASS
			i, j, k, nb: INTEGER
			a_local: ET_LOCAL_VARIABLE
			other_local: ET_LOCAL_VARIABLE
			a_name: ET_IDENTIFIER
			args: ET_FORMAL_ARGUMENT_LIST
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_class_impl := feature_impl.implementation_class
			if current_class = a_class_impl then
				nb := a_locals.count
				from i := 1 until i > nb loop
					a_local := a_locals.local_variable (i)
					a_name := a_local.name
					a_name.set_local (True)
					a_name.set_seed (i)
					from j := 1 until j >= i loop
						other_local := a_locals.local_variable (j)
						if other_local.name.same_identifier (a_name) then
								-- Two local variables with the same name.
							had_error := True
							set_fatal_error
							error_handler.report_vreg0b_error (current_class, other_local, a_local, feature_impl)
						end
						j := j + 1
					end
					args := feature_impl.arguments
					if args /= Void then
						k := args.index_of (a_name)
						if k /= 0 then
								-- This local variable has the same name as a formal
								-- argument of `feature_impl' in `current_class'.
							had_error := True
							set_fatal_error
							error_handler.report_vrle2a_error (current_class, a_local, feature_impl, args.formal_argument (k))
						end
					end
					a_feature := current_class.named_feature (a_name)
					if a_feature /= Void then
							-- This local variable has the same name as the
							-- final name of a feature in `current_class'.
						had_error := True
						set_fatal_error
						error_handler.report_vrle1a_error (current_class, a_local, feature_impl, a_feature)
					end
					a_type := a_local.type
					check_local_type_validity (a_type)
					if has_fatal_error then
						had_error := True
					else
						report_local_variable_declaration (a_local)
						universe.report_local_supplier (a_type, current_class, current_feature)
					end
					i := i + 1
				end
			else
				nb := a_locals.count
				from i := 1 until i > nb loop
					a_local := a_locals.local_variable (i)
					a_type := a_local.type
					check_local_type_validity (a_type)
					if has_fatal_error then
						had_error := True
					else
						report_local_variable_declaration (a_local)
						universe.report_local_supplier (a_type, current_class, current_feature)
					end
					i := i + 1
				end
			end
			if had_error then
				set_fatal_error
			end
		end

feature {NONE} -- Type checking

	check_signature_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type' when it appears in signatures.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			a_class_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			if not in_precursor then
				type_checker.check_type_validity (a_type, feature_impl, current_type)
				if type_checker.has_fatal_error then
					set_fatal_error
				else
					if a_type.is_type_expanded (current_type, universe) then
						a_class_type ?= a_type.named_type (current_type, universe)
						if a_class_type /= Void then
							type_checker.check_creation_type_validity (a_class_type, feature_impl, current_type, a_type.position)
							if type_checker.has_fatal_error then
								set_fatal_error
							end
						end
					end
				end
			end
		end

	check_local_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type' when it appears 
			-- in local variable declarations.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			a_class_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
				-- We check the validity of the types of the local variables
				-- in their implementation class because, as opposed to the
				-- signature types, they have not been resolved (i.e. if they
				-- contain formal generic parameter, these parameters may
				-- need to be resolved in the `current_class').
			type_checker.check_type_validity (a_type, feature_impl.implementation_feature, feature_impl.implementation_class)
			if type_checker.has_fatal_error then
				set_fatal_error
			else
				if a_type.is_type_expanded (current_type, universe) then
					a_class_type ?= a_type.named_type (current_type, universe)
					if a_class_type /= Void then
						type_checker.check_creation_type_validity (a_class_type, feature_impl.implementation_feature, feature_impl.implementation_class, a_type.position)
						if type_checker.has_fatal_error then
							set_fatal_error
						end
					end
				end
			end
		end

	check_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type' when it appears in the
			-- body, assertions or rescue clause of a feature.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		do
			has_fatal_error := False
			type_checker.check_type_validity (a_type, feature_impl.implementation_feature, feature_impl.implementation_class)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

	check_creation_type_validity (a_type: ET_CLASS_TYPE; a_position: ET_POSITION) is
			-- Check validity of `a_type' as base type of a creation type
			-- in `current_type'. Note that `a_type' should already be a
			-- valid type by itself (call `check_type_validity' for that).
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_type_named_type: a_type.is_named_type
			a_position_not_void: a_position /= Void
		do
			has_fatal_error := False
			type_checker.check_creation_type_validity (a_type, feature_impl, current_type, a_position)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

	resolved_formal_parameters (a_type: ET_TYPE; a_feature_impl: ET_FEATURE; a_current_type: ET_BASE_TYPE): ET_TYPE is
			-- Replace formal generic parameters in `a_type' by their
			-- corresponding actual parameters if the class where
			-- `a_type' appears is generic and is not `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_feature_impl_not_void: a_feature_impl /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			has_fatal_error := False
			Result := type_checker.resolved_formal_parameters (a_type, a_feature_impl, a_current_type)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		ensure
			resolved_type_not_void: not has_fatal_error implies Result /= Void
		end

	type_checker: ET_TYPE_CHECKER
			-- Type checker

feature {NONE} -- Instruction validity

	check_assigner_instruction_validity (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			has_fatal_error := False
			report_current_type_needed
-- TODO:
		end

	check_assignment_validity (an_instruction: ET_ASSIGNMENT) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_target: ET_WRITABLE
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_source: ET_EXPRESSION
			a_source_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			a_source_named_type: ET_NAMED_TYPE
			a_target_named_type: ET_NAMED_TYPE
			a_convert_feature: ET_CONVERT_FEATURE
			a_conversion_feature: ET_FEATURE
			a_convert_expression: ET_CONVERT_EXPRESSION
			a_convert_to_expression: ET_CONVERT_TO_EXPRESSION
			a_convert_class: ET_CLASS
			a_convert_name: ET_FEATURE_NAME
			had_error: BOOLEAN
		do
			has_fatal_error := False
			actual_context.reset (current_type)
			a_source_context := actual_context
			formal_context.reset (current_type)
			a_target_context := formal_context
			a_target := an_instruction.target
			check_writable_validity (a_target, a_target_context)
			a_source := an_instruction.source
			if has_fatal_error then
				had_error := True
				a_target_context.wipe_out
				a_target_context.force_last (universe.any_type)
			end
			check_subexpression_validity (a_source, a_source_context, a_target_context)
			if had_error then
				set_fatal_error
			end
			if not has_fatal_error then
				a_target_type := tokens.like_current
				if not a_source_context.conforms_to_type (a_target_type, a_target_context, universe) then
					a_class_impl := feature_impl.implementation_class
					if current_class = a_class_impl then
						a_convert_feature := type_checker.convert_feature (a_source_context, a_target_context)
					else
							-- Convertibility should be resolved in the implementation class.
						a_convert_feature := Void
					end
					if a_convert_feature /= Void then
						if a_convert_feature.is_convert_from then
							a_convert_class := a_target_context.base_class (universe)
						elseif a_convert_feature.is_convert_to then
							a_convert_class := a_source_context.base_class (universe)
						else
							a_convert_class := Void
						end
						if a_convert_class /= Void then
							a_convert_class.process (universe.feature_flattener)
							if not a_convert_class.features_flattened or else a_convert_class.has_flattening_error then
									-- Error already reported by the feature flattener.
								set_fatal_error
								a_convert_feature := Void
							end
						end
						if a_convert_feature /= Void then
								-- Insert the conversion feature call in the AST.
							if a_convert_feature.is_convert_to then
								create a_convert_to_expression.make (a_source, a_convert_feature)
								a_convert_expression := a_convert_to_expression
								a_convert_name := a_convert_feature.name
								a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
								if a_conversion_feature /= Void then
									report_qualified_call_expression (a_convert_to_expression, a_source_context, a_conversion_feature)
								else
										-- Internal error: the seed of the convert feature should correspond
										-- to a feature of `a_convert_class'.
									set_fatal_error
									error_handler.report_gibdt_error
								end
							elseif a_convert_feature.is_convert_from then
								create a_convert_expression.make (a_source, a_convert_feature)
								a_convert_name := a_convert_feature.name
								a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
								if a_conversion_feature /= Void then
									report_creation_expression (a_convert_expression, a_source_context.named_type (universe), a_conversion_feature, a_source)
								else
										-- Internal error: the seed of the convert feature should correspond
										-- to a feature of `a_convert_class'.
									set_fatal_error
									error_handler.report_gibam_error
								end
							else
								create a_convert_expression.make (a_source, a_convert_feature)
								a_convert_expression.set_index (a_source.index)
							end
							an_instruction.set_source (a_convert_expression)
							report_assignment (an_instruction)
						end
					elseif
						current_class /= a_class_impl and
						(current_class = universe.boolean_class or
						current_class = universe.character_class or
						current_class = universe.wide_character_class or
						current_class = universe.integer_class or
						current_class = universe.integer_8_class or
						current_class = universe.integer_16_class or
						current_class = universe.integer_32_class or
						current_class = universe.integer_64_class or
						current_class = universe.natural_class or
						current_class = universe.natural_8_class or
						current_class = universe.natural_16_class or
						current_class = universe.natural_32_class or
						current_class = universe.natural_64_class or
						current_class = universe.real_class or
						current_class = universe.double_class or
						current_class = universe.pointer_class)
					then
						-- Compatibility with ISE 5.6.0610.
					else
						set_fatal_error
						a_source_named_type := a_source_context.named_type (universe)
						a_target_named_type := a_target_context.named_type (universe)
						if current_class = a_class_impl then
							error_handler.report_vjar0a_error (current_class, an_instruction, a_source_named_type, a_target_named_type)
						else
							error_handler.report_vjar0b_error (current_class, a_class_impl, an_instruction, a_source_named_type, a_target_named_type)
						end
					end
				else
					report_assignment (an_instruction)
				end
			end
		end

	check_assignment_attempt_validity (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_target: ET_WRITABLE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_source: ET_EXPRESSION
			a_source_context: ET_NESTED_TYPE_CONTEXT
			a_target_named_type: ET_NAMED_TYPE
			a_class_impl: ET_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			actual_context.reset (current_type)
			a_source_context := actual_context
			formal_context.reset (current_type)
			a_target_context := formal_context
			a_target := an_instruction.target
			check_writable_validity (a_target, a_target_context)
			if has_fatal_error then
				had_error := True
				a_target_context.wipe_out
				a_target_context.force_last (universe.any_type)
			elseif not universe.is_dotnet and not a_target_context.is_type_reference (universe) then
					-- Assignment attempts with expanded sources 
					-- are allowed in Eiffel for .NET.
				a_class_impl := feature_impl.implementation_class
				if current_class = a_class_impl then
					had_error := True
					set_fatal_error
					a_target_named_type := a_target_context.named_type (universe)
					error_handler.report_vjrv0a_error (current_class, a_target, a_target_named_type)
				elseif a_class_impl /= universe.any_class or else not error_handler.is_ise then
						-- Note: Do not report this error if the assignment
						-- attempt appears in class ANY because of a design
						-- bug in ISE's class ANY.
					had_error := True
					set_fatal_error
					a_target_named_type := a_target_context.named_type (universe)
					error_handler.report_vjrv0b_error (current_class, a_class_impl, a_target, a_target_named_type)
				end
			end
			a_source := an_instruction.source
			check_subexpression_validity (a_source, a_source_context, a_target_context)
			if had_error then
				set_fatal_error
			end
			if not has_fatal_error then
				report_assignment_attempt (an_instruction)
			end
		end

	check_bang_instruction_validity (an_instruction: ET_BANG_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			check_creation_instruction_validity (an_instruction)
		end

	check_call_instruction_validity (an_instruction: ET_CALL_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			instruction_context.reset (current_type)
			if an_instruction.is_qualified_call then
				check_qualified_call_validity (an_instruction, instruction_context)
			else
				check_unqualified_call_validity (an_instruction, False, instruction_context)
			end
		end

	check_check_instruction_validity (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			i, nb: INTEGER
			an_expression: ET_EXPRESSION
			boolean_type: ET_CLASS_TYPE
			a_class_impl: ET_CLASS
			a_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			boolean_type := universe.boolean_class
			actual_context.reset (current_type)
			nb := an_instruction.count
			from i := 1 until i > nb loop
				an_expression := an_instruction.assertion (i).expression
				check_subexpression_validity (an_expression, actual_context, boolean_type)
				if has_fatal_error then
					had_error := True
				elseif not actual_context.same_named_type (boolean_type, current_type, universe) then
					set_fatal_error
					had_error := True
					a_named_type := actual_context.named_type (universe)
					a_class_impl := feature_impl.implementation_class
					if current_class = a_class_impl then
						error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
					else
						error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
					end
				end
				actual_context.wipe_out
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
		end

	check_create_instruction_validity (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			check_creation_instruction_validity (an_instruction)
		end

	check_creation_instruction_validity (an_instruction: ET_CREATION_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_creation_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_creation_named_type: ET_NAMED_TYPE
			a_target_named_type: ET_NAMED_TYPE
			a_formal_parameter_type: ET_FORMAL_PARAMETER_TYPE
			a_formal_parameter: ET_FORMAL_PARAMETER
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			a_creator: ET_CONSTRAINT_CREATOR
			an_index: INTEGER
			a_class_type: ET_CLASS_TYPE
			a_feature: ET_FEATURE
			l_target: ET_WRITABLE
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			l_explicit_creation_type: ET_TYPE
			l_explicit_creation_context: ET_NESTED_TYPE_CONTEXT
			a_seed: INTEGER
			a_call: ET_QUALIFIED_CALL
			a_name: ET_FEATURE_NAME
			a_position: ET_POSITION
			had_error: BOOLEAN
			l_result: ET_RESULT
			l_type: ET_TYPE
			l_identifier: ET_IDENTIFIER
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_local_seed: INTEGER
		do
			has_fatal_error := False
			actual_context.reset (current_type)
			formal_context.reset (current_type)
			a_target_context := formal_context
			l_target := an_instruction.target
			l_explicit_creation_context := actual_context
			l_explicit_creation_type := an_instruction.type
			if l_explicit_creation_type /= Void then
				check_type_validity (l_explicit_creation_type)
				a_position := l_explicit_creation_type.position
					-- Check whether the creation type, as it appears in the class where
					-- this creation instruction has been written, depends on the type of
					-- the 'Current' entity.
				if not has_fatal_error and then not l_explicit_creation_type.is_base_type then
						-- The explicit creation type contains formal generic parameters
						-- or anchored types whose resolved value may vary in various
						-- descendant classes/types.
					report_current_type_needed
				end
			else
				a_position := l_target.position
					-- Check whether the creation type, as it appears in the class where
					-- this creation instruction has been written, depends on the type of
					-- the 'Current' entity.
				l_result ?= l_target
				if l_result /= Void then
						-- Use type of implementation feature because the types of the signature
						-- of `current_feature' might have been resolved for `current_class'
						-- (or for its parent class when processing precursors in the context
						-- of current class).
					l_type := current_feature.implementation_feature.type
					if l_type = Void then
						-- This error will be reported in `check_writable_validity'.
					elseif not l_type.is_base_type then
							-- The type of 'Result' contains formal generic parameters
							-- or anchored types whose resolved value may vary in various
							-- descendant classes/types.
						report_current_type_needed
					end
				else
					l_identifier ?= l_target
					if l_identifier /= Void then
						if l_identifier.is_local then
							l_local_seed := l_identifier.seed
							l_locals := feature_impl.locals
							if l_locals = Void then
								-- This error will be reported in `check_writable_validity'.
							elseif l_local_seed < 1 or l_local_seed > l_locals.count then
								-- This error will be reported in `check_writable_validity'.
							else
									-- Contrary to the types appearing in the signatures, types of
									-- local variables in the AST are those found in the implementation
									-- class of `feature_impl', i.e. not resolved yet.
								l_type := l_locals.local_variable (l_local_seed).type
								if not l_type.is_base_type then
										-- The type of the local variable contains formal generic parameters
										-- or anchored types whose resolved value may vary in various
										-- descendant classes/types.
									report_current_type_needed
								end
							end
						else
								-- This is an attribute. Its type may vary in various
								-- descendant classes/types.
							report_current_type_needed
						end
					end
				end
			end
			if not has_fatal_error then
				a_call := an_instruction.creation_call
				if a_call /= Void then
					a_name := a_call.name
					a_seed := a_name.seed
					if a_seed = 0 then
							-- We need to resolve `a_name' in the implementation
							-- class of `feature_impl' first.
						a_class_impl := feature_impl.implementation_class
						if a_class_impl /= current_class then
							set_fatal_error
							if not has_implementation_error (feature_impl) then
									-- Internal error: `a_name' should have been resolved in
									-- the implementation feature.
								error_handler.report_giacq_error
							end
						else
							check_writable_validity (l_target, a_target_context)
							if not has_fatal_error then
								a_target_type := tokens.like_current
								if l_explicit_creation_type /= Void then
									l_explicit_creation_context.force_last (l_explicit_creation_type)
									l_creation_context := l_explicit_creation_context
								else
									l_creation_context := a_target_context
								end
								a_class := l_creation_context.base_class (universe)
								a_class.process (universe.interface_checker)
								if not a_class.interface_checked or else a_class.has_interface_error then
									set_fatal_error
								else
									a_feature := a_class.named_feature (a_name)
									if a_feature /= Void then
										a_seed := a_feature.first_seed
										a_name.set_seed (a_seed)
									else
										set_fatal_error
											-- ISE Eiffel 5.4 reports this error as a VEEN,
											-- but it is in fact a VUEX-2 (ETL2 p.368).
										error_handler.report_vuex2a_error (a_class_impl, a_name, a_class)
									end
								end
							end
						end
					end
				else
					a_name := tokens.default_create_feature_name
					a_seed := universe.default_create_seed
				end
			end
			if not has_fatal_error then
				if a_feature = Void then
					check_writable_validity (l_target, a_target_context)
					if not has_fatal_error then
						a_target_type := tokens.like_current
						if l_explicit_creation_type /= Void then
							l_explicit_creation_type := resolved_formal_parameters (l_explicit_creation_type, feature_impl, current_type)
							if not has_fatal_error then
								l_explicit_creation_context.force_last (l_explicit_creation_type)
								l_creation_context := l_explicit_creation_context
							end
						else
							l_creation_context := a_target_context
						end
					end
					if not has_fatal_error then
						a_class := l_creation_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						elseif a_seed /= 0 then
							a_feature := a_class.seeded_feature (a_seed)
							if a_feature = Void then
									-- Report internal error: if we got a seed, the
									-- `a_feature' should not be void.
								set_fatal_error
								error_handler.report_giabp_error
							end
						end
					end
				end
			end
			if not has_fatal_error then
				check
					a_class_not_void: a_class /= Void
					l_creation_context_not_void: l_creation_context /= Void
				end
				if l_explicit_creation_type /= Void then
					if not l_explicit_creation_context.conforms_to_type (a_target_type, a_target_context, universe) then
						set_fatal_error
						a_creation_named_type := l_explicit_creation_context.named_type (universe)
						a_target_named_type := a_target_context.named_type (universe)
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc3a_error (current_class, an_instruction, a_creation_named_type, a_target_named_type)
						else
							error_handler.report_vgcc3b_error (current_class, a_class_impl, an_instruction, a_creation_named_type, a_target_named_type)
						end
					else
						universe.report_create_supplier (l_explicit_creation_type, current_class, current_feature)
					end
				end
				a_creation_named_type := l_creation_context.named_type (universe)
				a_class_type ?= a_creation_named_type
				if a_class_type /= Void then
					had_error := has_fatal_error
					check_creation_type_validity (a_class_type, a_position)
					if had_error then
						set_fatal_error
					end
				end
				if a_feature = Void then
					check
							-- No creation call, and feature 'default_create' not
							-- supported by the underlying Eiffel compiler.
						no_call: a_call = Void
						no_default_create: universe.default_create_seed = 0
					end
					if a_class.creators /= Void then
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc5c_error (current_class, an_instruction, a_class)
						else
							error_handler.report_vgcc5d_error (current_class, a_class_impl, an_instruction, a_class)
						end
					end
				else
					if a_feature.type /= Void then
							-- This is not a procedure.
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc6f_error (current_class, a_name, a_feature, a_class)
						elseif not has_implementation_error (feature_impl) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `feature_impl' or in
								-- the feature flattener when redeclaring procedure `a_feature'
								-- to a function in an ancestor of `a_class'.
							error_handler.report_giacr_error
						end
					end
					a_formal_parameter_type ?= a_creation_named_type
					if a_formal_parameter_type /= Void then
						an_index := a_formal_parameter_type.index
						a_formal_parameters := current_class.formal_parameters
						if a_formal_parameters = Void or else an_index > a_formal_parameters.count then
								-- Internal error: `a_formal_parameter' is supposed
								-- to be a formal parameter of `current_class'.
							set_fatal_error
							error_handler.report_giabq_error
						else
							a_formal_parameter := a_formal_parameters.formal_parameter (an_index)
							a_creator := a_formal_parameter.creation_procedures
							if a_creator = Void or else not a_creator.has_feature (a_feature) then
								set_fatal_error
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vgcc8c_error (current_class, a_name, a_feature, a_class, a_formal_parameter)
								else
									error_handler.report_vgcc8d_error (current_class, a_class_impl, a_name, a_feature, a_class, a_formal_parameter)
								end
							end
						end
					elseif not a_feature.is_creation_exported_to (current_class, a_class, universe) then
						if a_class.creators /= Void or else not a_feature.has_seed (universe.default_create_seed) then
								-- The procedure is not a creation procedure exported to `current_class'.
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vgcc6h_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vgcc6i_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
					end
					had_error := has_fatal_error
					if a_call /= Void then
						check_sub_actual_arguments_validity (a_call.arguments, l_creation_context, a_name, a_feature, a_class)
					else
						check_sub_actual_arguments_validity (Void, l_creation_context, a_name, a_feature, a_class)
					end
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						report_creation_instruction (an_instruction, a_creation_named_type, a_feature)
					end
				end
			end
		end

	check_debug_instruction_validity (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_compound: ET_COMPOUND
		do
			a_compound := an_instruction.compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, feature_impl, current_feature, current_type)
			else
				has_fatal_error := False
			end
		end

	check_if_instruction_validity (an_instruction: ET_IF_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			boolean_type: ET_CLASS_TYPE
			a_conditional: ET_EXPRESSION
			a_compound: ET_COMPOUND
			an_elseif_parts: ET_ELSEIF_PART_LIST
			an_elseif: ET_ELSEIF_PART
			i, nb: INTEGER
			had_error: BOOLEAN
			a_class_impl: ET_CLASS
			a_named_type: ET_NAMED_TYPE
		do
			has_fatal_error := False
			boolean_type := universe.boolean_class
			actual_context.reset (current_type)
			a_conditional := an_instruction.conditional.expression
			check_subexpression_validity (a_conditional, actual_context, boolean_type)
			if has_fatal_error then
				had_error := True
			elseif not actual_context.same_named_type (boolean_type, current_type, universe) then
				had_error := True
				set_fatal_error
				a_named_type := actual_context.named_type (universe)
				a_class_impl := feature_impl.implementation_class
				if current_class = a_class_impl then
					error_handler.report_vwbe0a_error (current_class, a_conditional, a_named_type)
				else
					error_handler.report_vwbe0b_error (current_class, a_class_impl, a_conditional, a_named_type)
				end
			end
			a_compound := an_instruction.then_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, feature_impl, current_feature, current_type)
				if has_fatal_error then
					had_error := True
				end
			end
			an_elseif_parts := an_instruction.elseif_parts
			if an_elseif_parts /= Void then
				nb := an_elseif_parts.count
				from i := 1 until i > nb loop
					an_elseif := an_elseif_parts.item (i)
					a_conditional := an_elseif.conditional.expression
					actual_context.reset (current_type)
					check_subexpression_validity (a_conditional, actual_context, boolean_type)
					if has_fatal_error then
						had_error := True
					elseif not actual_context.same_named_type (boolean_type, current_type, universe) then
						had_error := True
						set_fatal_error
						a_named_type := actual_context.named_type (universe)
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vwbe0a_error (current_class, a_conditional, a_named_type)
						else
							error_handler.report_vwbe0b_error (current_class, a_class_impl, a_conditional, a_named_type)
						end
					end
					a_compound := an_elseif.then_compound
					if a_compound /= Void then
						check_instructions_validity (a_compound, feature_impl, current_feature, current_type)
						if has_fatal_error then
							had_error := True
						end
					end
					i := i + 1
				end
			end
			a_compound := an_instruction.else_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, feature_impl, current_feature, current_type)
				if has_fatal_error then
					had_error := True
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_inspect_instruction_validity (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			an_expression: ET_EXPRESSION
			a_when_parts: ET_WHEN_PART_LIST
			a_when_part: ET_WHEN_PART
			a_compound: ET_COMPOUND
			i, nb: INTEGER
			had_error: BOOLEAN
			had_value_error: BOOLEAN
			a_value_context: ET_NESTED_TYPE_CONTEXT
			a_value_type: ET_TYPE
			any_type: ET_CLASS_TYPE
			a_value_named_type: ET_NAMED_TYPE
			a_class_impl: ET_CLASS
			a_choices: ET_CHOICE_LIST
			a_choice: ET_CHOICE
			a_choice_constant: ET_CHOICE_CONSTANT
			a_choice_context: ET_NESTED_TYPE_CONTEXT
			a_choice_named_type: ET_NAMED_TYPE
			j, nb2: INTEGER
			a_value_class: ET_CLASS
			a_choice_class: ET_CLASS
		do
			has_fatal_error := False
			any_type := universe.any_type
			formal_context.reset (current_type)
			a_value_context := formal_context
			an_expression := an_instruction.conditional.expression
			check_subexpression_validity (an_expression, a_value_context, any_type)
			if has_fatal_error then
				had_error := True
			elseif a_value_context.same_named_type (universe.character_class, current_type, universe) then
				-- OK.
			elseif a_value_context.same_named_type (universe.integer_class, current_type, universe) then
				-- OK.
			elseif a_value_context.same_named_type (universe.integer_8_class, current_type, universe) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif a_value_context.same_named_type (universe.integer_16_class, current_type, universe) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif a_value_context.same_named_type (universe.integer_32_class, current_type, universe) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif a_value_context.same_named_type (universe.integer_64_class, current_type, universe) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif a_value_context.same_named_type (universe.natural_class, current_type, universe) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif a_value_context.same_named_type (universe.natural_8_class, current_type, universe) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif a_value_context.same_named_type (universe.natural_16_class, current_type, universe) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif a_value_context.same_named_type (universe.natural_32_class, current_type, universe) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif a_value_context.same_named_type (universe.natural_64_class, current_type, universe) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			else
				had_error := True
				set_fatal_error
				a_value_named_type := a_value_context.named_type (universe)
				a_class_impl := feature_impl.implementation_class
				if current_class = a_class_impl then
					error_handler.report_vomb1a_error (current_class, an_expression, a_value_named_type)
				else
					error_handler.report_vomb1b_error (current_class, a_class_impl, an_expression, a_value_named_type)
				end
			end
			had_value_error := had_error
			actual_context.reset (current_type)
			a_choice_context := actual_context
			a_value_type := tokens.like_current
			a_when_parts := an_instruction.when_parts
			if a_when_parts /= Void then
				nb := a_when_parts.count
				from i := 1 until i > nb loop
					a_when_part := a_when_parts.item (i)
					a_choices := a_when_part.choices
					nb2 := a_choices.count
					from j := 1 until j > nb2 loop
						a_choice := a_choices.choice (j)
						a_choice_constant := a_choice.lower
						an_expression := a_choice_constant.expression
						check_subexpression_validity (an_expression, a_choice_context, a_value_context)
						if has_fatal_error then
							had_error := True
						elseif not had_value_error then
							if a_choice_context.same_named_type (a_value_type, a_value_context, universe) then
								-- OK.
							else
								a_value_class := a_value_context.base_class (universe)
								a_choice_class := a_choice_context.base_class (universe)
								if
									a_value_class = universe.integer_16_class and then
									a_choice_class = universe.integer_8_class
								then
									-- Valid with ISE Eiffel. To be checked with other compilers.
								elseif
									a_value_class = universe.integer_class and then
									(a_choice_class = universe.integer_8_class or
									a_choice_class = universe.integer_16_class or
									a_choice_class = universe.integer_32_class)
								then
									-- Valid with ISE Eiffel. To be checked with other compilers.
								elseif
									a_value_class = universe.integer_32_class and then
									(a_choice_class = universe.integer_8_class or
									a_choice_class = universe.integer_16_class or
									a_choice_class = universe.integer_class)
								then
									-- Valid with ISE Eiffel. To be checked with other compilers.
								elseif
									a_value_class = universe.integer_64_class and then
									(a_choice_class = universe.integer_8_class or
									a_choice_class = universe.integer_16_class or
									a_choice_class = universe.integer_32_class or
									a_choice_class = universe.integer_class)
								then
									-- Valid with ISE Eiffel. To be checked with other compilers.
								else
									had_error := True
									set_fatal_error
									a_value_named_type := a_value_context.named_type (universe)
									a_choice_named_type := a_choice_context.named_type (universe)
									a_class_impl := feature_impl.implementation_class
									if current_class = a_class_impl then
										error_handler.report_vomb2a_error (current_class, a_choice_constant, a_choice_named_type, a_value_named_type)
									else
										error_handler.report_vomb2b_error (current_class, a_class_impl, a_choice_constant, a_choice_named_type, a_value_named_type)
									end
								end
							end
						end
						a_choice_context.wipe_out
						if a_choice.is_range then
							a_choice_constant := a_choice.upper
							an_expression := a_choice_constant.expression
							check_subexpression_validity (an_expression, a_choice_context, a_value_context)
							if has_fatal_error then
								had_error := True
							elseif not had_value_error then
								if a_choice_context.same_named_type (a_value_type, a_value_context, universe) then
									-- OK.
								else
									a_value_class := a_value_context.base_class (universe)
									a_choice_class := a_choice_context.base_class (universe)
									if
										a_value_class = universe.integer_16_class and then
										a_choice_class = universe.integer_8_class
									then
										-- Valid with ISE Eiffel. To be checked with other compilers.
									elseif
										a_value_class = universe.integer_class and then
										(a_choice_class = universe.integer_8_class or
										a_choice_class = universe.integer_16_class or
										a_choice_class = universe.integer_32_class)
									then
										-- Valid with ISE Eiffel. To be checked with other compilers.
									elseif
										a_value_class = universe.integer_32_class and then
										(a_choice_class = universe.integer_8_class or
										a_choice_class = universe.integer_16_class or
										a_choice_class = universe.integer_class)
									then
										-- Valid with ISE Eiffel. To be checked with other compilers.
									elseif
										a_value_class = universe.integer_64_class and then
										(a_choice_class = universe.integer_8_class or
										a_choice_class = universe.integer_16_class or
										a_choice_class = universe.integer_32_class or
										a_choice_class = universe.integer_class)
									then
										-- Valid with ISE Eiffel. To be checked with other compilers.
									else
										had_error := True
										set_fatal_error
										a_value_named_type := a_value_context.named_type (universe)
										a_choice_named_type := a_choice_context.named_type (universe)
										a_class_impl := feature_impl.implementation_class
										if current_class = a_class_impl then
											error_handler.report_vomb2a_error (current_class, a_choice_constant, a_choice_named_type, a_value_named_type)
										else
											error_handler.report_vomb2b_error (current_class, a_class_impl, a_choice_constant, a_choice_named_type, a_value_named_type)
										end
									end
								end
							end
							a_choice_context.wipe_out
						end
						j := j + 1
-- TODO: check Unique and Constants and choice unicity.
					end
					i := i + 1
				end
					-- We need to process the compounds after the choices because
					-- `check_instructions_validity' may alter `actual_context'
					-- and `formal_context' used to check the validity of the
					-- choice values compared to the type of the inspect expression.
				from i := 1 until i > nb loop
					a_when_part := a_when_parts.item (i)
					a_compound := a_when_part.then_compound
					if a_compound /= Void then
						check_instructions_validity (a_compound, feature_impl, current_feature, current_type)
						if has_fatal_error then
							had_error := True
						end
					end
					i := i + 1
				end
			end
			a_compound := an_instruction.else_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, feature_impl, current_feature, current_type)
				if has_fatal_error then
					had_error := True
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_loop_instruction_validity (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			an_expression: ET_EXPRESSION
			a_compound: ET_COMPOUND
			had_error: BOOLEAN
			a_class_impl: ET_CLASS
			a_named_type: ET_NAMED_TYPE
			boolean_type: ET_CLASS_TYPE
			a_variant: ET_VARIANT
			an_invariant: ET_LOOP_INVARIANTS
		do
			has_fatal_error := False
			a_compound := an_instruction.from_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, feature_impl, current_feature, current_type)
				if has_fatal_error then
					had_error := True
				end
			end
			an_invariant := an_instruction.invariant_part
			if an_invariant /= Void then
				check_loop_invariant_validity (an_invariant)
				if has_fatal_error then
					had_error := True
				end
			end
			a_variant := an_instruction.variant_part
			if a_variant /= Void then
				check_loop_variant_validity (a_variant)
				if has_fatal_error then
					had_error := True
				end
			end
			actual_context.reset (current_type)
			boolean_type := universe.boolean_class
			an_expression := an_instruction.until_conditional.expression
			check_subexpression_validity (an_expression, actual_context, boolean_type)
			if has_fatal_error then
				had_error := True
			elseif not actual_context.same_named_type (boolean_type, current_type, universe) then
				had_error := True
				set_fatal_error
				a_named_type := actual_context.named_type (universe)
				a_class_impl := feature_impl.implementation_class
				if current_class = a_class_impl then
					error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
				else
					error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
				end
			end
			a_compound := an_instruction.loop_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, feature_impl, current_feature, current_type)
				if has_fatal_error then
					had_error := True
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_loop_invariant_validity (an_invariant: ET_LOOP_INVARIANTS) is
			-- Check validity of `an_invariant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_invariant_not_void: an_invariant /= Void
		local
			an_expression: ET_EXPRESSION
			had_error: BOOLEAN
			boolean_type: ET_CLASS_TYPE
			i, nb: INTEGER
			a_class_impl: ET_CLASS
			a_named_type: ET_NAMED_TYPE
		do
			has_fatal_error := False
			boolean_type := universe.boolean_class
			actual_context.reset (current_type)
			nb := an_invariant.count
			from i := 1 until i > nb loop
				an_expression := an_invariant.assertion (i).expression
				check_subexpression_validity (an_expression, actual_context, boolean_type)
				if has_fatal_error then
					had_error := True
				elseif not actual_context.same_named_type (boolean_type, current_type, universe) then
					had_error := True
					set_fatal_error
					a_named_type := actual_context.named_type (universe)
					a_class_impl := feature_impl.implementation_class
					if current_class = a_class_impl then
						error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
					else
						error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
					end
				end
				actual_context.wipe_out
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
		end

	check_loop_variant_validity (a_variant: ET_VARIANT) is
			-- Check validity of `a_variant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_variant_not_void: a_variant /= Void
		local
			an_expression: ET_EXPRESSION
			had_error: BOOLEAN
			a_class_impl: ET_CLASS
			a_named_type: ET_NAMED_TYPE
			integer_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			an_expression := a_variant.expression
			if an_expression /= Void then
				integer_type := universe.integer_class
				actual_context.reset (current_type)
				check_subexpression_validity (an_expression, actual_context, integer_type)
				if has_fatal_error then
					had_error := True
				elseif not actual_context.same_named_type (integer_type, current_type, universe) then
					had_error := True
					set_fatal_error
					a_named_type := actual_context.named_type (universe)
					a_class_impl := feature_impl.implementation_class
					if current_class = a_class_impl then
						error_handler.report_vave0a_error (current_class, an_expression, a_named_type)
					else
						error_handler.report_vave0b_error (current_class, a_class_impl, an_expression, a_named_type)
					end
				end
				actual_context.wipe_out
			else
-- TODO: syntax error.
			end
			if had_error then
				set_fatal_error
			end
		end

	check_precursor_instruction_validity (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_class_impl: ET_CLASS
		do
			if in_rescue then
					-- The Precursor instruction does not appear in a Routine_body.
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if current_class = a_class_impl then
					error_handler.report_vdpr1a_error (current_class, an_instruction)
				elseif not has_implementation_error (feature_impl) then
						-- Internal error: the VDPR-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giadj_error
				end
			else
				instruction_context.reset (current_type)
				check_precursor_validity (Void, an_instruction, instruction_context)
			end
		end

	check_retry_instruction_validity (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_class_impl: ET_CLASS
		do
			if not in_rescue then
					-- The Retry instruction does not appear in a Rescue clause.
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if a_class_impl /= current_class then
					if not has_implementation_error (feature_impl) then
							-- Internal error: the VXRT error should have been
							-- reported in the implementation feature.
						error_handler.report_giacs_error
					end
				else
					error_handler.report_vxrt0a_error (current_class, an_instruction)
				end
			else
				has_fatal_error := False
			end
		end

	check_static_call_instruction_validity (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			instruction_context.reset (current_type)
			check_static_call_validity (an_instruction, instruction_context)
		end

	check_writable_validity (a_writable: ET_WRITABLE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_writable' in `current_feature' of `current_class'.
			-- Set `has_fatal_error' is a fatal error occurred. Otherwise
			-- the type of `a_writable' is appended to `a_context'.
		require
			a_writable_not_void: a_writable /= Void
			a_context_not_void: a_context /= Void
		local
			a_result: ET_RESULT
			an_identifier: ET_IDENTIFIER
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_local: ET_LOCAL_VARIABLE
			a_seed: INTEGER
			a_class_impl: ET_CLASS
			an_attribute: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type: ET_TYPE
		do
			has_fatal_error := False
			a_result ?= a_writable
			if a_result /= Void then
					-- Use type of implementation feature because the types of the signature
					-- of `current_feature' might not have been resolved for `current_class'
					-- (when processing precursors in the context of current class).
				a_type := current_feature.implementation_feature.type
				if a_type = Void then
					set_fatal_error
					a_class_impl := feature_impl.implementation_class
					if a_class_impl = current_class then
						error_handler.report_veen2a_error (current_class, a_result, feature_impl)
					else
						if not has_implementation_error (feature_impl) then
								-- Internal error: the VEEN-2 error should have been
								-- reported in the implementation feature.
							error_handler.report_giadq_error
						end
					end
				else
					a_type := resolved_formal_parameters (a_type, current_feature, current_type)
					if not has_fatal_error then
						a_context.force_last (a_type)
						report_result_assignment_target (a_result)
					end
				end
			else
				an_identifier ?= a_writable
				if an_identifier /= Void then
					a_seed := an_identifier.seed
					if an_identifier.is_local then
						a_locals := feature_impl.locals
						if a_locals = Void then
								-- Internal error.
							set_fatal_error
							error_handler.report_giabk_error
						elseif a_seed < 1 or a_seed > a_locals.count then
								-- Internal error.
							set_fatal_error
							error_handler.report_giabl_error
						else
								-- Contrary to the types appearing in the signatures, types of
								-- local variables in the AST are those found in the implementation
								-- class of `feature_impl', and hence need to be resolved in
								-- `current_type'.
							a_local := a_locals.local_variable (a_seed)
							a_type := resolved_formal_parameters (a_local.type, feature_impl, current_type)
							if not has_fatal_error then
								a_context.force_last (a_type)
								report_local_assignment_target (an_identifier, a_local)
							end
						end
					elseif a_seed /= 0 then
						an_attribute := current_class.seeded_feature (a_seed)
						if an_attribute = Void then
								-- Internal error: if we got a seed, the
								-- `an_attribute' should not be void.
							set_fatal_error
							error_handler.report_giabm_error
						elseif not an_attribute.is_attribute then
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vjaw0a_error (current_class, an_identifier, an_attribute)
							elseif not has_implementation_error (feature_impl) then
									-- Internal error: this error should have been reported when
									-- processing the implementation `feature_impl' or in the
									-- feature flattener when redeclaring attribute `a_feature'
									-- to a non-attribute in an ancestor of `current_class'.
								error_handler.report_giabn_error
							end
						else
							a_type := an_attribute.type
							a_context.force_last (a_type)
							report_current_type_needed
							report_attribute_assignment_target (a_writable, an_attribute)
						end
					else
							-- We need to resolve `an_identifier' in the implementation
							-- class of `feature_impl' first.
						a_class_impl := feature_impl.implementation_class
						if a_class_impl /= current_class then
							set_fatal_error
							if not has_implementation_error (feature_impl) then
									-- Internal error: `an_identifier' should have been resolved in
									-- the implementation feature.
								error_handler.report_giadr_error
							end
						else
							current_class.process (universe.interface_checker)
							if not current_class.interface_checked or else current_class.has_interface_error then
								set_fatal_error
							else
								an_attribute := current_class.named_feature (an_identifier)
								if an_attribute /= Void then
									if an_attribute.is_attribute then
										a_seed := an_attribute.first_seed
										an_identifier.set_seed (a_seed)
										a_type := an_attribute.type
										a_context.force_last (a_type)
										report_current_type_needed
										report_attribute_assignment_target (a_writable, an_attribute)
									else
										set_fatal_error
										error_handler.report_vjaw0a_error (current_class, an_identifier, an_attribute)
									end
								else
									set_fatal_error
									an_arguments := feature_impl.arguments
									if an_arguments /= Void and then an_arguments.index_of (an_identifier) /= 0 then
										error_handler.report_vjaw0c_error (current_class, an_identifier, feature_impl)
									else
										error_handler.report_veen0a_error (current_class, an_identifier, feature_impl)
									end
								end
							end
						end
					end
				else
						-- Internal error: a Writable is either a result or an identifier.
					set_fatal_error
					error_handler.report_giabo_error
				end
			end
			if not has_fatal_error then
				universe.report_expression_supplier (a_context, current_class, current_feature)
			end
		end

feature {NONE} -- Expression validity

	check_bit_constant_validity (a_constant: ET_BIT_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			an_integer_constant: ET_REGULAR_INTEGER_CONSTANT
			a_type: ET_BIT_N
		do
			has_fatal_error := False
			create an_integer_constant.make ((a_constant.literal.count - 1).out)
			create a_type.make (an_integer_constant)
			a_context.force_last (a_type)
			report_bit_constant (a_constant)
		end

	check_bracket_expression_validity (an_expression: ET_BRACKET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_call_validity (an_expression, a_context)
		end

	check_c1_character_constant_validity (a_constant: ET_C1_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.character_class)
			report_character_constant (a_constant)
		end

	check_c2_character_constant_validity (a_constant: ET_C2_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.character_class)
			report_character_constant (a_constant)
		end

	check_c3_character_constant_validity (a_constant: ET_C3_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.character_class)
			report_character_constant (a_constant)
		end

	check_call_expression_validity (an_expression: ET_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			if an_expression.is_qualified_call then
				check_qualified_call_validity (an_expression, a_context)
			else
				check_unqualified_call_validity (an_expression, True, a_context)
			end
		end

	check_convert_expression_validity (an_expression: ET_CONVERT_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_convert_feature: ET_CONVERT_FEATURE
			an_actuals: ET_ACTUAL_ARGUMENTS
		do
			a_convert_feature := an_expression.convert_feature
			if a_convert_feature.is_convert_from then
				an_actuals := an_expression.expression
				check_creation_expression_validity (an_expression, current_target_type.named_type (universe),
					a_convert_feature.name, an_actuals, an_expression.position, a_context)
			else
				check_expression_validity (an_expression.expression, a_context, current_target_type, feature_impl, current_feature, current_type)
				an_expression.set_index (an_expression.expression.index)
				a_context.reset (current_type)
				a_context.force_last (current_target_type.named_type (universe))
			end
		end

	check_convert_to_expression_validity (an_expression: ET_CONVERT_TO_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_call_validity (an_expression, a_context)
		end

	check_create_expression_validity (an_expression: ET_CREATE_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_type: ET_TYPE
			a_call: ET_QUALIFIED_CALL
		do
			a_type := an_expression.type
			a_call := an_expression.creation_call
			if a_call /= Void then
				check_creation_expression_validity (an_expression, a_type, a_call.name, a_call.arguments, a_type.position, a_context)
			else
				check_creation_expression_validity (an_expression, a_type, Void, Void, a_type.position, a_context)
			end
		end

	check_creation_expression_validity (an_expression: ET_EXPRESSION; a_type: ET_TYPE; a_name: ET_FEATURE_NAME;
		an_actuals: ET_ACTUAL_ARGUMENTS; a_type_position: ET_POSITION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of creation expression.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			no_call: a_name = Void implies an_actuals = Void
			a_type_position_not_void: a_type_position /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_creation_type: ET_NAMED_TYPE
			a_formal_parameter_type: ET_FORMAL_PARAMETER_TYPE
			a_formal_parameter: ET_FORMAL_PARAMETER
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			a_creator: ET_CONSTRAINT_CREATOR
			an_index: INTEGER
			a_class_type: ET_CLASS_TYPE
			a_feature: ET_FEATURE
			l_type: ET_TYPE
			a_seed: INTEGER
			l_name: ET_FEATURE_NAME
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_type := a_type
			check_type_validity (l_type)
			if not has_fatal_error then
				if not l_type.is_base_type then
						-- The explicit creation type contains formal generic parameters
						-- or anchored types whose resolved value may vary in various
						-- descendant classes/types.
					report_current_type_needed
				end
				if a_name /= Void then
					l_name := a_name
					a_seed := l_name.seed
					if a_seed = 0 then
							-- We need to resolve `l_name' in the implementation
							-- class of `feature_impl' first.
						a_class_impl := feature_impl.implementation_class
						if a_class_impl /= current_class then
							set_fatal_error
							if not has_implementation_error (feature_impl) then
									-- Internal error: `l_name' should have been resolved in
									-- the implementation feature.
								error_handler.report_giacy_error
							end
						else
							a_context.force_last (l_type)
							a_class := a_context.base_class (universe)
							a_class.process (universe.interface_checker)
							if not a_class.interface_checked or else a_class.has_interface_error then
								set_fatal_error
							else
								a_feature := a_class.named_feature (l_name)
								if a_feature /= Void then
									a_seed := a_feature.first_seed
									l_name.set_seed (a_seed)
								else
									set_fatal_error
										-- ISE Eiffel 5.4 reports this error as a VEEN,
										-- but it is in fact a VUEX-2 (ETL2 p.368).
									error_handler.report_vuex2a_error (current_class, l_name, a_class)
								end
							end
						end
					end
				else
					l_name := tokens.default_create_feature_name
					a_seed := universe.default_create_seed
				end
			end
			if not has_fatal_error then
				if a_feature = Void then
					l_type := resolved_formal_parameters (l_type, feature_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (l_type)
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						elseif a_seed /= 0 then
							a_feature := a_class.seeded_feature (a_seed)
							if a_feature = Void then
									-- Report internal error: if we got a seed, the
									-- `a_feature' should not be void.
								set_fatal_error
								error_handler.report_giaav_error
							end
						end
					end
				end
			end
			if not has_fatal_error then
				check
					a_class_not_void: a_class /= Void
				end
				universe.report_create_supplier (l_type, current_class, current_feature)
				a_creation_type := a_context.named_type (universe)
				a_class_type ?= a_creation_type
				if a_class_type /= Void then
					check_creation_type_validity (a_class_type, a_type_position)
				end
				if a_feature = Void then
					check
							-- No creation call, and feature 'default_create' not
							-- supported by the underlying Eiffel compiler.
						no_call: a_name = Void
						no_default_create: universe.default_create_seed = 0
					end
					if a_class.creators /= Void then
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc5a_error (current_class, a_type_position, a_class)
						else
							error_handler.report_vgcc5b_error (current_class, a_class_impl, a_type_position, a_class)
						end
					end
				else
					if a_feature.type /= Void then
							-- This is not a procedure.
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc6b_error (current_class, l_name, a_feature, a_class)
						elseif not has_implementation_error (feature_impl) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `feature_impl' or in
								-- the feature flattener when redeclaring procedure `a_feature'
								-- to a function in an ancestor of `a_class'.
							error_handler.report_giacz_error
						end
					end
					a_formal_parameter_type ?= a_creation_type
					if a_formal_parameter_type /= Void then
						an_index := a_formal_parameter_type.index
						a_formal_parameters := current_class.formal_parameters
						if a_formal_parameters = Void or else an_index > a_formal_parameters.count then
								-- Internal error: `a_formal_parameter' is supposed
								-- to be a formal parameter of `current_class'.
							set_fatal_error
							error_handler.report_giabh_error
						else
							a_formal_parameter := a_formal_parameters.formal_parameter (an_index)
							a_creator := a_formal_parameter.creation_procedures
							if a_creator = Void or else not a_creator.has_feature (a_feature) then
								set_fatal_error
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vgcc8a_error (current_class, l_name, a_feature, a_class, a_formal_parameter)
								else
									error_handler.report_vgcc8b_error (current_class, a_class_impl, l_name, a_feature, a_class, a_formal_parameter)
								end
							end
						end
					elseif not a_feature.is_creation_exported_to (current_class, a_class, universe) then
						if a_class.creators /= Void or else not a_feature.has_seed (universe.default_create_seed) then
								-- The procedure is not a creation procedure exported to `current_class'.
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vgcc6d_error (current_class, l_name, a_feature, a_class)
							else
								error_handler.report_vgcc6e_error (current_class, a_class_impl, l_name, a_feature, a_class)
							end
						end
					end
					had_error := has_fatal_error
					check_sub_actual_arguments_validity (an_actuals, a_context, l_name, a_feature, a_class)
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						report_creation_expression (an_expression, a_creation_type, a_feature, an_actuals)
					end
				end
			end
		end

	check_current_validity (an_expression: ET_CURRENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (current_type)
			report_current (an_expression)
		end

	check_current_address_validity (an_expression: ET_CURRENT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			has_fatal_error := False
			a_typed_pointer_class := universe.typed_pointer_class
			if a_typed_pointer_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation.
				create an_actuals.make_with_capacity (1)
				an_actuals.put_first (current_type)
				create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
				report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
				a_context.force_last (a_typed_pointer_type)
					-- Need current type to create a object of type
					-- 'TYPED_POINTER [<current_type>]'.
				report_current_type_needed
			else
				a_context.force_last (universe.pointer_class)
				report_pointer_expression (an_expression)
			end
		end

	check_equality_expression_validity (an_expression: ET_EQUALITY_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			left_type: ET_TYPE
			left_context: ET_NESTED_TYPE_CONTEXT
			right_type: ET_TYPE
			right_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			left_named_type: ET_NAMED_TYPE
			right_named_type: ET_NAMED_TYPE
			left_class: ET_CLASS
			right_class: ET_CLASS
			any_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			any_type := universe.any_type
			left_context := formal_context
			left_context.reset (current_type)
			right_context := expression_context
			right_context.reset (current_type)
			check_subexpression_validity (an_expression.left, left_context, any_type)
			if not has_fatal_error then
				check_subexpression_validity (an_expression.right, right_context, any_type)
				if not has_fatal_error then
						-- This rule is too constraining when checking CAT-calls.
					left_type := tokens.like_current
					right_type := tokens.like_current
					if left_context.conforms_to_type (right_type, right_context, universe) then
							-- OK.
						report_equality_expression (an_expression)
					elseif right_context.conforms_to_type (left_type, left_context, universe) then
							-- OK.
						report_equality_expression (an_expression)
					elseif left_context.same_named_type (universe.none_type, current_type, universe) then
							-- OK.
						report_equality_expression (an_expression)
					elseif right_context.same_named_type (universe.none_type, current_type, universe) then
							-- OK.
						report_equality_expression (an_expression)
					elseif type_checker.convert_feature (left_context, right_context) /= Void then
							-- OK.
						report_equality_expression (an_expression)
					elseif type_checker.convert_feature (right_context, left_context) /= Void then
							-- OK.
						report_equality_expression (an_expression)
					else
						left_named_type := left_context.named_type (universe)
						right_named_type := right_context.named_type (universe)
						left_class := left_named_type.direct_base_class (universe)
						right_class := right_named_type.direct_base_class (universe)
						if 
							(left_class = universe.integer_8_class or
							left_class = universe.integer_16_class or
							left_class = universe.integer_class or
							left_class = universe.integer_32_class or
							left_class = universe.integer_64_class or
							left_class = universe.natural_8_class or
							left_class = universe.natural_16_class or
							left_class = universe.natural_class or
							left_class = universe.natural_32_class or
							left_class = universe.natural_64_class) and
							(right_class = universe.integer_8_class or
							right_class = universe.integer_16_class or
							right_class = universe.integer_class or
							right_class = universe.integer_32_class or
							right_class = universe.integer_64_class or
							right_class = universe.natural_8_class or
							right_class = universe.natural_16_class or
							right_class = universe.natural_class or
							right_class = universe.natural_32_class or
							right_class = universe.natural_64_class)
						then
								-- It is OK to compare integer values of various size.
							report_equality_expression (an_expression)
						else
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if a_class_impl = current_class then
								error_handler.report_vweq0a_error (current_class, an_expression, left_named_type, right_named_type)
							else
								error_handler.report_vweq0b_error (current_class, a_class_impl, an_expression, left_named_type, right_named_type)
							end
						end
					end
					if not has_fatal_error then
						a_context.force_last (universe.boolean_class)
					end
				end
			else
				check_subexpression_validity (an_expression.right, right_context, any_type)
				set_fatal_error
			end
		end

	check_expression_address_validity (an_expression: ET_EXPRESSION_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			any_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			any_type := universe.any_type
			a_typed_pointer_class := universe.typed_pointer_class
			if a_typed_pointer_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation.
				check_expression_validity (an_expression.expression, a_context, any_type, feature_impl, current_feature, current_type)
				if not has_fatal_error then
-- TODO: does the created TYPED_POINTER depend on the current type?
					if not a_context.is_empty then
						create an_actuals.make_with_capacity (1)
						an_actuals.put_first (a_context.last)
						create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
						a_context.remove_last
						report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
						a_context.put_last (a_typed_pointer_type)
					else
						create an_actuals.make_with_capacity (1)
						an_actuals.put_first (a_context.root_context)
						create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
						report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
						a_context.force_last (a_typed_pointer_type)
					end
				end
			else
					-- Use the ETL2 implementation.
				expression_context.reset (current_type)
				check_subexpression_validity (an_expression.expression, expression_context, any_type)
				if not has_fatal_error then
					a_context.force_last (universe.pointer_class)
					report_pointer_expression (an_expression)
				end
			end
		end

	check_false_constant_validity (a_constant: ET_FALSE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.boolean_class)
			report_boolean_constant (a_constant)
		end

	check_feature_address_validity (an_expression: ET_FEATURE_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			already_checked: BOOLEAN
			an_identifier: ET_IDENTIFIER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			an_argument: ET_FORMAL_ARGUMENT
			a_type: ET_TYPE
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_local: ET_LOCAL_VARIABLE
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `feature_impl' first.
				a_class_impl := feature_impl.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giada_error
					end
				else
					an_identifier ?= a_name
					if an_identifier /= Void then
						an_arguments := feature_impl.arguments
						if an_arguments /= Void then
							a_seed := an_arguments.index_of (an_identifier)
							if a_seed /= 0 then
								an_identifier.set_seed (a_seed)
								an_identifier.set_argument (True)
								an_argument := an_arguments.formal_argument (a_seed)
								an_argument.set_used (True)
								if in_invariant then
										-- VEEN-3: the formal argument appears in an invariant.
										-- Internal error: the invariant has no formal argument.
									set_fatal_error
									error_handler.report_giaeb_error
								else
									a_typed_pointer_class := universe.typed_pointer_class
									if a_typed_pointer_class.is_preparsed then
											-- Class TYPED_POINTER has been found in the universe.
											-- Use ISE's implementation.
										create an_actuals.make_with_capacity (1)
										an_actuals.put_first (an_argument.type)
										create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
										report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
										a_context.force_last (a_typed_pointer_type)
-- TODO: does the created TYPED_POINTER depend on the current type?
									else
										a_context.force_last (universe.pointer_class)
										report_pointer_expression (an_expression)
									end
								end
									-- No need to check validity in the
									-- context of `current_class' again.
								already_checked := True
							end
						end
						if a_seed = 0 then
							a_locals := feature_impl.locals
							if a_locals /= Void then
								a_seed := a_locals.index_of (an_identifier)
								if a_seed /= 0 then
									an_identifier.set_seed (a_seed)
									an_identifier.set_local (True)
									a_local := a_locals.local_variable (a_seed)
									a_local.set_used (True)
									if in_precondition or in_postcondition then
											-- The local entity appears in a pre- or postcondition.
										set_fatal_error
										error_handler.report_veen2c_error (current_class, an_identifier, feature_impl)
									elseif in_invariant then
											-- VEEN-2: the local entity appears in an invariant.
											-- Internal error: the invariant has no local entity.
										set_fatal_error
										error_handler.report_gibbu_error
									else
										a_typed_pointer_class := universe.typed_pointer_class
										if a_typed_pointer_class.is_preparsed then
												-- Class TYPED_POINTER has been found in the universe.
												-- Use ISE's implementation.
											create an_actuals.make_with_capacity (1)
											an_actuals.put_first (a_local.type)
											create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
											report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
											a_context.force_last (a_typed_pointer_type)
-- TODO: does the created TYPED_POINTER depend on the current type?
										else
											a_context.force_last (universe.pointer_class)
											report_pointer_expression (an_expression)
										end
									end
										-- No need to check validity in the
										-- context of `current_class' again.
									already_checked := True
								end
							end
						end
					end
					if a_seed = 0 then
						current_class.process (universe.interface_checker)
						if not current_class.interface_checked or else current_class.has_interface_error then
							set_fatal_error
						else
							a_feature := current_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
								if a_feature.is_attribute then
									a_typed_pointer_class := universe.typed_pointer_class
									if a_typed_pointer_class.is_preparsed then
											-- Class TYPED_POINTER has been found in the universe.
											-- Use ISE's implementation.
										create an_actuals.make_with_capacity (1)
										an_actuals.put_first (a_feature.type)
										create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
										report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
										a_context.force_last (a_typed_pointer_type)
-- TODO: does the created TYPED_POINTER depend on the current type?
									else
										a_context.force_last (universe.pointer_class)
										report_pointer_expression (an_expression)
									end
								else
										-- $feature_name is of type POINTER, even
										-- in ISE and its TYPED_POINTER support.
									a_context.force_last (universe.pointer_class)
									report_pointer_expression (an_expression)
								end
									-- No need to check validity in the
									-- context of `current_class' again.
								already_checked := True
							else
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VUAR-4 (ETL2 p.369).
								error_handler.report_vuar4a_error (a_class_impl, a_name)
							end
						end
					end
				end
			end
			if not has_fatal_error and not already_checked then
				if a_name.is_argument then
					if in_invariant then
							-- VEEN-3: the formal argument appears in an invariant.
							-- Internal error: the invariant has no formal argument.
						set_fatal_error
						error_handler.report_giaea_error
					else
							-- Use arguments of `current_feature' instead of `feature_impl'
							-- because when processing inherited assertions the types of signature
							-- should be those of the version of the feature in the current class.
							-- For example:
							--    deferred class A
							--    feature
							--       f (a: ANY) is
							--           require
							--               pre: g ($a)
							--           deferred
							--           end
							--      g (a: TYPED_POINTER [ANY]): BOOLEAN is deferred end
							--    end
							--    class B
							--    inherit
							--        A
							--    feature
							--        f (a: STRING) is do ... end
							--        g (a: TYPED_POINTER [STRING]): BOOLEAN is do ... end
							--    end
							-- `a' in the inherited precondition "pre" should be considered
							-- of type STRING (and not ANY) is class B.
							--
							-- Use arguments of implementation feature because the types
							-- of the signature of `current_feature' might not have been
							-- resolved for `current_class' (when processing precursors
							-- in the context of current class).
						an_arguments := current_feature.implementation_feature.arguments
						if an_arguments = Void then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaaq_error
						elseif a_seed < 1 or a_seed > an_arguments.count then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaar_error
						else
							a_typed_pointer_class := universe.typed_pointer_class
							if a_typed_pointer_class.is_preparsed then
									-- Class TYPED_POINTER has been found in the universe.
									-- Use ISE's implementation.
								a_type := resolved_formal_parameters (an_arguments.formal_argument (a_seed).type, current_feature, current_type)
								if not has_fatal_error then
									create an_actuals.make_with_capacity (1)
									an_actuals.put_first (a_type)
									create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
									report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
									a_context.force_last (a_typed_pointer_type)
-- TODO: does the created TYPED_POINTER depend on the current type?
								end
							else
								a_context.force_last (universe.pointer_class)
								report_pointer_expression (an_expression)
							end
						end
					end
				elseif a_name.is_local then
					if in_precondition or in_postcondition then
							-- The local entity appears in a pre- or postcondition.
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if a_class_impl = current_class then
							error_handler.report_veen2c_error (current_class, a_name, feature_impl)
						else
							if not has_implementation_error (feature_impl) then
									-- Internal error: the VEEN-2 error should have been
									-- reported in the implementation feature.
								error_handler.report_gibak_error
							end
						end
					elseif in_invariant then
							-- VEEN-2: the local entity appears in an invariant.
							-- Internal error: the invariant has no local entity.
						set_fatal_error
						error_handler.report_gibal_error
					else
						a_locals := feature_impl.locals
						if a_locals = Void then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaas_error
						elseif a_seed < 1 or a_seed > a_locals.count then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaat_error
						else
							a_typed_pointer_class := universe.typed_pointer_class
							if a_typed_pointer_class.is_preparsed then
									-- Class TYPED_POINTER has been found in the universe.
									-- Use ISE's implementation.
									-- Contrary to the types appearing in the signatures, types of
									-- local variables in the AST are those found in the implementation
									-- class of `current_feature', and hence need to be resolved in
									-- `current_type'.
								a_type := resolved_formal_parameters (a_locals.local_variable (a_seed).type, feature_impl, current_type)
								if not has_fatal_error then
									create an_actuals.make_with_capacity (1)
									an_actuals.put_first (a_type)
									create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
									report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
									a_context.force_last (a_typed_pointer_type)
-- TODO: does the created TYPED_POINTER depend on the current type?
								end
							else
								a_context.force_last (universe.pointer_class)
								report_pointer_expression (an_expression)
							end
						end
					end
				else
					current_class.process (universe.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.seeded_feature (a_seed)
						if a_feature /= Void then
							if a_feature.is_attribute then
								a_typed_pointer_class := universe.typed_pointer_class
								if a_typed_pointer_class.is_preparsed then
										-- Class TYPED_POINTER has been found in the universe.
										-- Use ISE's implementation.
									create an_actuals.make_with_capacity (1)
									an_actuals.put_first (a_feature.type)
									create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
									report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
									a_context.force_last (a_typed_pointer_type)
-- TODO: does the created TYPED_POINTER depend on the current type?
								else
									a_context.force_last (universe.pointer_class)
									report_pointer_expression (an_expression)
								end
							else
									-- $feature_name is of type POINTER, even
									-- in ISE and its TYPED_POINTER support.
								a_context.force_last (universe.pointer_class)
								report_pointer_expression (an_expression)
							end
						else
								-- Report internal error: if we got a seed, the
								-- `a_feature' should not be void.
							set_fatal_error
							error_handler.report_giaau_error
						end
					end
				end
			end
		end

	check_formal_argument_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of formal argument `a_name'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_name_argument: a_name.is_argument
			a_context_not_void: a_context /= Void
		local
			a_seed: INTEGER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			a_type: ET_TYPE
		do
			has_fatal_error := False
			if in_invariant then
					-- VEEN-3: the formal argument appears in an invariant.
					-- Internal error: the invariant has no formal argument.
				set_fatal_error
				error_handler.report_giads_error
			else
					-- Use arguments of `current_feature' instead of `feature_impl'
					-- because when processing inherited assertions the types of signature
					-- should be those of the version of the feature in the current class.
					-- For example:
					--    deferred class A
					--    feature
					--       f (a: ANY) is
					--           require
					--               pre: g (a)
					--           deferred
					--           end
					--      g (a: ANY): BOOLEAN is deferred end
					--    end
					--    class B
					--    inherit
					--        A
					--    feature
					--        f (a: STRING) is do ... end
					--        g (a: STRING): BOOLEAN is do ... end
					--    end
					-- `a' in the inherited precondition "pre" should be considered
					-- of type STRING (and not ANY) is class B.
					--
					-- Use arguments of implementation feature because the types
					-- of the signature of `current_feature' might not have been
					-- resolved for `current_class' (when processing precursors
					-- in the context of current class).
				an_arguments := current_feature.implementation_feature.arguments
				a_seed := a_name.seed
				if an_arguments = Void then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaal_error
				elseif a_seed < 1 or a_seed > an_arguments.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaam_error
				else
					a_formal := an_arguments.formal_argument (a_seed)
					a_type := resolved_formal_parameters (a_formal.type, current_feature, current_type)
					if not has_fatal_error then
						a_context.force_last (a_type)
						report_formal_argument (a_name, a_formal)
					end
				end
			end
		end

	check_hexadecimal_integer_constant_validity (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_type: ET_CLASS_TYPE
			a_class: ET_CLASS
			a_type: ET_TYPE
			a_literal: STRING
			a_cast_type: ET_TYPE
		do
			has_fatal_error := False
			a_cast_type := a_constant.type
			if a_cast_type /= Void then
				a_class_type ?= a_cast_type.named_type (a_context, universe)
			else
				a_class_type ?= current_target_type.named_type (universe)
			end
			if a_class_type /= Void then
				a_class := a_class_type.direct_base_class (universe)
				if a_class = universe.integer_8_class then
					a_type := a_class
					a_constant.set_integer_8
					report_integer_8_constant (a_constant)
				elseif a_class = universe.integer_16_class then
					a_type := a_class
					a_constant.set_integer_16
					report_integer_16_constant (a_constant)
				elseif a_class = universe.integer_class then
					a_type := a_class
					a_constant.set_integer
					report_integer_constant (a_constant)
				elseif a_class = universe.integer_32_class then
					a_type := a_class
					a_constant.set_integer_32
					report_integer_32_constant (a_constant)
				elseif a_class = universe.integer_64_class then
					a_type := a_class
					a_constant.set_integer_64
					report_integer_64_constant (a_constant)
				elseif a_class = universe.natural_class then
					a_type := a_class
					a_constant.set_natural
					report_natural_constant (a_constant)
				elseif a_class = universe.natural_8_class then
					a_type := a_class
					a_constant.set_natural_8
					report_natural_8_constant (a_constant)
				elseif a_class = universe.natural_16_class then
					a_type := a_class
					a_constant.set_natural_16
					report_natural_16_constant (a_constant)
				elseif a_class = universe.natural_32_class then
					a_type := a_class
					a_constant.set_natural_32
					report_natural_32_constant (a_constant)
				elseif a_class = universe.natural_64_class then
					a_type := a_class
					a_constant.set_natural_64
					report_natural_64_constant (a_constant)
				end
			end
			if a_type = Void then
				if a_cast_type /= Void then
-- TODO: error
				end
				a_literal := a_constant.literal
				inspect a_literal.count
				when 4 then
						-- 0[xX][a-fA-F0-9]{2}
					a_type := universe.integer_8_class
					a_constant.set_integer_8
					report_integer_8_constant (a_constant)
				when 6 then
						-- 0[xX][a-fA-F0-9]{4}
					a_type := universe.integer_16_class
					a_constant.set_integer_16
					report_integer_16_constant (a_constant)
				when 10 then
						-- 0[xX][a-fA-F0-9]{8}
					a_type := universe.integer_class
-- TODO: should probably be INTEGER_32, but stay compatible with ISE
					a_constant.set_integer
					report_integer_constant (a_constant)
				when 18 then
						-- 0[xX][a-fA-F0-9]{16}
					a_type := universe.integer_64_class
					a_constant.set_integer_64
					report_integer_64_constant (a_constant)
				else
					a_type := universe.integer_class
					a_constant.set_integer
					report_integer_constant (a_constant)
				end
			end
			a_context.force_last (a_type)
		end

	check_infix_cast_expression_validity (an_expression: ET_INFIX_CAST_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_type: ET_TYPE
		do
			has_fatal_error := False
			a_type := an_expression.type
			formal_context.reset (current_type)
			formal_context.force_last (a_type)
			check_subexpression_validity (an_expression.expression, a_context, formal_context)
			an_expression.set_index (an_expression.expression.index)
			a_context.force_last (a_type)
		end

	check_infix_expression_validity (an_expression: ET_INFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_CALL_NAME
			a_target: ET_EXPRESSION
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			other_class: ET_CLASS
			other_feature: ET_FEATURE
			other_formals: ET_FORMAL_ARGUMENT_LIST
			other_formal: ET_FORMAL_ARGUMENT
			a_type: ET_TYPE
			a_seed: INTEGER
			an_actual: ET_EXPRESSION
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			had_error: BOOLEAN
			an_actual_type, a_formal_type: ET_NAMED_TYPE
			a_like: ET_LIKE_FEATURE
			a_convert_feature: ET_CONVERT_FEATURE
			a_convert_class: ET_CLASS
			a_convert_expression: ET_CONVERT_EXPRESSION
			a_convert_to_expression: ET_CONVERT_TO_EXPRESSION
			a_convert_name: ET_FEATURE_NAME
			a_convert_type: ET_NAMED_TYPE
			a_conversion_feature: ET_FEATURE
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_actual_type: ET_TYPE
			l_formal_type: ET_TYPE
			any_type: ET_CLASS_TYPE
			a_cast_expression: ET_INFIX_CAST_EXPRESSION
			a_builtin: ET_BUILTIN_CONVERT_FEATURE
		do
			has_fatal_error := False
			a_name := an_expression.name
			any_type := universe.any_type
			a_target := an_expression.left
			if a_target.is_current then
					-- If the target is the current object there is a good chance that
					-- we will need its type to figure out which feature to call.
				report_current_type_needed
			end
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `feature_impl' first.
				a_class_impl := feature_impl.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giadb_error
					end
				else
					check_expression_validity (a_target, a_context, any_type, feature_impl, current_feature, current_type)
					if not has_fatal_error then
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
							else
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VUEX-2 (ETL2 p.368).
								error_handler.report_vuex2a_error (current_class, a_name, a_class)
							end
						end
					end
				end
			end
			if not has_fatal_error then
				if a_feature = Void then
					check_expression_validity (a_target, a_context, any_type, feature_impl, current_feature, current_type)
					if not has_fatal_error then
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.seeded_feature (a_seed)
							if a_feature = Void then
									-- Report internal error: if we got a seed, the
									-- `a_feature' should not be void.
								set_fatal_error
								error_handler.report_giabd_error
							end
						end
					end
				end
				if a_feature /= Void then
					check
						a_class_not_void: a_class /= Void
					end
					if not a_feature.is_exported_to (current_class, universe) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vuex2b_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vuex2c_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					end
					had_error := has_fatal_error
					check_vape_validity (a_name, a_feature, a_class)
					if had_error then
						set_fatal_error
					end
						-- Check arguments validity.
					a_formals := a_feature.arguments
					if a_formals = Void or else a_formals.count /= 1 then
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vuar1a_error (current_class, a_name, a_feature, a_class)
						elseif not has_implementation_error (feature_impl) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `feature_impl' or in
								-- the feature flattener when redeclaring `a_feature' in an
								-- ancestor of `a_class' or `current_class'.
							error_handler.report_giadc_error
						end
					else
						an_actual := an_expression.right
						a_formal := a_formals.formal_argument (1)
							-- Do not use `actual_context' because it might already have
							-- been used in `check_actual_arguments_validity'. Use
							-- `expression_context' instead.
						l_actual_context := expression_context
						l_actual_context.reset (current_type)
						l_formal_context := a_context
						l_formal_type := a_formal.type
						l_formal_context.force_last (l_formal_type)
						if has_fatal_error then
							had_error := True
						end
						check_subexpression_validity (an_actual, l_actual_context, l_formal_context)
						if had_error then
							set_fatal_error
						end
						l_formal_context.remove_last
						if not has_fatal_error then
							if not l_actual_context.conforms_to_type (l_formal_type, l_formal_context, universe) then
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									l_formal_context.force_last (l_formal_type)
									a_convert_feature := type_checker.convert_feature (l_actual_context, l_formal_context)
									l_formal_context.remove_last
								else
										-- Convertibility should be resolved in the implementation class.
									a_convert_feature := Void
								end
								if a_convert_feature /= Void then
									if a_convert_feature.is_convert_from then
										a_convert_class := l_formal_context.base_class (universe)
									elseif a_convert_feature.is_convert_to then
										a_convert_class := l_actual_context.base_class (universe)
									else
										a_convert_class := Void
									end
									if a_convert_class /= Void then
										a_convert_class.process (universe.feature_flattener)
										if not a_convert_class.features_flattened or else a_convert_class.has_flattening_error then
												-- Error already reported by the feature flattener.
											had_error := True
											set_fatal_error
											a_convert_feature := Void
										end
									end
									if a_convert_feature /= Void then
											-- Insert the conversion feature call in the AST.
										if a_convert_feature.is_convert_to then
											create a_convert_to_expression.make (an_actual, a_convert_feature)
											a_convert_expression := a_convert_to_expression
											a_convert_name := a_convert_feature.name
											a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
											if a_conversion_feature /= Void then
												report_qualified_call_expression (a_convert_to_expression, l_actual_context, a_conversion_feature)
											else
													-- Internal error: the seed of the convert function should correspond
													-- to a feature of `a_convert_class'.
												set_fatal_error
												error_handler.report_gibdu_error
											end
										elseif a_convert_feature.is_convert_from then
											create a_convert_expression.make (an_actual, a_convert_feature)
											a_convert_name := a_convert_feature.name
											a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
											if a_conversion_feature /= Void then
												report_creation_expression (a_convert_expression, l_actual_context.named_type (universe), a_conversion_feature, an_actual)
											else
													-- Internal error: the seed of the convert function should correspond
													-- to a feature of `a_convert_class'.
												set_fatal_error
												error_handler.report_gibap_error
											end
										else
											create a_convert_expression.make (an_actual, a_convert_feature)
											a_convert_expression.set_index (an_actual.index)
										end
										an_expression.set_right (a_convert_expression)
										an_actual := a_convert_expression
									end
								else
									had_error := True
										-- Infix feature convertibility: try to convert
										-- the target to the type of the argument.
									if current_class = a_class_impl then
										other_class := l_actual_context.base_class (universe)
										if
											other_class /= a_class or else
											not l_actual_context.same_named_type (tokens.like_current, l_formal_context, universe)
										then
												-- Either the base classes of the left- and right-hand sides
												-- are not the same, or they have different types. No need
												-- to go further is the left- and right-hand sides have the
												-- same types.
												-- Left-hand side type: `l_formal_context' (same as 'like current' in context `l_formal_context')
												-- Right-hand side type: `l_actual_context'
											other_class.process (universe.interface_checker)
											if other_class.interface_checked and then not other_class.has_interface_error then
												other_feature := other_class.named_feature (a_name)
											end
										end
										if other_feature /= Void then
											if other_feature.is_exported_to (current_class, universe) then
												a_convert_feature := type_checker.convert_feature (l_formal_context, l_actual_context)
												if a_convert_feature /= Void then
													if a_convert_feature.is_convert_from then
														a_convert_class := l_actual_context.base_class (universe)
													elseif a_convert_feature.is_convert_to then
														a_convert_class := l_formal_context.base_class (universe)
													else
														a_convert_class := Void
													end
													if a_convert_class /= Void then
														a_convert_class.process (universe.feature_flattener)
														if not a_convert_class.features_flattened or else a_convert_class.has_flattening_error then
																-- Error already reported by the feature flattener.
															set_fatal_error
															a_convert_feature := Void
														end
													end
													if a_convert_feature /= Void then
														if a_convert_feature.is_convert_to then
															create a_convert_to_expression.make (a_target, a_convert_feature)
															a_convert_name := a_convert_feature.name
															a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
															if a_conversion_feature /= Void then
																report_qualified_call_expression (a_convert_to_expression, l_actual_context, a_conversion_feature)
																create a_cast_expression.make (a_convert_to_expression, l_actual_context.named_type (universe))
																a_cast_expression.set_index (a_convert_to_expression.index)
															else
																	-- Internal error: the seed of the convert function should correspond
																	-- to a feature of `a_convert_class'.
																set_fatal_error
																error_handler.report_gibaq_error
															end
														elseif a_convert_feature.is_convert_from then
															create a_convert_expression.make (a_target, a_convert_feature)
															a_convert_name := a_convert_feature.name
															a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
															if a_conversion_feature /= Void then
																a_convert_type := l_actual_context.named_type (universe)
																report_creation_expression (a_convert_expression, a_convert_type, a_conversion_feature, a_target)
																create a_cast_expression.make (a_convert_expression, a_convert_type)
																a_cast_expression.set_index (a_convert_expression.index)
															else
																	-- Internal error: the seed of the convert function should correspond
																	-- to a feature of `a_convert_class'.
																set_fatal_error
																error_handler.report_gibao_error
															end
														else
															create a_convert_expression.make (a_target, a_convert_feature)
															a_convert_expression.set_index (a_target.index)
															create a_cast_expression.make (a_convert_expression, l_actual_context.named_type (universe))
															a_cast_expression.set_index (a_convert_expression.index)
														end
													end
												else
														-- If it does not convert, it might conform!
													l_actual_type := tokens.like_current
													if l_formal_context.conforms_to_type (l_actual_type, l_actual_context, universe) then
														create a_cast_expression.make (a_target, l_actual_context.named_type (universe))
														a_cast_expression.set_index (a_target.index)
													end
												end
											end
											if a_cast_expression /= Void then
												other_formals := other_feature.arguments
												if other_formals /= Void and then other_formals.count = 1 then
													other_formal := other_formals.formal_argument (1)
														-- Note: should we check for convertibility if no conformance?
													if l_actual_context.conforms_to_type (other_formal.type, l_actual_context, universe) then
														had_error := False
														a_seed := other_feature.first_seed
														a_name.set_seed (a_seed)
														a_context.copy_type_context (l_actual_context)
														a_feature := other_feature
														a_class := other_class
															-- Insert the cast expression in the AST.
														an_expression.set_left (a_cast_expression)
														a_target := a_cast_expression
													end
												end
											end
										end
									end
									if had_error then
										set_fatal_error
										an_actual_type := l_actual_context.named_type (universe)
										a_formal_type := l_formal_type.named_type (l_formal_context, universe)
										if current_class = a_class_impl then
											error_handler.report_vuar2a_error (current_class, a_name, a_feature, a_class, 1, an_actual_type, a_formal_type)
										else
											error_handler.report_vuar2b_error (current_class, a_class_impl, a_name, a_feature, a_class, 1, an_actual_type, a_formal_type)
										end
									end
								end
							end
						end
					end
					a_type := a_feature.type
					if a_type = Void then
							-- In a call expression, `a_feature' has to be a query.
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vkcn2a_error (current_class, a_name, a_feature, a_class)
						elseif not has_implementation_error (feature_impl) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `feature_impl' or in
								-- the feature flattener when redeclaring function `a_feature'
								-- to a procedure in an ancestor of `a_class'.
							error_handler.report_giadd_error
						end
					elseif not has_fatal_error then
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases).
						a_like ?= a_type
						if a_like /= Void and then a_like.is_like_argument then
							formal_context.copy_type_context (a_context)
							formal_context.force_last (a_feature.arguments.formal_argument (1).type)
							a_context.wipe_out
							an_actual := an_expression.right
							check_subexpression_validity (an_actual, a_context, formal_context)
							if not has_fatal_error then
								a_convert_expression ?= an_actual
								if a_convert_expression /= Void then
									a_builtin ?= a_convert_expression.convert_feature
									if a_builtin /= Void then
											-- Needed for compatibility with ISE 5.6.0610:
											-- a formal generic parameter either conforms or converts to its constraint,
											-- then the converted version can still be chained with a conformance to
											-- `current_target_type'.
										a_context.reset (current_type)
										a_context.force_last (a_builtin.type)
									end
								end
								formal_context.remove_last
								report_qualified_call_expression (an_expression, formal_context, a_feature)
							end
						else
							report_qualified_call_expression (an_expression, a_context, a_feature)
							a_context.force_last (a_type)
						end
					end
				end
			end
		end

	check_local_variable_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of local variable `a_name'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_name_local: a_name.is_local
			a_context_not_void: a_context /= Void
		local
			a_seed: INTEGER
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_local: ET_LOCAL_VARIABLE
			a_type: ET_TYPE
			a_class_impl: ET_CLASS
		do
			has_fatal_error := False
			if in_precondition or in_postcondition then
					-- The local entity appears in a pre- or postcondition.
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if a_class_impl = current_class then
					error_handler.report_veen2c_error (current_class, a_name, feature_impl)
				else
					if not has_implementation_error (feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giado_error
					end
				end
			elseif in_invariant then
					-- VEEN-2: the local entity appears in an invariant.
					-- Internal error: the invariant has no local entity.
				set_fatal_error
				error_handler.report_giadt_error
			else
				a_locals := feature_impl.locals
				a_seed := a_name.seed
				if a_locals = Void then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaan_error
				elseif a_seed < 1 or a_seed > a_locals.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaao_error
				else
						-- Contrary to the types appearing in the signatures, types of
						-- local variables in the AST are those found in the implementation
						-- class of `current_feature', and hence need to be resolved in
						-- `current_type'.
					a_local := a_locals.local_variable (a_seed)
					a_type := resolved_formal_parameters (a_local.type, feature_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (a_type)
						report_local_variable (a_name, a_local)
					end
				end
			end
		end

	check_manifest_array_validity (an_expression: ET_MANIFEST_ARRAY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
			an_item_type: ET_TYPE
			hybrid_type: BOOLEAN
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			array_class: ET_CLASS
			an_array_type: ET_CLASS_TYPE
			an_array_parameters: ET_ACTUAL_PARAMETER_LIST
			an_array_parameter: ET_TYPE
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
			any_type: ET_CLASS_TYPE
		do
-- TODO: check that the type of the manifest array does not depend on the
-- type of current.
			has_fatal_error := False
			array_class := universe.array_class
			an_array_type ?= current_target_type.named_type (universe)
			if an_array_type /= Void and then an_array_type.direct_base_class (universe) = array_class then
				an_array_parameters := an_array_type.actual_parameters
				if an_array_parameters /= Void and then an_array_parameters.count = 1 then
					an_array_parameter := an_array_parameters.type (1)
				end
			end
			nb := an_expression.count
			if an_array_parameter /= Void then
				formal_context.reset (current_type)
				formal_context.force_last (an_array_parameter)
				expression_context.reset (current_type)
				from i := 1 until i > nb loop
					check_subexpression_validity (an_expression.expression (i), expression_context, formal_context)
					if has_fatal_error then
						had_error := True
					else
						if not expression_context.conforms_to_type (an_array_parameter, current_type, universe) then
							if type_checker.convert_feature (expression_context, formal_context) = Void then
								an_array_type := universe.array_any_type
							else
-- TODO: insert convert feature in AST.
							end
						end
					end
					expression_context.wipe_out
					i := i + 1
				end
				if had_error then
					set_fatal_error
				else
					report_manifest_array (an_expression, an_array_type)
					a_context.force_last (an_array_type)
				end
			else
				any_type := universe.any_type
				expression_context.reset (current_type)
				from i := 1 until i > nb loop
					check_subexpression_validity (an_expression.expression (i), expression_context, any_type)
					if has_fatal_error then
						had_error := True
					elseif not had_error then
						if an_item_type = Void then
							an_item_type := expression_context.named_type (universe)
						elseif not hybrid_type then
							hybrid_type := not expression_context.same_named_type (an_item_type, current_type, universe)
						end
					end
					expression_context.wipe_out
					i := i + 1
				end
				if had_error then
					set_fatal_error
				elseif an_item_type = Void then
					an_array_type := universe.array_any_type
					report_manifest_array (an_expression, an_array_type)
					a_context.force_last (an_array_type)
				elseif hybrid_type then
					an_array_type := universe.array_any_type
					report_manifest_array (an_expression, an_array_type)
					a_context.force_last (an_array_type)
				else
					create an_actuals.make_with_capacity (1)
					an_actuals.put_first (an_item_type)
					create a_generic_class_type.make (Void, array_class.name, an_actuals, array_class)
					a_generic_class_type.set_unresolved_type (universe.array_any_type)
					report_manifest_array (an_expression, a_generic_class_type)
					a_context.force_last (a_generic_class_type)
				end
			end
		end

	check_manifest_tuple_validity (an_expression: ET_MANIFEST_TUPLE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			i, nb, nb2: INTEGER
			had_error: BOOLEAN
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_tuple_parameters: ET_ACTUAL_PARAMETER_LIST
			any_type: ET_CLASS_TYPE
		do
-- TODO: check that the type of the manifest tuple does not depend on the
-- type of current.
			has_fatal_error := False
			a_tuple_type ?= current_target_type.named_type (universe)
			if a_tuple_type /= Void then
				a_tuple_parameters := a_tuple_type.actual_parameters
				if a_tuple_parameters /= Void then
					nb2 := a_tuple_parameters.count
				end
			end
			any_type := universe.any_type
			expression_context.reset (current_type)
			nb := an_expression.count
			create an_actuals.make_with_capacity (nb)
			from i := nb until i <= nb2 loop
				check_subexpression_validity (an_expression.expression (i), expression_context, any_type)
				if has_fatal_error then
					had_error := True
				else
					an_actuals.put_first (expression_context.named_type (universe))
				end
				expression_context.wipe_out
				i := i - 1
			end
			formal_context.reset (current_type)
			from until i < 1 loop
				formal_context.force_last (a_tuple_parameters.type (i))
				check_subexpression_validity (an_expression.expression (i), expression_context, formal_context)
				if has_fatal_error then
					had_error := True
				else
					an_actuals.put_first (expression_context.named_type (universe))
				end
				expression_context.wipe_out
				formal_context.wipe_out
				i := i - 1
			end
			if had_error then
				set_fatal_error
			else
				create a_tuple_type.make (an_actuals)
				report_manifest_tuple (an_expression, a_tuple_type)
				a_context.force_last (a_tuple_type)
			end
		end

	check_manifest_type_validity (an_expression: ET_MANIFEST_TYPE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_type_class: ET_CLASS
			a_type_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
		do
-- TODO: check that the type of the manifest type does not depend on the
-- type of current.
			has_fatal_error := False
			a_type_class := universe.type_class
			create an_actuals.make_with_capacity (1)
			an_actuals.put_first (an_expression.type)
			create a_type_type.make (Void, a_type_class.name, an_actuals, a_type_class)
			report_manifest_type (an_expression, a_type_type, a_context)
			a_context.force_last (a_type_type)
		end

	check_old_expression_validity (an_expression: ET_OLD_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			l_expression: ET_EXPRESSION
		do
				-- Check VAOL-2 (ETL2 p.124).
			l_expression := an_expression.expression
			check_expression_validity (l_expression, a_context, current_target_type, feature_impl, current_feature, current_type)
			an_expression.set_index (l_expression.index)
			if not in_postcondition then
					-- Check VAOL-1 (ETL2 p.124).
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if a_class_impl = current_class then
					error_handler.report_vaol1a_error (current_class, an_expression)
				else
					if not has_implementation_error (feature_impl) then
							-- Internal error: the VAOL-1 error should have been
							-- reported in the implementation feature.
						error_handler.report_giade_error
					end
				end
			end
		end

	check_once_manifest_string_validity (an_expression: ET_ONCE_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_string: ET_MANIFEST_STRING
		do
			l_string := an_expression.manifest_string
			check_expression_validity (l_string, a_context, current_target_type, feature_impl, current_feature, current_type)
			an_expression.set_index (l_string.index)
		end

	check_parenthesized_expression_validity (an_expression: ET_PARENTHESIZED_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_expression: ET_EXPRESSION
		do
			l_expression := an_expression.expression
			check_expression_validity (l_expression, a_context, current_target_type, feature_impl, current_feature, current_type)
			an_expression.set_index (l_expression.index)
		end

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
		do
			if in_assertion then
					-- The Precursor expression does not appear in a Routine_body.
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if current_class = a_class_impl then
					error_handler.report_vdpr1b_error (current_class, an_expression)
				elseif not has_implementation_error (feature_impl) then
						-- Internal error: the VDPR-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giadk_error
				end
			else
				check_precursor_validity (an_expression, an_expression, a_context)
			end
		end

	check_precursor_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_precursor: ET_PRECURSOR; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_precursor'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_precursor_not_void: a_precursor /= Void
			is_expression: an_expression /= Void implies a_precursor = an_expression
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			a_precursor_keyword: ET_PRECURSOR_KEYWORD
			a_feature: ET_FEATURE
			a_parent_type, an_ancestor: ET_BASE_TYPE
			a_class: ET_CLASS
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
		do
			has_fatal_error := False
				-- This is an unqualified call, so there is a good chance that we
				-- will need the type of current to figure out which feature to call.
			report_current_type_needed
			a_class_impl := feature_impl.implementation_class
			if current_feature.first_precursor = Void then
					-- Immediate features cannot have Precursor.
				set_fatal_error
				if a_class_impl /= current_class then
					if not has_implementation_error (feature_impl) then
							-- Internal error: Precursor should have been resolved in
							-- the implementation feature.
						error_handler.report_giadx_error
					end
				else
					error_handler.report_vdpr3d_error (current_class, a_precursor, feature_impl)
				end
			else
					-- Make sure that `a_precursor' has been resolved.
				a_class_impl.process (universe.feature_flattener)
				if not a_class_impl.features_flattened or else a_class_impl.has_flattening_error then
					set_fatal_error
				else
					a_parent_type := a_precursor.parent_type
					if a_parent_type = Void then
							-- Internal error: the Precursor construct should
							-- already have been resolved when flattening the
							-- features of `a_class_impl'.
						set_fatal_error
						error_handler.report_giaap_error
					else
						a_precursor_keyword := a_precursor.precursor_keyword
						a_class := a_parent_type.direct_base_class (universe)
						a_feature := a_class.seeded_feature (a_precursor_keyword.seed)
						if a_feature = Void then
								-- Internal error: the Precursor construct should
								-- already have been resolved when flattening the
								-- features of `a_class_impl'.
							set_fatal_error
							error_handler.report_giabg_error
						else
							if current_class = a_class_impl then
								formal_context.reset (current_type)
								formal_context.force_last (a_parent_type)
							else
									-- Resolve generic parameters in the
									-- context of `current_type'.
								if a_parent_type.is_generic then
									current_class.process (universe.ancestor_builder)
									if not current_class.ancestors_built or else current_class.has_ancestors_error then
										set_fatal_error
									else
										an_ancestor := current_class.ancestor (a_parent_type, universe)
										if an_ancestor = Void then
												-- Internal error: `a_parent_type' is an ancestor
												-- of `a_class_impl', and hence of `current_class'.
											set_fatal_error
											error_handler.report_giabx_error
										else
											formal_context.reset (current_type)
											formal_context.force_last (an_ancestor)
											a_parent_type := an_ancestor
										end
									end
								else
									formal_context.reset (current_type)
									formal_context.force_last (a_parent_type)
								end
							end
							if not has_fatal_error then
								an_actuals := a_precursor.arguments
								check_sub_actual_arguments_validity (an_actuals, formal_context, a_precursor_keyword, a_feature, a_class)
								if not has_fatal_error then
									if an_expression /= Void then 
-- TODO: like argument and get the type as it was in the parent.
										a_context.force_last (current_feature.type)
										report_precursor_expression (an_expression, a_parent_type, a_feature)
									else
										report_precursor_instruction (a_precursor, a_parent_type, a_feature)
									end
								end
							end
						end
					end
				end
			end
		end

	check_prefix_expression_validity (an_expression: ET_PREFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_call_validity (an_expression, a_context)
		end

	check_qualified_call_validity (a_call: ET_FEATURE_CALL; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			qualified_call: a_call.is_qualified_call
			a_context_not_void: a_context /= Void
		local
			a_target: ET_EXPRESSION
			a_name: ET_CALL_NAME
			an_actuals: ET_ACTUAL_ARGUMENTS
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			a_like: ET_LIKE_FEATURE
			any_type: ET_CLASS_TYPE
			had_error: BOOLEAN
			an_actual: ET_EXPRESSION
			a_convert_expression: ET_CONVERT_EXPRESSION
			a_builtin: ET_BUILTIN_CONVERT_FEATURE
		do
			has_fatal_error := False
			a_target := a_call.target
			if a_target.is_current then
					-- If the target is the current object there is a good chance that
					-- we will need its type to figure out which feature to call.
				report_current_type_needed
			end
			a_name := a_call.name
			an_actuals := a_call.arguments
			any_type := universe.any_type
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `feature_impl' first.
				a_class_impl := feature_impl.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giacf_error
					end
				else
					check_expression_validity (a_target, a_context, any_type, feature_impl, current_feature, current_type)
					if not has_fatal_error then
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
							else
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VUEX-2 (ETL2 p.368).
								error_handler.report_vuex2a_error (current_class, a_name, a_class)
							end
						end
					end
				end
			end
			if not has_fatal_error then
				if a_feature = Void then
					check_expression_validity (a_target, a_context, any_type, feature_impl, current_feature, current_type)
					if not has_fatal_error then
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.seeded_feature (a_seed)
							if a_feature = Void then
									-- Report internal error: if we got a seed, the
									-- `a_feature' should not be void.
								set_fatal_error
								error_handler.report_giaak_error
							end
						end
					end
				end
				if a_feature /= Void then
					check
						a_class_not_void: a_class /= Void
					end
					if not a_feature.is_exported_to (current_class, universe) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vuex2b_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vuex2c_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					end
					had_error := has_fatal_error
					check_vape_validity (a_name, a_feature, a_class)
					if has_fatal_error then
						had_error := True
					end
					check_sub_actual_arguments_validity (an_actuals, a_context, a_name, a_feature, a_class)
					if had_error then
						set_fatal_error
					end
					a_type := a_feature.type
					if a_call.is_expression then
						if a_type = Void then
								-- In a call expression, `a_feature' has to be a query.
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vkcn2a_error (current_class, a_name, a_feature, a_class)
							elseif not has_implementation_error (feature_impl) then
									-- Internal error: this error should have been reported when
									-- processing the implementation of `feature_impl' or in
									-- the feature flattener when redeclaring function `a_feature'
									-- to a procedure in an ancestor of `a_class'.
								error_handler.report_giacg_error
							end
						elseif not has_fatal_error then
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases).
							if an_actuals /= Void and then an_actuals.count = 1 then
								a_like ?= a_type
								if a_like /= Void and then a_like.is_like_argument then
									formal_context.copy_type_context (a_context)
									formal_context.force_last (a_feature.arguments.formal_argument (1).type)
									a_context.wipe_out
									an_actual := an_actuals.actual_argument (1)
									check_subexpression_validity (an_actual, a_context, formal_context)
									if not has_fatal_error then
										a_convert_expression ?= an_actual
										if a_convert_expression /= Void then
											a_builtin ?= a_convert_expression.convert_feature
											if a_builtin /= Void then
													-- Needed for compatibility with ISE 5.6.0610:
													-- a formal generic parameter either conforms or converts to its constraint,
													-- then the converted version can still be chained with a conformance to
													-- `current_target_type'.
												a_context.reset (current_type)
												a_context.force_last (a_builtin.type)
											end
										end
										formal_context.remove_last
										report_qualified_call_expression (a_call.as_expression, formal_context, a_feature)
									end
								else
									report_qualified_call_expression (a_call.as_expression, a_context, a_feature)
									a_context.force_last (a_type)
								end
							else
								report_qualified_call_expression (a_call.as_expression, a_context, a_feature)
								a_context.force_last (a_type)
							end
						end
					else
						if a_type /= Void then
								-- In a call instruction, `a_feature' has to be a procedure.
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vkcn1a_error (current_class, a_name, a_feature, a_class)
							elseif not has_implementation_error (feature_impl) then
									-- Internal error: this error should have been reported when
									-- processing the implementation of `feature_impl' or in
									-- the feature flattener when redeclaring procedure `a_feature'
									-- to a function in an ancestor of `a_class'.
								error_handler.report_giach_error
							end
						elseif not has_fatal_error then
							report_qualified_call_instruction (a_call.as_instruction, a_context, a_feature)
						end
					end
				end
			end
		end

	check_regular_integer_constant_validity (a_constant: ET_REGULAR_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_type: ET_CLASS_TYPE
			a_class: ET_CLASS
			a_type: ET_TYPE
			a_cast_type: ET_TYPE
		do
			has_fatal_error := False
			a_type := universe.integer_class
			a_cast_type := a_constant.type
			if a_cast_type /= Void then
				a_class_type ?= a_cast_type.named_type (a_context, universe)
			else
				a_class_type ?= current_target_type.named_type (universe)
			end
			if a_class_type /= Void then
				a_class := a_class_type.direct_base_class (universe)
				if a_class = universe.integer_8_class then
					a_type := a_class
					a_constant.set_integer_8
					report_integer_8_constant (a_constant)
				elseif a_class = universe.integer_16_class then
					a_type := a_class
					a_constant.set_integer_16
					report_integer_16_constant (a_constant)
				elseif a_class = universe.integer_32_class then
					a_type := a_class
					a_constant.set_integer_32
					report_integer_32_constant (a_constant)
				elseif a_class = universe.integer_64_class then
					a_type := a_class
					a_constant.set_integer_64
					report_integer_64_constant (a_constant)
				elseif a_class = universe.natural_class then
					a_type := a_class
					a_constant.set_natural
					report_natural_constant (a_constant)
				elseif a_class = universe.natural_8_class then
					a_type := a_class
					a_constant.set_natural_8
					report_natural_8_constant (a_constant)
				elseif a_class = universe.natural_16_class then
					a_type := a_class
					a_constant.set_natural_16
					report_natural_16_constant (a_constant)
				elseif a_class = universe.natural_32_class then
					a_type := a_class
					a_constant.set_natural_32
					report_natural_32_constant (a_constant)
				elseif a_class = universe.natural_64_class then
					a_type := a_class
					a_constant.set_natural_64
					report_natural_64_constant (a_constant)
				else
					if a_cast_type /= Void then
-- TODO: error
					end
					a_constant.set_integer
					report_integer_constant (a_constant)
				end
			else
				if a_cast_type /= Void then
-- TODO: error
				end
				a_constant.set_integer
				report_integer_constant (a_constant)
			end
			a_context.force_last (a_type)
		end

	check_regular_manifest_string_validity (a_string: ET_REGULAR_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.string_type)
			report_string_constant (a_string)
		end

	check_regular_real_constant_validity (a_constant: ET_REGULAR_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.double_class)
			a_constant.set_double_64
			report_double_constant (a_constant)
		end

	check_result_validity (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_type: ET_TYPE
			a_class_impl: ET_CLASS
		do
			has_fatal_error := False
			if in_precondition then
					-- The entity Result appears in a precondition.
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if a_class_impl = current_class then
					error_handler.report_veen2b_error (current_class, an_expression, feature_impl)
				else
					if not has_implementation_error (feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giadm_error
					end
				end
			elseif in_invariant then
					-- The entity Result appears in an invariant.
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if a_class_impl = current_class then
					error_handler.report_veen2d_error (current_class, an_expression)
				else
					if not has_implementation_error (feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giadv_error
					end
				end
			else
					-- Use type of `current_feature' instead of `feature_impl'
					-- because when processing inherited assertions the types of signature
					-- should be those of the version of the feature in the current class.
					-- For example:
					--    deferred class A
					--    feature
					--       f: ANY is
					--           deferred
					--           ensure
					--              post: g (Result)
					--           end
					--      g (a: ANY): BOOLEAN is deferred end
					--    end
					--    class B
					--    inherit
					--        A
					--    feature
					--        f: STRING is do ... end
					--        g (a: STRING): BOOLEAN is do ... end
					--    end
					-- 'Result' in the inherited postcondition "post" should be considered
					-- of type STRING (and not ANY) is class B.
					--
					-- Use type of implementation feature because the types of the signature
					-- of `current_feature' might not have been resolved for `current_class'
					-- (when processing precursors in the context of current class).
				a_type := current_feature.implementation_feature.type
				if a_type = Void then
					set_fatal_error
					a_class_impl := feature_impl.implementation_class
					if a_class_impl = current_class then
						error_handler.report_veen2a_error (current_class, an_expression, feature_impl)
					else
						if not has_implementation_error (feature_impl) then
								-- Internal error: the VEEN-2 error should have been
								-- reported in the implementation feature.
							error_handler.report_giadf_error
						end
					end
				else
					a_type := resolved_formal_parameters (a_type, current_feature, current_type)
					if not has_fatal_error then
						a_context.force_last (a_type)
						report_result (an_expression)
					end
				end
			end
		end

	check_result_address_validity (an_expression: ET_RESULT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_type: ET_TYPE
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_class_impl: ET_CLASS
		do
			has_fatal_error := False
			if in_precondition then
					-- The entity Result appears in a precondition.
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if a_class_impl = current_class then
					error_handler.report_veen2b_error (current_class, an_expression.result_keyword, feature_impl)
				else
					if not has_implementation_error (feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giadn_error
					end
				end
			elseif in_invariant then
					-- The entity Result appears in an invariant.
				set_fatal_error
				a_class_impl := feature_impl.implementation_class
				if a_class_impl = current_class then
					error_handler.report_veen2d_error (current_class, an_expression.result_keyword)
				else
					if not has_implementation_error (feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giadw_error
					end
				end
			else
					-- Use type of `current_feature' instead of `feature_impl'
					-- because when processing inherited assertions the types of signature
					-- should be those of the version of the feature in the current class.
					-- For example:
					--    deferred class A
					--    feature
					--       f: ANY is
					--           deferred
					--           ensure
					--              post: g ($Result)
					--           end
					--      g (a: TYPED_POINTER [ANY]): BOOLEAN is deferred end
					--    end
					--    class B
					--    inherit
					--        A
					--    feature
					--        f: STRING is do ... end
					--        g (a: TYPED_POINTER [STRING]): BOOLEAN is do ... end
					--    end
					-- 'Result' in the inherited postcondition "post" should be considered
					-- of type STRING (and not ANY) is class B.
					--
					-- Use type of implementation feature because the types of the signature
					-- of `current_feature' might not have been resolved for `current_class'
					-- (when processing precursors in the context of current class).
				a_type := current_feature.implementation_feature.type
				if a_type = Void then
					set_fatal_error
					a_class_impl := feature_impl.implementation_class
					if a_class_impl = current_class then
						error_handler.report_veen2a_error (current_class, an_expression.result_keyword, feature_impl)
					else
						if not has_implementation_error (feature_impl) then
								-- Internal error: the VEEN-2 error should have been
								-- reported in the implementation feature.
							error_handler.report_giadg_error
						end
					end
				else
					a_typed_pointer_class := universe.typed_pointer_class
					if a_typed_pointer_class.is_preparsed then
							-- Class TYPED_POINTER has been found in the universe.
							-- Use ISE's implementation.
						a_type := resolved_formal_parameters (a_type, current_feature, current_type)
						if not has_fatal_error then
							create an_actuals.make_with_capacity (1)
							an_actuals.put_first (a_type)
							create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
							report_typed_pointer_expression (an_expression, a_typed_pointer_type, a_context)
							a_context.force_last (a_typed_pointer_type)
-- TODO: check that the type of TYPED_POINTER does not depend on the type of current.
						end
					else
						a_context.force_last (universe.pointer_class)
						report_pointer_expression (an_expression)
					end
				end
			end
		end

	check_special_manifest_string_validity (a_string: ET_SPECIAL_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.string_type)
			report_string_constant (a_string)
		end

	check_static_call_expression_validity (an_expression: ET_STATIC_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_static_call_validity (an_expression, a_context)
		end

	check_static_call_validity (a_call: ET_STATIC_FEATURE_CALL; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_result_type: ET_TYPE
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_type := a_call.type
			check_type_validity (a_type)
			if not has_fatal_error then
				if not a_type.is_base_type then
						-- The type used to figure out which feature to call contains formal
						-- generic parameters or anchored types whose resolved value may vary
						-- in various descendant classes/types.
					report_current_type_needed
				end
				a_name := a_call.name
				a_seed := a_name.seed
				if a_seed = 0 then
						-- We need to resolve `a_name' in the implementation
						-- class of `feature_impl' first.
					a_class_impl := feature_impl.implementation_class
					if a_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (feature_impl) then
								-- Internal error: `a_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giacl_error
						end
					else
						a_context.force_last (a_type)
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
							else
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VUEX-2 (ETL2 p.368).
								error_handler.report_vuex2a_error (current_class, a_name, a_class)
							end
						end
					end
				end
				if not has_fatal_error then
					if a_feature = Void then
						a_type := resolved_formal_parameters (a_type, feature_impl, current_type)
						if not has_fatal_error then
							a_context.force_last (a_type)
							a_class := a_context.base_class (universe)
							a_class.process (universe.interface_checker)
							if not a_class.interface_checked or else a_class.has_interface_error then
								set_fatal_error
							else
								a_feature := a_class.seeded_feature (a_seed)
								if a_feature = Void then
										-- Report internal error: if we got a seed, the
										-- `a_feature' should not be void.
									set_fatal_error
									error_handler.report_giabc_error
								end
							end
						end
					end
					if a_feature /= Void then
						universe.report_static_supplier (a_type, current_class, current_feature)
						check
							a_class_not_void: a_class /= Void
						end
						if not a_feature.is_exported_to (current_class, universe) then
								-- The feature is not exported to `current_class'.
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vuex2b_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vuex2c_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
						had_error := has_fatal_error
						check_vape_validity (a_name, a_feature, a_class)
						if has_fatal_error then
							had_error := True
						end
						check_sub_actual_arguments_validity (a_call.arguments, a_context, a_name, a_feature, a_class)
						if had_error then
							set_fatal_error
						end
						a_result_type := a_feature.type
						if a_call.is_expression then
-- TODO: check that `a_feature' is a constant attribute or an external function.
							if a_result_type = Void then
									-- In a call expression, `a_feature' has to be a query.
								set_fatal_error
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vkcn2a_error (current_class, a_name, a_feature, a_class)
								elseif not has_implementation_error (feature_impl) then
										-- Internal error: this error should have been reported when
										-- processing the implementation of `feature_impl' or in
										-- the feature flattener when redeclaring function `a_feature'
										-- to a procedure in an ancestor of `a_class'.
									error_handler.report_giacm_error
								end
							elseif not has_fatal_error then
-- TODO: like argument.
								a_context.force_last (a_result_type)
								report_static_call_expression (a_call.as_expression, a_type, a_feature)
							end
						else
-- TODO: check that `a_feature' is an external procedure.
							if a_result_type /= Void then
									-- In a call instruction, `a_feature' has to be a procedure.
								set_fatal_error
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vkcn1a_error (current_class, a_name, a_feature, a_class)
								elseif not has_implementation_error (feature_impl) then
										-- Internal error: this error should have been reported when
										-- processing the implementation of `feature_impl' or in
										-- the feature flattener when redeclaring procedure `a_feature'
										-- to a function in an ancestor of `a_class'.
									error_handler.report_giacn_error
								end
							elseif not has_fatal_error then
								report_static_call_instruction (a_call.as_instruction, a_type, a_feature)
							end
						end
					end
				end
			end
		end

	check_strip_expression_validity (an_expression: ET_STRIP_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			a_name, other_name: ET_FEATURE_NAME
			a_seed: INTEGER
			i, j, nb: INTEGER
			a_feature: ET_FEATURE
			had_error: BOOLEAN
			already_checked: BOOLEAN
		do
			has_fatal_error := False
-- TODO: does the type of the strip expression depend on the type of current?
			nb := an_expression.count
			from i := 1 until i > nb loop
				a_name := an_expression.feature_name (i)
				a_seed := a_name.seed
				had_error := False
				already_checked := False
				if a_seed = 0 then
					had_error := True
						-- We need to resolve `a_name' in the implementation
						-- class of `feature_impl' first.
					a_class_impl := feature_impl.implementation_class
					if a_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (feature_impl) then
								-- Internal error: `a_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giadh_error
						end
					else
						current_class.process (universe.interface_checker)
						if not current_class.interface_checked or else current_class.has_interface_error then
							set_fatal_error
						else
							a_feature := current_class.named_feature (a_name)
							if a_feature = Void then
								set_fatal_error
								error_handler.report_vwst1a_error (current_class, a_name)
							else
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
								if not a_feature.is_attribute then
									set_fatal_error
									error_handler.report_vwst1b_error (current_class, a_name, a_feature)
								else
									had_error := False
									already_checked := True
								end
							end
						end
						from j := 1 until j >= i loop
							other_name := an_expression.feature_name (j)
							if a_name.same_feature_name (other_name) then
								had_error := True
								set_fatal_error
								error_handler.report_vwst2a_error (current_class, other_name, a_name)
							end
							j := j + 1
						end
					end
				end
				if not had_error and not already_checked then
					current_class.process (universe.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.seeded_feature (a_seed)
						if a_feature = Void then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaaw_error
						else
							if not a_feature.is_attribute then
								set_fatal_error
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vwst1b_error (current_class, a_name, a_feature)
								elseif not has_implementation_error (feature_impl) then
										-- Internal error: this error should have been reported when
										-- processing the implementation of `feature_impl' or in
										-- the feature flattener when redeclaring attribute `a_feature'
										-- to a non-attribute in an ancestor of `current_class'.
									error_handler.report_giadi_error
								end
							end
						end
					end
				end
				i := i + 1
			end
			if not has_fatal_error then
				report_strip_expression (an_expression, universe.array_any_type, a_context)
				a_context.force_last (universe.array_any_type)
			end
		end

	check_true_constant_validity (a_constant: ET_TRUE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.boolean_class)
			report_boolean_constant (a_constant)
		end

	check_underscored_integer_constant_validity (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_type: ET_CLASS_TYPE
			a_class: ET_CLASS
			a_type: ET_TYPE
			a_cast_type: ET_TYPE
		do
			has_fatal_error := False
			a_type := universe.integer_class
			a_cast_type := a_constant.type
			if a_cast_type /= Void then
				a_class_type ?= a_cast_type.named_type (a_context, universe)
			else
				a_class_type ?= current_target_type.named_type (universe)
			end
			if a_class_type /= Void then
				a_class := a_class_type.direct_base_class (universe)
				if a_class = universe.integer_8_class then
					a_type := a_class
					a_constant.set_integer_8
					report_integer_8_constant (a_constant)
				elseif a_class = universe.integer_16_class then
					a_type := a_class
					a_constant.set_integer_16
					report_integer_16_constant (a_constant)
				elseif a_class = universe.integer_32_class then
					a_type := a_class
					a_constant.set_integer_32
					report_integer_32_constant (a_constant)
				elseif a_class = universe.integer_64_class then
					a_type := a_class
					a_constant.set_integer_64
					report_integer_64_constant (a_constant)
				elseif a_class = universe.natural_class then
					a_type := a_class
					a_constant.set_natural
					report_natural_constant (a_constant)
				elseif a_class = universe.natural_8_class then
					a_type := a_class
					a_constant.set_natural_8
					report_natural_8_constant (a_constant)
				elseif a_class = universe.natural_16_class then
					a_type := a_class
					a_constant.set_natural_16
					report_natural_16_constant (a_constant)
				elseif a_class = universe.natural_32_class then
					a_type := a_class
					a_constant.set_natural_32
					report_natural_32_constant (a_constant)
				elseif a_class = universe.natural_64_class then
					a_type := a_class
					a_constant.set_natural_64
					report_natural_64_constant (a_constant)
				else
					if a_cast_type /= Void then
-- TODO: error
					end
					a_constant.set_integer
					report_integer_constant (a_constant)
				end
			else
				if a_cast_type /= Void then
-- TODO: error
				end
				a_constant.set_integer
				report_integer_constant (a_constant)
			end
			a_context.force_last (a_type)
		end

	check_underscored_real_constant_validity (a_constant: ET_UNDERSCORED_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.double_class)
			a_constant.set_double_64
			report_double_constant (a_constant)
		end

	check_unqualified_call_validity (a_call: ET_FEATURE_CALL; is_expression: BOOLEAN; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of unqualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
			is_expression: is_expression implies a_call.is_expression
			is_instruction: not is_expression implies a_call.is_instruction
			a_context_not_void: a_context /= Void
		local
			a_name: ET_CALL_NAME
			an_actuals: ET_ACTUAL_ARGUMENTS
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			an_identifier: ET_IDENTIFIER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_like: ET_LIKE_FEATURE
			had_error: BOOLEAN
			an_actual: ET_EXPRESSION
			a_convert_expression: ET_CONVERT_EXPRESSION
			a_builtin: ET_BUILTIN_CONVERT_FEATURE
		do
			has_fatal_error := False
				-- This is an unqualified call, so there is a good chance that we
				-- will need the type of current to figure out which feature to call.
			report_current_type_needed
			a_name := a_call.name
			an_actuals := a_call.arguments
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `feature_impl' first.
				a_class_impl := feature_impl.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaci_error
					end
				else
					current_class.process (universe.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.named_feature (a_name)
						if a_feature /= Void then
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
						else
								-- Check whether it is a formal argument or a local variable.
							an_identifier ?= a_name
							if an_identifier /= Void then
								an_arguments := feature_impl.arguments
								if an_arguments /= Void then
									a_seed := an_arguments.index_of (an_identifier)
									if a_seed /= 0 then
											-- `a_name' is a fomal argument.
										if an_actuals /= Void then
												-- Syntax error: a formal argument cannot have arguments.
											set_fatal_error
											error_handler.report_gvuaa0a_error (current_class, an_identifier, feature_impl)
										end
											-- Do not set the seed of `an_identifier' so that we report
											-- this error again when checked in a descendant class.
										an_identifier.set_argument (True)
										if not is_expression then
												-- Syntax error: a formal argument cannot be an instruction.
											set_fatal_error
												-- Note: ISE 5.4 reports a VKCN-1 here. However
												-- `a_name' is not a function nor an attribute name.
											error_handler.report_gvuia0a_error (current_class, an_identifier, feature_impl)
										else
											if not has_fatal_error then
													-- Make sure that we report the correct error when
													-- it appears in an invariant.
												an_identifier.set_seed (a_seed)
												check_expression_validity (an_identifier, a_context, universe.any_type, feature_impl, current_feature, current_type)
												an_identifier.set_seed (0)
											end
											if not has_fatal_error then
													-- Internal error: the parser should not have
													-- generated a feature call.
												set_fatal_error
												error_handler.report_giaby_error
											end
										end
									end
								end
								if a_seed = 0 then
									a_locals := feature_impl.locals
									if a_locals /= Void then
										a_seed := a_locals.index_of (an_identifier)
										if a_seed /= 0 then
												-- `a_name' is a local variable.
											if an_actuals /= Void then
													-- Syntax error: a local variable cannot have arguments.
												set_fatal_error
												error_handler.report_gvual0a_error (current_class, an_identifier, feature_impl)
											end
												-- Do not set the seed of `an_identifier' so that we report
												-- this error again when checked in a descendant class.
											an_identifier.set_local (True)
											if not is_expression then
													-- Syntax error: a local variable cannot be an instruction.
												set_fatal_error
													-- Note: ISE 5.4 reports a VKCN-1 here. However
													-- `a_name' is not a function nor an attribute name.
												error_handler.report_gvuil0a_error (current_class, an_identifier, feature_impl)
											else
												if not has_fatal_error then
														-- Make sure that we report the correct error when
														-- it appears in a precondition or invariant.
													an_identifier.set_seed (a_seed)
													check_expression_validity (an_identifier, a_context, universe.any_type, feature_impl, current_feature, current_type)
													an_identifier.set_seed (0)
												end
												if not has_fatal_error then
														-- Internal error: the parser should not have
														-- generated a feature call.
													set_fatal_error
													error_handler.report_giabz_error
												end
											end
										end
									end
								end
							end
							if a_seed = 0 then
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VUEX-1 (ETL2 p.368).
								error_handler.report_vuex1a_error (current_class, a_name)
							end
						end
					end
				end
			end
			if not has_fatal_error then
				if a_feature = Void then
					current_class.process (universe.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.seeded_feature (a_seed)
						if a_feature = Void then
								-- Report internal error: if we got a seed, the
								-- `a_feature' should not be void.
							set_fatal_error
							error_handler.report_giabe_error
						end
					end
				end
				if a_feature /= Void then
					check_vape_validity (a_name, a_feature, Void)
					had_error := has_fatal_error
					check_sub_actual_arguments_validity (an_actuals, a_context, a_name, a_feature, Void)
					if has_fatal_error then
						had_error := True
					end
					if had_error then
						set_fatal_error
					end
					a_type := a_feature.type
					if is_expression then
						if a_type = Void then
								-- In a call expression, `a_feature' has to be a query.
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vkcn2c_error (current_class, a_name, a_feature)
							elseif not has_implementation_error (feature_impl) then
									-- Internal error: this error should have been reported when
									-- processing the implementation of `feature_impl' or in
									-- the feature flattener when redeclaring function `a_feature'
									-- to a procedure in an ancestor of `current_class'.
								error_handler.report_giacj_error
							end
						elseif not has_fatal_error then
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases).
							if an_actuals /= Void and then an_actuals.count = 1 then
								a_like ?= a_type
								if a_like /= Void and then a_like.is_like_argument then
									formal_context.reset (current_type)
									formal_context.force_last (a_feature.arguments.formal_argument (1).type)
									a_context.wipe_out
									an_actual := an_actuals.actual_argument (1)
									check_subexpression_validity (an_actual, a_context, formal_context)
									a_convert_expression ?= an_actual
									if a_convert_expression /= Void then
										a_builtin ?= a_convert_expression.convert_feature
										if a_builtin /= Void then
												-- Needed for compatibility with ISE 5.6.0610:
												-- a formal generic parameter either conforms or converts to its constraint,
												-- then the converted version can still be chained with a conformance to
												-- `current_target_type'.
											a_context.reset (current_type)
											a_context.force_last (a_builtin.type)
										end
									end
								else
									a_context.force_last (a_type)
								end
							else
								a_context.force_last (a_type)
							end
							report_unqualified_call_expression (a_call.as_expression, a_feature)
						end
					else
						if a_type /= Void then
								-- In a call instruction, `a_feature' has to be a procedure.
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vkcn1c_error (current_class, a_name, a_feature)
							elseif not has_implementation_error (feature_impl) then
									-- Internal error: this error should have been reported when
									-- processing the implementation of `feature_impl' or in
									-- the feature flattener when redeclaring procedure `a_feature'
									-- to a function in an ancestor of `current_class'.
								error_handler.report_giack_error
							end
						elseif not has_fatal_error then
							report_unqualified_call_instruction (a_call.as_instruction, a_feature)
						end
					end
				end
			end
		end

	check_verbatim_string_validity (a_string: ET_VERBATIM_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.string_type)
			report_string_constant (a_string)
		end

	check_void_validity (an_expression: ET_VOID; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (universe.none_type)
			report_void_constant (an_expression)
		end

	check_vape_validity (a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check VAPE validity rule when calling `a_feature' named `a_name'
			-- in a precondition of `current_feature' in `current_class'.
			-- `a_class' is the base class of the target, or void in case of
			-- an unqualified call.
			-- The validity rule VAPE says that all features which are called
			-- in a precondition of a feature `f' should be exported to every
			-- class to which `f' is exported.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			l_void_seed: INTEGER
			l_feature_clients: ET_CLASS_NAME_LIST
			l_clients: ET_CLASS_NAME_LIST
			l_client_name: ET_CLASS_NAME
			l_client: ET_CLASS
			i, nb: INTEGER
			a_class_impl: ET_CLASS
		do
			has_fatal_error := False
			if in_precondition then
					-- VAPE validity rule only applies to preconditions.
				l_void_seed := universe.void_seed
				if l_void_seed > 0 and then a_feature.has_seed (l_void_seed) then
					-- Note: ISE Eiffel does not report VAPE when `a_feature' is the Void feature.
					-- However ETL says it should be reported (it does not mention a special
					-- case for `Void').
				else
					l_feature_clients := a_feature.clients
					l_clients := current_feature.clients
					nb := l_clients.count
					from i := 1 until i > nb loop
						l_client_name := l_clients.class_name (i)
						if l_client_name.same_class_name (universe.none_class.name) then
							-- NONE is a descendant of all classes.
						elseif universe.has_class (l_client_name) then
							l_client := universe.eiffel_class (l_client_name)
							if not a_feature.is_exported_to (l_client, universe) then
									-- The feature is not exported to `l_client'.
								set_fatal_error
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									if a_class = Void then
										error_handler.report_vape0a_error (current_class, a_name, a_feature, current_feature, l_client)
									else
										error_handler.report_vape0c_error (current_class, a_name, a_feature, a_class, current_feature, l_client)
									end
								else
									if a_class = Void then
										error_handler.report_vape0b_error (current_class, a_class_impl, a_name, a_feature, current_feature, l_client)
									else
										error_handler.report_vape0d_error (current_class, a_class_impl, a_name, a_feature, a_class, current_feature, l_client)
									end
								end
							end
						elseif not l_feature_clients.has_class_name (l_client_name) and then not l_feature_clients.has_any then
								-- The feature is not exported to `l_client_name'.
								-- Note that `l_client_name' is not a class in the universe.
								-- Therefore we expect this class name to be explicitly
								-- listed in the client list of `a_feature' or that `a_feature'
								-- be exported to ANY.
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								if a_class = Void then
									error_handler.report_vape0e_error (current_class, a_name, a_feature, current_feature, l_client_name)
								else
									error_handler.report_vape0g_error (current_class, a_name, a_feature, a_class, current_feature, l_client_name)
								end
							else
								if a_class = Void then
									error_handler.report_vape0f_error (current_class, a_class_impl, a_name, a_feature, current_feature, l_client_name)
								else
									error_handler.report_vape0h_error (current_class, a_class_impl, a_name, a_feature, a_class, current_feature, l_client_name)
								end
							end
						end
						i := i + 1
					end
				end
			end
		end

	check_subexpression_validity (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_target_type: ET_TYPE_CONTEXT) is
			-- Check validity of `an_expression' (whose target is of type
			-- `a_target_type') in `current_feature' of `current_type'.
			-- If no fatal error occurred, then the type of `an_expression'
			-- is appended to `a_context'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
		do
			if expression_checker = Void then
				expression_checker := new_expression_checker
			end
			expression_checker.set_state (Current)
			expression_checker.check_expression_validity (an_expression, a_context, a_target_type, feature_impl, current_feature, current_type)
			if expression_checker.has_fatal_error then
				set_fatal_error
			else
				has_fatal_error := False
			end
		end

	check_sub_actual_arguments_validity (an_actuals: ET_ACTUAL_ARGUMENTS; a_context: ET_NESTED_TYPE_CONTEXT;
		a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check actual arguments validity when calling `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_context_not_void: a_context /= Void
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			if expression_checker = Void then
				expression_checker := new_expression_checker
			end
			expression_checker.set_state (Current)
			expression_checker.check_actual_arguments_validity (an_actuals, a_context, a_name, a_feature, a_class, feature_impl, current_feature, current_type)
			if expression_checker.has_fatal_error then
				set_fatal_error
			else
				has_fatal_error := False
			end
		end

	new_expression_checker: like Current is
			-- New sub-expression checker
		do
			create Result.make_from_checker (Current)
		ensure
			new_expression_checker_not_void: Result /= Void
		end

	expression_checker: like Current
			-- Sub-expression validity checker

feature {NONE} -- Agent validity

	check_call_agent_validity (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_target: ET_AGENT_TARGET
			an_expression_target: ET_EXPRESSION
			a_type_target: ET_AGENT_OPEN_TARGET
		do
			a_target := an_expression.target
			if a_target = Void then
				check_unqualified_call_agent_validity (an_expression, a_context)
			else
				an_expression_target ?= a_target
				if an_expression_target /= Void then
					check_qualified_call_agent_validity (an_expression, an_expression_target, a_context)
				else
					a_type_target ?= a_target
					if a_type_target /= Void then
						check_typed_call_agent_validity (an_expression, a_type_target, a_context)
					else
							-- Internal error: no other kind of targets.
						set_fatal_error
						error_handler.report_giaca_error
					end
				end
			end
		end

	check_unqualified_call_agent_validity (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of unqualified call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: an_expression.target = Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			an_actuals: ET_AGENT_ARGUMENT_OPERANDS
			an_implicit_actuals: ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST
			an_implicit_actual: ET_AGENT_IMPLICIT_OPEN_ARGUMENT
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_CLASS
			had_error: BOOLEAN
			i, nb: INTEGER
		do
-- TODO: do we need to call `report_current_type_needed'.
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `feature_impl' first.
				a_class_impl := feature_impl.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giact_error
					end
				else
					current_class.process (universe.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.named_feature (a_name)
						if a_feature /= Void then
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
							an_actuals := an_expression.arguments
							if an_actuals = Void then
								a_formal_arguments := a_feature.arguments
								if a_formal_arguments /= Void and then not a_formal_arguments.is_empty then
									nb := a_formal_arguments.count
									create an_implicit_actuals.make_with_capacity (nb)
									from i := 1 until i > nb loop
										create an_implicit_actual.make (an_expression, i)
										an_implicit_actuals.put_last (an_implicit_actual)
										i := i + 1
									end
									an_expression.set_arguments (an_implicit_actuals)
								end
							end
						else
							set_fatal_error
								-- ISE Eiffel 5.4 reports this error as a VEEN,
								-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
							error_handler.report_vpca1a_error (current_class, a_name)
						end
					end
				end
			end
			if not has_fatal_error then
				if a_feature = Void then
					current_class.process (universe.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.seeded_feature (a_seed)
						if a_feature = Void then
								-- Report internal error: if we got a seed, the
								-- `a_feature' should not be void.
							set_fatal_error
							error_handler.report_giacb_error
						end
					end
				end
				if a_feature /= Void then
					check_vape_validity (a_name, a_feature, Void)
					if has_fatal_error then
						had_error := True
					end
					a_formal_arguments := a_feature.arguments
					if a_formal_arguments /= Void then
						create an_open_operands.make_with_capacity (a_formal_arguments.count)
					end
					an_actuals := an_expression.arguments
					check_agent_arguments_validity (an_actuals, a_context, a_name, a_feature, Void, an_open_operands)
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						create a_tuple_type.make (an_open_operands)
						a_type := a_feature.type
						if a_type = Void then
								-- This is a procedure.
							an_agent_class := universe.procedure_class
							create a_parameters.make_with_capacity (2)
							a_parameters.put_first (a_tuple_type)
							a_parameters.put_first (current_type)
							create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
						else
-- TODO: like argument
-- PREDICATE is not supported in ISE Eiffel and it is a user-define class
-- at AXA Rosenberg.
--							if
--								universe.predicate_class.is_preparsed and then
--								a_type.same_named_type (universe.boolean_class, current_type, current_type, universe)
--							then
--								an_agent_class := universe.predicate_class
--								create a_parameters.make_with_capacity (2)
--								a_parameters.put_first (a_tuple_type)
--								a_parameters.put_first (current_type)
--								create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
--							else
								an_agent_class := universe.function_class
								create a_parameters.make_with_capacity (3)
								a_parameters.put_first (a_type)
								a_parameters.put_first (a_tuple_type)
								a_parameters.put_first (current_type)
								create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
--							end
						end
						report_unqualified_call_agent (an_expression, a_feature, an_agent_type, a_context)
						a_context.force_last (an_agent_type)
					end
				end
			end
		end

	check_qualified_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			an_actuals: ET_AGENT_ARGUMENT_OPERANDS
			an_implicit_actuals: ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST
			an_implicit_actual: ET_AGENT_IMPLICIT_OPEN_ARGUMENT
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			any_type: ET_CLASS_TYPE
			a_target_type: ET_TYPE
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_CLASS
			had_error: BOOLEAN
			i, nb: INTEGER
		do
-- TODO: do we need to call `report_current_type_needed'.
			has_fatal_error := False
			a_name := an_expression.name
			any_type := universe.any_type
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `feature_impl' first.
				a_class_impl := feature_impl.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giacu_error
					end
				else
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
					check_expression_validity (a_target, a_context, any_type, feature_impl, current_feature, current_type)
					if not has_fatal_error then
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
								an_actuals := an_expression.arguments
								if an_actuals = Void then
									a_formal_arguments := a_feature.arguments
									if a_formal_arguments /= Void and then not a_formal_arguments.is_empty then
										nb := a_formal_arguments.count
										create an_implicit_actuals.make_with_capacity (nb)
										from i := 1 until i > nb loop
											create an_implicit_actual.make (an_expression, i)
											an_implicit_actuals.put_last (an_implicit_actual)
											i := i + 1
										end
										an_expression.set_arguments (an_implicit_actuals)
									end
								end
							else
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
								error_handler.report_vpca1b_error (current_class, a_name, a_class)
							end
						end
					end
				end
			end
			if not has_fatal_error then
				if a_feature = Void then
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
					check_expression_validity (a_target, a_context, any_type, feature_impl, current_feature, current_type)
					if not has_fatal_error then
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.seeded_feature (a_seed)
							if a_feature = Void then
									-- Report internal error: if we got a seed, the
									-- `a_feature' should not be void.
								set_fatal_error
								error_handler.report_giacc_error
							end
						end
					end
				end
				if a_feature /= Void then
					check
						a_class_not_void: a_class /= Void
					end
					if not a_feature.is_exported_to (current_class, universe) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						a_class_impl := feature_impl.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vpca2a_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vpca2b_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					end
					had_error := has_fatal_error
					check_vape_validity (a_name, a_feature, a_class)
					if has_fatal_error then
						had_error := True
					end
					a_formal_arguments := a_feature.arguments
					if a_formal_arguments /= Void then
						create an_open_operands.make_with_capacity (a_formal_arguments.count)
					end
					an_actuals := an_expression.arguments
					check_agent_arguments_validity (an_actuals, a_context, a_name, a_feature, a_class, an_open_operands)
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						a_target_type := tokens.like_current
						create a_tuple_type.make (an_open_operands)
						a_type := a_feature.type
						if a_type = Void then
								-- This is a procedure.
							an_agent_class := universe.procedure_class
							create a_parameters.make_with_capacity (2)
							a_parameters.put_first (a_tuple_type)
							a_parameters.put_first (a_target_type)
							create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
						else
-- TODO: like argument
-- PREDICATE is not supported in ISE Eiffel and it is a user-define class
-- at AXA Rosenberg.
--							if
--								universe.predicate_class.is_preparsed and then
--								a_type.same_named_type (universe.boolean_class, current_type, current_type, universe)
--							then
--								an_agent_class := universe.predicate_class
--								create a_parameters.make_with_capacity (2)
--								a_parameters.put_first (a_tuple_type)
--								a_parameters.put_first (a_target_type)
--								create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
--							else
								an_agent_class := universe.function_class
								create a_parameters.make_with_capacity (3)
								a_parameters.put_first (a_type)
								a_parameters.put_first (a_tuple_type)
								a_parameters.put_first (a_target_type)
								create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
--							end
						end
						report_qualified_call_agent (an_expression, a_feature, an_agent_type, a_context)
						a_context.force_last (an_agent_type)
					end
				end
			end
		end

	check_typed_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of typed call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			an_actuals: ET_AGENT_ARGUMENT_OPERANDS
			an_implicit_actuals: ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST
			an_implicit_actual: ET_AGENT_IMPLICIT_OPEN_ARGUMENT
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_result_type: ET_TYPE
			a_seed: INTEGER
			a_target_type: ET_TYPE
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_CLASS
			had_error: BOOLEAN
			i, nb: INTEGER
		do
-- TODO: do we need to call `report_current_type_needed'.
			has_fatal_error := False
			a_name := an_expression.name
			a_target_type := a_target.type
			check_type_validity (a_target_type)
			if not has_fatal_error then
				a_seed := a_name.seed
				if a_seed = 0 then
						-- We need to resolve `a_name' in the implementation
						-- class of `feature_impl' first.
					a_class_impl := feature_impl.implementation_class
					if a_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (feature_impl) then
								-- Internal error: `a_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giacv_error
						end
					else
						a_context.force_last (a_target_type)
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
								an_actuals := an_expression.arguments
								if an_actuals = Void then
									a_formal_arguments := a_feature.arguments
									if a_formal_arguments /= Void and then not a_formal_arguments.is_empty then
										nb := a_formal_arguments.count
										create an_implicit_actuals.make_with_capacity (nb)
										from i := 1 until i > nb loop
											create an_implicit_actual.make (an_expression, i)
											an_implicit_actuals.put_last (an_implicit_actual)
											i := i + 1
										end
										an_expression.set_arguments (an_implicit_actuals)
									end
								end
							else
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
								error_handler.report_vpca1b_error (current_class, a_name, a_class)
							end
						end
					end
				end
				if not has_fatal_error then
					if a_feature = Void then
						a_target_type := resolved_formal_parameters (a_target_type, feature_impl, current_type)
						if not has_fatal_error then
							a_context.force_last (a_target_type)
							a_class := a_context.base_class (universe)
							a_class.process (universe.interface_checker)
							if not a_class.interface_checked or else a_class.has_interface_error then
								set_fatal_error
							else
								a_feature := a_class.seeded_feature (a_seed)
								if a_feature = Void then
										-- Report internal error: if we got a seed, the
										-- `a_feature' should not be void.
									set_fatal_error
									error_handler.report_giacd_error
								end
							end
						end
					end
					if a_feature /= Void then
						check
							a_class_not_void: a_class /= Void
						end
						if not a_feature.is_exported_to (current_class, universe) then
								-- The feature is not exported to `current_class'.
							set_fatal_error
							a_class_impl := feature_impl.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vpca2a_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vpca2b_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
						had_error := has_fatal_error
						check_vape_validity (a_name, a_feature, a_class)
						if has_fatal_error then
							had_error := True
						end
						a_formal_arguments := a_feature.arguments
						if a_formal_arguments /= Void then
							create an_open_operands.make_with_capacity (a_formal_arguments.count + 1)
						else
							create an_open_operands.make_with_capacity (1)
						end
						an_actuals := an_expression.arguments
						check_agent_arguments_validity (an_actuals, a_context, a_name, a_feature, a_class, an_open_operands)
						if had_error then
							set_fatal_error
						end
						if not has_fatal_error then
							a_target_type := tokens.like_current
							an_open_operands.put_first (a_target_type)
							create a_tuple_type.make (an_open_operands)
							a_result_type := a_feature.type
							if a_result_type = Void then
									-- This is a procedure.
								an_agent_class := universe.procedure_class
								create a_parameters.make_with_capacity (2)
								a_parameters.put_first (a_tuple_type)
								a_parameters.put_first (a_target_type)
								create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
							else
-- TODO: like argument
-- PREDICATE is not supported in ISE Eiffel and it is a user-define class
-- at AXA Rosenberg.
--								if
--									universe.predicate_class.is_preparsed and then
--									a_result_type.same_named_type (universe.boolean_class, current_type, current_type, universe)
--								then
--									an_agent_class := universe.predicate_class
--									create a_parameters.make_with_capacity (2)
--									a_parameters.put_first (a_tuple_type)
--									a_parameters.put_first (a_target_type)
--									create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
--								else
									an_agent_class := universe.function_class
									create a_parameters.make_with_capacity (3)
									a_parameters.put_first (a_result_type)
									a_parameters.put_first (a_tuple_type)
									a_parameters.put_first (a_target_type)
									create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
--								end
							end
							report_qualified_call_agent (an_expression, a_feature, an_agent_type, a_context)
							a_context.force_last (an_agent_type)
						end
					end
				end
			end
		end

	check_agent_arguments_validity (an_actuals: ET_AGENT_ARGUMENT_OPERANDS;
		a_context: ET_NESTED_TYPE_CONTEXT; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_class: ET_CLASS; an_open_operands: ET_ACTUAL_PARAMETER_LIST) is
			-- Check actual arguments validity for agent on `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call. `an_open_operands', when
			-- not Void, is where to store the types of open operands.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_context_not_void: a_context /= Void
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			l_actual_list: ET_AGENT_ARGUMENT_OPERAND_LIST
			a_class_impl: ET_CLASS
			an_agent_actual: ET_AGENT_ARGUMENT_OPERAND
			an_actual: ET_EXPRESSION
			an_agent_type: ET_AGENT_TYPED_OPEN_ARGUMENT
			an_actual_type: ET_TYPE
			a_question_mark: ET_QUESTION_MARK_SYMBOL
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			had_error: BOOLEAN
			an_actual_named_type: ET_NAMED_TYPE
			a_formal_named_type: ET_NAMED_TYPE
			a_convert_feature: ET_CONVERT_FEATURE
			a_convert_name: ET_FEATURE_NAME
			a_conversion_feature: ET_FEATURE
			a_convert_expression: ET_CONVERT_EXPRESSION
			a_convert_to_expression: ET_CONVERT_TO_EXPRESSION
			a_convert_class: ET_CLASS
			an_argument_comma: ET_AGENT_ARGUMENT_OPERAND_COMMA
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_formal_type: ET_TYPE
		do
			has_fatal_error := False
			a_formals := a_feature.arguments
			l_actual_list ?= an_actuals
			if l_actual_list = Void then
				if a_formals /= Void and an_open_operands /= Void then
					nb := a_formals.count
					from i := nb until i < 1 loop
						l_formal_type := a_formals.formal_argument (i).type
						an_open_operands.force_first (l_formal_type)
						i := i - 1
					end
				end
			else
				a_class_impl := feature_impl.implementation_class
				if l_actual_list.is_empty then
					if a_formals /= Void and then not a_formals.is_empty then
						set_fatal_error
						if current_class = a_class_impl then
							if a_class /= Void then
								error_handler.report_vpca3a_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vpca3c_error (current_class, a_name, a_feature)
							end
						elseif not has_implementation_error (feature_impl) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `feature_impl' or in
								-- the feature flattener when redeclaring `a_feature' in an
								-- ancestor of `a_class' or `current_class'.
							error_handler.report_giacw_error
						end
					end
				elseif a_formals = Void or else a_formals.count /= l_actual_list.count then
					set_fatal_error
					if current_class = a_class_impl then
						if a_class /= Void then
							error_handler.report_vpca3a_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vpca3c_error (current_class, a_name, a_feature)
						end
					elseif not has_implementation_error (feature_impl) then
							-- Internal error: this error should have been reported when
							-- processing the implementation of `feature_impl' or in
							-- the feature flattener when redeclaring `a_feature' in an
							-- ancestor of `a_class' or `current_class'.
						error_handler.report_giacx_error
					end
				else
						-- Do not use `actual_context' because it might already have
						-- been used in `check_actual_arguments_validity'. Use
						-- `expression_context' instead.
					l_actual_context := expression_context
					l_actual_context.reset (current_type)
					l_formal_context := a_context
					l_formal_type := tokens.like_current
					nb := l_actual_list.count
					from i := nb until i < 1 loop
						a_formal := a_formals.formal_argument (i)
						an_agent_actual := l_actual_list.actual_argument (i)
						an_actual ?= an_agent_actual
						if an_actual /= Void then
							has_fatal_error := False
							l_formal_context.force_last (a_formal.type)
							check_subexpression_validity (an_actual, l_actual_context, l_formal_context)
							if has_fatal_error then
								had_error := True
							elseif not l_actual_context.conforms_to_type (l_formal_type, l_formal_context, universe) then
								a_class_impl := feature_impl.implementation_class
								if current_class = a_class_impl then
									a_convert_feature := type_checker.convert_feature (l_actual_context, l_formal_context)
								else
										-- Convertibility should be resolved in the implementation class.
									a_convert_feature := Void
								end
								if a_convert_feature /= Void then
									if a_convert_feature.is_convert_from then
										a_convert_class := l_formal_context.base_class (universe)
									elseif a_convert_feature.is_convert_to then
										a_convert_class := l_actual_context.base_class (universe)
									else
										a_convert_class := Void
									end
									if a_convert_class /= Void then
										a_convert_class.process (universe.feature_flattener)
										if not a_convert_class.features_flattened or else a_convert_class.has_flattening_error then
												-- Error already reported by the feature flattener.
											had_error := True
											set_fatal_error
											a_convert_feature := Void
										end
									end
									if a_convert_feature /= Void then
											-- Insert the conversion feature call in the AST.
										if a_convert_feature.is_convert_to then
											create a_convert_to_expression.make (an_actual, a_convert_feature)
											a_convert_expression := a_convert_to_expression
											a_convert_name := a_convert_feature.name
											a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
											if a_conversion_feature /= Void then
												report_qualified_call_expression (a_convert_to_expression, l_actual_context, a_conversion_feature)
											else
													-- Internal error: the seed of the convert feature should correspond
													-- to a feature of `a_convert_class'.
												set_fatal_error
												error_handler.report_gibdv_error
											end
										elseif a_convert_feature.is_convert_from then
											create a_convert_expression.make (an_actual, a_convert_feature)
											a_convert_name := a_convert_feature.name
											a_conversion_feature := a_convert_class.seeded_feature (a_convert_name.seed)
											if a_conversion_feature /= Void then
												report_creation_expression (a_convert_to_expression, l_actual_context.named_type (universe), a_conversion_feature, an_actual)
											else
													-- Internal error: the seed of the convert feature should correspond
													-- to a feature of `a_convert_class'.
												set_fatal_error
												error_handler.report_gibai_error
											end
										else
											create a_convert_expression.make (an_actual, a_convert_feature)
											a_convert_expression.set_index (an_actual.index)
										end
										an_argument_comma ?= l_actual_list.item (i)
										if an_argument_comma /= Void then
											an_argument_comma.set_agent_actual_argument (a_convert_expression)
										else
											l_actual_list.put (a_convert_expression, i)
										end
									end
								else
									had_error := True
									set_fatal_error
									an_actual_named_type := l_actual_context.named_type (universe)
									a_formal_named_type := l_formal_context.named_type (universe)
									if a_class /= Void then
										if current_class = a_class_impl then
											error_handler.report_vpca4a_error (current_class, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
										else
											error_handler.report_vpca4b_error (current_class, a_class_impl, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
										end
									else
										if current_class = a_class_impl then
											error_handler.report_vpca4c_error (current_class, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
										else
											error_handler.report_vpca4d_error (current_class, a_class_impl, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
										end
									end
								end
							end
							l_formal_context.remove_last
							l_actual_context.wipe_out
						else
							an_agent_type ?= an_agent_actual
							if an_agent_type /= Void then
								an_actual_type := an_agent_type.type
								check_type_validity (an_actual_type)
								if has_fatal_error then
									had_error := True
								else
									an_actual_type := resolved_formal_parameters (an_actual_type, feature_impl, current_type)
									if has_fatal_error then
										had_error := True
									elseif not an_actual_type.conforms_to_type (a_formal.type, l_formal_context, current_type, universe) then
-- Note: VPCA-5 says nothing about type convertibility.
										had_error := True
										set_fatal_error
										an_actual_named_type := an_actual_type.named_type (current_type, universe)
										a_formal_named_type := a_formal.type.named_type (l_formal_context, universe)
										if a_class /= Void then
											if current_class = a_class_impl then
												error_handler.report_vpca5a_error (current_class, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
											else
												error_handler.report_vpca5b_error (current_class, a_class_impl, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
											end
										else
											if current_class = a_class_impl then
												error_handler.report_vpca5c_error (current_class, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
											else
												error_handler.report_vpca5d_error (current_class, a_class_impl, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
											end
										end
									else
										if an_open_operands /= Void then
											an_open_operands.force_first (an_actual_type)
										end
									end
								end
							else
								a_question_mark ?= an_agent_actual
								if a_question_mark /= Void then
									if an_open_operands /= Void then
										an_open_operands.force_first (a_formal.type)
									end
								else
										-- Internal error: no other kind of agent actual arguments.
									had_error := True
									set_fatal_error
									error_handler.report_giace_error
								end
							end
						end
						i := i - 1
					end
					if had_error then
							-- The error status may have been reset
							-- while checking the arguments.
						set_fatal_error
					end
				end
			end
		end

feature {NONE} -- Event handling

	report_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Report that an assignment instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_set: an_instruction /= Void
		do
		end

	report_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Report that an assignment attempt instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_set: an_instruction /= Void
		do
		end

	report_attribute_assignment_target (a_writable: ET_WRITABLE; an_attribute: ET_FEATURE) is
			-- Report that attribute `a_writable' has been processed
			-- as target of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_writable_not_void: a_writable /= Void
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
		do
		end

	report_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Report that a bit constant has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_boolean_constant (a_constant: ET_BOOLEAN_CONSTANT) is
			-- Report that a boolean has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_character_constant (a_constant: ET_CHARACTER_CONSTANT) is
			-- Report that a character has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_convert_function (an_expression: ET_CONVERT_TO_EXPRESSION; a_target_type: ET_TYPE_CONTEXT; a_feature: ET_FEATURE) is
			-- Report that a convert function call expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_target_type_not_void: a_target_type /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_query: not a_feature.is_procedure
		do
		end

	report_creation_expression (an_expression: ET_EXPRESSION; a_creation_type: ET_NAMED_TYPE;
		a_procedure: ET_FEATURE; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Report that a creation expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_creation_type_not_void: a_creation_type /= Void
			a_procedure_not_void: a_procedure /= Void
			a_creation_procedure: a_procedure.is_procedure
		do
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_NAMED_TYPE; a_procedure: ET_FEATURE) is
			-- Report that a creation instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_creation_type_not_void: a_creation_type /= Void
			a_procedure_not_void: a_procedure /= Void
			a_creation_procedure: a_procedure.is_procedure
		do
		end

	report_current (an_expression: ET_CURRENT) is
			-- Report that the current entity has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_current_type_needed is
			-- Report that the current type is needed to execute the feature being analyzed.
			-- This might be needed for optimization purposes.
		require
			no_error: not has_fatal_error
		do
		end

	report_double_constant (a_constant: ET_REAL_CONSTANT) is
			-- Report that a double has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Report that an equality expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_formal_argument (a_name: ET_IDENTIFIER; a_formal: ET_FORMAL_ARGUMENT) is
			-- Report that a call to formal argument `a_name' has been processed.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_formal_not_void: a_formal /= Void
		do
		end

	report_formal_argument_declaration (a_formal: ET_FORMAL_ARGUMENT) is
			-- Report that the declaration of the formal
			-- argument `a_formal' has been processed.
		require
			no_error: not has_fatal_error
			a_formal_not_void: a_formal /= Void
		do
		end

	report_integer_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_integer_8_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer_8 has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_integer_16_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer_16 has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_integer_32_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer_32 has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_integer_64_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that an integer_64 has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_local_assignment_target (a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE) is
			-- Report that the local variable `a_name' has been
			-- processed as target of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_local_not_void: a_local /= Void
		do
		end

	report_local_variable (a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE) is
			-- Report that a call to local variable `a_name' has been processed.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_local_not_void: a_local /= Void
		do
		end

	report_local_variable_declaration (a_local: ET_LOCAL_VARIABLE) is
			-- Report that the declaration of the local variable `a_local'
			-- has been processed.
			-- Note: The type of the local variable is still viewed from
			-- the implementation class of `current_feature'. Its formal
			-- generic parameters need to be resolved in `current_class'
			-- before using it.
		require
			no_error: not has_fatal_error
			a_local_not_void: a_local /= Void
		do
		end

	report_manifest_array (an_expression: ET_MANIFEST_ARRAY; a_type: ET_TYPE) is
			-- Report that a manifest array of type `a_type' in context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_manifest_tuple (an_expression: ET_MANIFEST_TUPLE; a_type: ET_TYPE) is
			-- Report that a manifest tuple of type `a_type' in context of
			-- `current_type' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_manifest_type (an_expression: ET_MANIFEST_TYPE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a manifest type of type `a_type' 
			-- in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_natural_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_natural_8_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural_8 has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_natural_16_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural_16 has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_natural_32_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural_32 has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_natural_64_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Report that a natural_64 has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION) is
			-- Report that a pointer expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_type: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report that a precursor expression has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_feature' is the precursor feature.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_query: not a_feature.is_procedure
		do
		end

	report_precursor_instruction (an_instruction: ET_PRECURSOR; a_parent_type: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report that a precursor instruction has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_feature' is the precursor feature.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_procedure: a_feature.is_procedure
		do
		end

	report_qualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_FEATURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a qualified call (to `a_feature') agent
			-- of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.target /= Void
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_qualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT; a_feature: ET_FEATURE) is
			-- Report that a qualified call expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call: an_expression.is_qualified_call
			a_target_type_not_void: a_target_type /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_query: not a_feature.is_procedure
		do
		end

	report_qualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT; a_feature: ET_FEATURE) is
			-- Report that a qualified call instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			qualified_call: an_instruction.is_qualified_call
			a_target_type_not_void: a_target_type /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_procedure: a_feature.is_procedure
		do
		end

	report_result (an_expression: ET_RESULT) is
			-- Report that the result entity has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_result_assignment_target (a_result: ET_RESULT) is
			-- Report that the result entity has been processed
			-- as target of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_result_not_void: a_result /= Void
		do
		end

	report_result_declaration (a_type: ET_TYPE) is
			-- Report that the declaration of the "Result" entity
			-- of type `a_type' has been processed.
		require
			no_error: not has_fatal_error
			a_type_not_void: a_type /= Void
		do
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_feature: ET_FEATURE) is
			-- Report that a static call expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_query: not a_feature.is_procedure
		do
		end

	report_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION; a_type: ET_TYPE; a_feature: ET_FEATURE) is
			-- Report that a static call instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_type_not_void: a_type /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_procedure: a_feature.is_procedure
		do
		end

	report_string_constant (a_string: ET_MANIFEST_STRING) is
			-- Report that a string has been processed.
		require
			no_error: not has_fatal_error
			a_string_not_void: a_string /= Void
		do
		end

	report_strip_expression (an_expression: ET_STRIP_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a strip expression of type `a_type' 
			-- in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_typed_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a typed pointer expression of type `a_type' 
			-- in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_unqualified_call_agent (an_expression: ET_CALL_AGENT; a_feature: ET_FEATURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an unqualified call (to `a_feature') agent
			-- of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: an_expression.target = Void
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_unqualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_feature: ET_FEATURE) is
			-- Report that an unqualified call expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call: not an_expression.is_qualified_call
			a_feature_not_void: a_feature /= Void
			a_feature_query: not a_feature.is_procedure
		do
		end

	report_unqualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_feature: ET_FEATURE) is
			-- Report that an unqualified call instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			unqualified_call: not an_instruction.is_qualified_call
			a_feature_not_void: a_feature /= Void
			a_feature_procedure: a_feature.is_procedure
		do
		end

	report_void_constant (an_expression: ET_VOID) is
			-- Report that a Void has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

feature {ET_AST_NODE} -- Processing

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_assigner_instruction_validity (an_instruction)
			end
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_assignment_validity (an_instruction)
			end
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_assignment_attempt_validity (an_instruction)
			end
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_attribute_validity (a_feature)
			end
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_bang_instruction_validity (an_instruction)
			end
		end

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_bit_constant_validity (a_constant, current_context)
			end
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_bracket_expression_validity (an_expression, current_context)
			end
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_c1_character_constant_validity (a_constant, current_context)
			end
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_c2_character_constant_validity (a_constant, current_context)
			end
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_c3_character_constant_validity (a_constant, current_context)
			end
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_call_agent_validity (an_expression, current_context)
			end
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_call_expression_validity (an_expression, current_context)
			end
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_call_instruction_validity (an_instruction)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_check_instruction_validity (an_instruction)
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_constant_attribute_validity (a_feature)
			end
		end

	process_convert_expression (an_expression: ET_CONVERT_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_convert_expression_validity (an_expression, current_context)
			end
		end

	process_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_convert_to_expression_validity (an_expression, current_context)
			end
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_create_expression_validity (an_expression, current_context)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_create_instruction_validity (an_instruction)
			end
		end

	process_current (an_expression: ET_CURRENT) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_current_validity (an_expression, current_context)
			end
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_current_address_validity (an_expression, current_context)
			end
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_debug_instruction_validity (an_instruction)
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_deferred_function_validity (a_feature)
			end
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_deferred_procedure_validity (a_feature)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_do_function_validity (a_feature)
			end
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_do_procedure_validity (a_feature)
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_equality_expression_validity (an_expression, current_context)
			end
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_expression_address_validity (an_expression, current_context)
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_external_function_validity (a_feature)
			end
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_external_procedure_validity (a_feature)
			end
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_false_constant_validity (a_constant, current_context)
			end
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_feature_address_validity (an_expression, current_context)
			end
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_hexadecimal_integer_constant_validity (a_constant, current_context)
			end
		end

	process_identifier (an_identifier: ET_IDENTIFIER) is
			-- Process `an_identifier'.
		do
			if internal_call then
				internal_call := False
				if in_instruction then
					in_instruction := False
					instruction_context.reset (current_type)
					check_unqualified_call_validity (an_identifier, False, instruction_context)
				elseif an_identifier.is_argument then
					check_formal_argument_validity (an_identifier, current_context)
				elseif an_identifier.is_local then
					check_local_variable_validity (an_identifier, current_context)
				else
					check_unqualified_call_validity (an_identifier, True, current_context)
				end
			end
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_if_instruction_validity (an_instruction)
			end
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_infix_cast_expression_validity (an_expression, current_context)
			end
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_infix_expression_validity (an_expression, current_context)
			end
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_inspect_instruction_validity (an_instruction)
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_loop_instruction_validity (an_instruction)
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_manifest_array_validity (an_expression, current_context)
			end
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_manifest_tuple_validity (an_expression, current_context)
			end
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_manifest_type_validity (an_expression, current_context)
			end
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_old_expression_validity (an_expression, current_context)
			end
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_once_function_validity (a_feature)
			end
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_once_manifest_string_validity (an_expression, current_context)
			end
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_once_procedure_validity (a_feature)
			end
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_parenthesized_expression_validity (an_expression, current_context)
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_precursor_expression_validity (an_expression, current_context)
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_precursor_instruction_validity (an_instruction)
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_prefix_expression_validity (an_expression, current_context)
			end
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_regular_integer_constant_validity (a_constant, current_context)
			end
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_regular_manifest_string_validity (a_string, current_context)
			end
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_regular_real_constant_validity (a_constant, current_context)
			end
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_result_validity (an_expression, current_context)
			end
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_result_address_validity (an_expression, current_context)
			end
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_retry_instruction_validity (an_instruction)
			end
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL) is
			-- Process `a_symbol'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				has_fatal_error := False
			end
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_special_manifest_string_validity (a_string, current_context)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_static_call_expression_validity (an_expression, current_context)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				in_instruction := False
				check_static_call_instruction_validity (an_instruction)
			end
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_strip_expression_validity (an_expression, current_context)
			end
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_true_constant_validity (a_constant, current_context)
			end
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_underscored_integer_constant_validity (a_constant, current_context)
			end
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_underscored_real_constant_validity (a_constant, current_context)
			end
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_unique_attribute_validity (a_feature)
			end
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_verbatim_string_validity (a_string, current_context)
			end
		end

	process_void (an_expression: ET_VOID) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_void_validity (an_expression, current_context)
			end
		end

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

feature {NONE} -- Access

	feature_impl: ET_FEATURE
			-- Feature where the code being processed comes from
			-- (It might be different from `current_feature' when 
			-- processing inherited assertions.)

	current_feature: ET_FEATURE
			-- Feature being processed

	current_type: ET_BASE_TYPE
			-- Type from which `current_feature' is processed
			-- (It may not be the type to which `current_feature'
			-- belong when processing a precursor of a feature
			-- of `current_type'.)

	current_class: ET_CLASS
			-- Base class of `current_type'

	current_context: ET_NESTED_TYPE_CONTEXT
			-- Context of expression being checked

	current_target_type: ET_TYPE_CONTEXT
			-- Type of the target of expression being processed

feature {ET_FEATURE_CHECKER} -- Status report

	in_instruction: BOOLEAN
			-- Are we processing an instruction?

	in_rescue: BOOLEAN
			-- Are we processing a rescue clause?

	in_assertion: BOOLEAN
			-- Are we processing an assertion?

	in_precondition: BOOLEAN
			-- Are we processing a precondition?

	in_postcondition: BOOLEAN
			-- Are we processing a postcondition?

	in_invariant: BOOLEAN
			-- Are we processing an invariant?

	in_precursor: BOOLEAN
			-- Are we processing a precursor feature?

	set_state (other: like Current) is
			-- Set current state with state of `other'.
		require
			other_not_void: other /= Void
		do
			in_instruction := other.in_instruction
			in_rescue := other.in_rescue
			in_assertion := other.in_assertion
			in_precondition := other.in_precondition
			in_postcondition := other.in_postcondition
			in_invariant := other.in_invariant
			in_precursor := other.in_precursor
		ensure
			in_instruction_set: in_instruction = other.in_instruction
			in_rescue_set: in_rescue = other.in_rescue
			in_assertion_set: in_assertion = other.in_assertion
			in_precondition_set: in_precondition = other.in_precondition
			in_postcondition_set: in_postcondition = other.in_postcondition
			in_invariant_set: in_invariant = other.in_invariant
			in_precursor_set: in_precursor = other.in_precursor
		end

feature {NONE} -- Implementation

	actual_context: ET_NESTED_TYPE_CONTEXT
			-- Actual context

	formal_context: ET_NESTED_TYPE_CONTEXT
			-- Formal context

	instruction_context: ET_NESTED_TYPE_CONTEXT
			-- Instruction context

	expression_context: ET_NESTED_TYPE_CONTEXT
			-- Expression context

	assertion_context: ET_NESTED_TYPE_CONTEXT
			-- Assertion context

	internal_call: BOOLEAN
			-- Have the process routines been called from here?

	dummy_feature: ET_FEATURE is
			-- Dummy feature
		local
			a_name: ET_FEATURE_NAME
		once
			create {ET_IDENTIFIER} a_name.make ("**dummy**")
			create {ET_DEFERRED_PROCEDURE} Result.make (a_name, Void, Void, Void, Void, tokens.any_clients, current_class)
		ensure
			dummy_feature_not_void: Result /= Void
		end

invariant

	feature_impl_not_void: feature_impl /= Void
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void
	current_type_valid: current_type.is_valid_context
	current_class_not_void: current_class /= Void
	current_class_definition: current_class = current_type.direct_base_class (universe)
	-- implementation_checked: if inherited, then the code being analyzed has already been checked in implementation class of `feature_impl'
	type_checker_not_void: type_checker /= Void
	actual_context_not_void: actual_context /= Void
	formal_context_not_void: formal_context /= Void
	instruction_context_not_void: instruction_context /= Void
	expression_context_not_void: expression_context /= Void
	assertion_context_not_void: assertion_context /= Void

end
