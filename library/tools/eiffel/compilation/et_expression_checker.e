indexing

	description:

		"Eiffel expression validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPRESSION_CHECKER

inherit

	ET_CALL_CHECKER
		redefine
			make,
			set_fatal_error,
			in_expression,
			process_bit_constant,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
			process_convert_expression,
			process_create_expression,
			process_current,
			process_current_address,
			process_equality_expression,
			process_expression_address,
			process_false_constant,
			process_feature_address,
			process_hexadecimal_integer_constant,
			process_identifier,
			process_infix_cast_expression,
			process_infix_expression,
			process_manifest_array,
			process_manifest_tuple,
			process_old_expression,
			process_once_manifest_string,
			process_parenthesized_expression,
			process_precursor_expression,
			process_prefix_expression,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_result,
			process_result_address,
			process_special_manifest_string,
			process_static_call_expression,
			process_strip_expression,
			process_true_constant,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_verbatim_string
		end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new expression validity checker.
		do
			precursor (a_universe)
			current_target_type := a_universe.any_class
			create expression_context.make_with_capacity (current_class, 10)
			create actual_context.make_with_capacity (current_class, 10)
			current_context := actual_context
			create convert_actuals.make_with_capacity (1)
		end

feature -- Setting

	reset is
			-- Reset current validity checker.
		do
			has_fatal_error := False
		ensure
			no_error: not has_fatal_error
		end

feature -- Validity checking

	check_expression_validity (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_target_type: ET_TYPE_CONTEXT; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `an_expression' (whose target is of type
			-- `a_target_type') in `a_feature' of `a_class'. Set `has_fatal_error'
			-- is a fatal error occurred. Otherwise the type of `an_expression'
			-- is appended to `a_context'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			implementation_checked: a_class /= a_feature.implementation_class implies implementation_checked (a_feature)
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			old_context: ET_NESTED_TYPE_CONTEXT
			old_target_type: ET_TYPE_CONTEXT
		do
			reset
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
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
			current_class := old_class
			current_feature := old_feature
			current_context := old_context
			current_target_type := old_target_type
		end

	check_writable_validity (a_writable: ET_WRITABLE; a_context: ET_NESTED_TYPE_CONTEXT;
		a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `a_writable' in `a_feature' of `a_class'.
			-- Set `has_fatal_error' is a fatal error occurred. Otherwise
			-- the type of `a_writable' is appended to `a_context'.
		require
			a_writable_not_void: a_writable /= Void
			a_context_not_void: a_context /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			implementation_checked: a_class /= a_feature.implementation_class implies implementation_checked (a_feature)
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			old_context: ET_NESTED_TYPE_CONTEXT
			a_result: ET_RESULT
			an_identifier: ET_IDENTIFIER
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_seed: INTEGER
			a_class_impl: ET_CLASS
			an_attribute: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type: ET_TYPE
		do
			reset
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
			old_context := current_context
			current_context := a_context
			a_result ?= a_writable
			if a_result /= Void then
				a_type := current_feature.type
				if a_type = Void then
					set_fatal_error
					a_class_impl := current_feature.implementation_class
					if a_class_impl = current_class then
						error_handler.report_veen2a_error (current_class, a_result, current_feature)
					else
						if not has_implementation_error (current_feature) then
								-- Internal error: the VEEN-2 error should have been
								-- reported in the implementation feature.
							error_handler.report_giadq_error
						end
					end
				else
					a_context.force_first (a_type)
				end
			else
				an_identifier ?= a_writable
				if an_identifier /= Void then
					a_seed := an_identifier.seed
					if a_seed /= 0 then
						if an_identifier.is_local then
							a_locals := current_feature.locals
							if a_locals = Void then
									-- Internal error.
								set_fatal_error
								error_handler.report_giabk_error
							elseif a_seed < 1 or a_seed > a_locals.count then
									-- Internal error.
								set_fatal_error
								error_handler.report_giabl_error
							else
								a_type := resolved_formal_parameters (a_locals.local_variable (a_seed).type)
								if not has_fatal_error then
									a_context.force_first (a_type)
								end
							end
						else
							an_attribute := current_class.seeded_feature (a_seed)
							if an_attribute = Void then
									-- Internal error: if we got a seed, the
									-- `an_attribute' should not be void.
								set_fatal_error
								error_handler.report_giabm_error
							elseif not an_attribute.is_attribute then
								set_fatal_error
								a_class_impl := current_feature.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vjaw0a_error (current_class, an_identifier, an_attribute)
								elseif not has_implementation_error (current_feature) then
										-- Internal error: this error should have been reported when
										-- processing the implementation `current_feature' or in the
										-- feature flattener when redeclaring attribute `a_feature'
										-- to a non-attribute in an ancestor of `current_class'.
									error_handler.report_giabn_error
								end
							else
								a_type := an_attribute.type
								a_context.force_first (a_type)
							end
						end
					else
							-- We need to resolve `an_identifier' in the implementation
							-- class of `current_feature' first.
						a_class_impl := current_feature.implementation_class
						if a_class_impl /= current_class then
							set_fatal_error
							if not has_implementation_error (current_feature) then
									-- Internal error: `an_identifier' should have been resolved in
									-- the implementation feature.
								error_handler.report_giadr_error
							end
						else
							a_locals := current_feature.locals
							if a_locals /= Void then
								a_seed := a_locals.index_of (an_identifier)
								if a_seed /= 0 then
									an_identifier.set_seed (a_seed)
									an_identifier.set_local (True)
									a_type := resolved_formal_parameters (a_locals.local_variable (a_seed).type)
									if not has_fatal_error then
										a_context.force_first (a_type)
									end
								end
							end
							if a_seed = 0 then
								current_class.process (universe.interface_checker)
								if current_class.has_interface_error then
									set_fatal_error
								else
									an_attribute := current_class.named_feature (an_identifier)
									if an_attribute /= Void then
										if an_attribute.is_attribute then
											a_seed := an_attribute.first_seed
											an_identifier.set_seed (a_seed)
											a_type := an_attribute.type
											a_context.force_first (a_type)
										else
											set_fatal_error
											error_handler.report_vjaw0a_error (current_class, an_identifier, an_attribute)
										end
									else
										an_arguments := current_feature.arguments
										if an_arguments /= Void and then an_arguments.index_of (an_identifier) /= 0 then
											set_fatal_error
											error_handler.report_vjaw0c_error (current_class, an_identifier, current_feature)
										else
											set_fatal_error
											error_handler.report_veen0a_error (current_class, an_identifier, current_feature)
										end
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
			current_class := old_class
			current_feature := old_feature
			current_context := old_context
		end

feature {NONE} -- Expression validity

	check_bit_constant_validity (a_constant: ET_BIT_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			an_integer_constant: ET_REGULAR_INTEGER_CONSTANT
			a_type: ET_BIT_N
		do
			create an_integer_constant.make ((a_constant.literal.count - 1).out)
			create a_type.make (an_integer_constant)
			a_context.force_first (a_type)
		end

	check_c1_character_constant_validity (a_constant: ET_C1_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (universe.character_class)
		end

	check_c2_character_constant_validity (a_constant: ET_C2_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (universe.character_class)
		end

	check_c3_character_constant_validity (a_constant: ET_C3_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (universe.character_class)
		end

	check_call_agent_validity (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			an_arguments: ET_AGENT_ACTUAL_ARGUMENT_LIST
			a_target: ET_AGENT_TARGET
			an_expression_target: ET_EXPRESSION
			a_type_target: ET_TARGET_TYPE
			an_any: ANY
		do
			a_name := an_expression.name
			an_arguments := an_expression.arguments
			a_target := an_expression.target
			if a_target = Void then
				check_unqualified_call_agent_validity (a_name, an_arguments, a_context)
			else
				-- SmartEiffel 1.1 does not allow the assignment attempt
				-- because ET_EXPRESSION does not conform to ET_AGENT_TARGET.
				-- an_expression_target ?= a_target
				an_any := a_target
				an_expression_target ?= an_any
				if an_expression_target /= Void then
					check_qualified_call_agent_validity (an_expression_target, a_name, an_arguments, a_context)
				else
					a_type_target ?= a_target
					if a_type_target /= Void then
						check_typed_call_agent_validity (a_type_target.type, a_name, an_arguments, a_context)
					else
							-- Internal error: no other kind of targets.
						set_fatal_error
						error_handler.report_giaca_error
					end
				end
			end
		end

	check_unqualified_call_agent_validity (a_name: ET_FEATURE_NAME;
		an_actuals: ET_AGENT_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of unqualified call agent.
		require
			a_name_not_void: a_name /= Void
			a_context_not_void: a_context /= Void
		local
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
		do
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature' first.
				a_class_impl := current_feature.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giact_error
					end
				else
					current_class.process (universe.interface_checker)
					if current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.named_feature (a_name)
						if a_feature /= Void then
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
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
					if current_class.has_interface_error then
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
					a_formal_arguments := a_feature.arguments
					if a_formal_arguments /= Void then
						create an_open_operands.make_with_capacity (a_formal_arguments.count)
					end
					check_agent_arguments_validity (an_actuals, a_context, a_name, a_feature, Void, an_open_operands)
					if not has_fatal_error then
						create a_tuple_type.make (an_open_operands)
						a_type := a_feature.type
						if a_type = Void then
								-- This is a procedure.
							an_agent_class := universe.procedure_class
							create a_parameters.make_with_capacity (2)
							a_parameters.put_first (a_tuple_type)
							a_parameters.put_first (current_class)
							create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
						else
-- TODO: like argument
-- PREDICATE is not supported in ISE Eiffel and it is a user-define class
-- at AXA Rosenberg.
--							if
--								universe.predicate_class.is_preparsed and then
--								a_type.same_named_type (universe.boolean_class, current_class, current_class, universe)
--							then
--								an_agent_class := universe.predicate_class
--								create a_parameters.make_with_capacity (2)
--								a_parameters.put_first (a_tuple_type)
--								a_parameters.put_first (current_class)
--								create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
--							else
								an_agent_class := universe.function_class
								create a_parameters.make_with_capacity (3)
								a_parameters.put_first (a_type)
								a_parameters.put_first (a_tuple_type)
								a_parameters.put_first (current_class)
								create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
--							end
						end
						a_context.force_first (an_agent_type)
					end
				end
			end
		end

	check_qualified_call_agent_validity (a_target: ET_EXPRESSION; a_name: ET_FEATURE_NAME;
		an_actuals: ET_AGENT_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified call agent.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
			a_context_not_void: a_context /= Void
		local
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
		do
			any_type := universe.any_type
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature' first.
				a_class_impl := current_feature.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giacu_error
					end
				else
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
					check_subexpression_validity (a_target, a_context, any_type)
					if not has_fatal_error then
						if not a_context.is_empty and then a_context.first = universe.string_type then
								-- When a manifest string is the target of a call,
								-- we consider it as non-cat type.
							a_context.put (universe.string_class, 1)
						end
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
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
					check_subexpression_validity (a_target, a_context, any_type)
					if not has_fatal_error then
						if not a_context.is_empty and then a_context.first = universe.string_type then
								-- When a manifest string is the target of a call,
								-- we consider it as non-cat type.
							a_context.put (universe.string_class, 1)
						end
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
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
					if not a_feature.is_exported_to (current_class, universe.ancestor_builder) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vpca2a_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vpca2b_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					end
					check_vape_validity (a_name, a_feature, a_class)
					a_formal_arguments := a_feature.arguments
					if a_formal_arguments /= Void then
						create an_open_operands.make_with_capacity (a_formal_arguments.count)
					end
					check_agent_arguments_validity (an_actuals, a_context, a_name, a_feature, a_class, an_open_operands)
						-- Check whether `a_feature' satistfies CAT validity rules.
					check_cat_validity (a_name, a_feature, a_context)
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
--								a_type.same_named_type (universe.boolean_class, current_class, current_class, universe)
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
						a_context.force_first (an_agent_type)
					end
				end
			end
		end

	check_typed_call_agent_validity (a_type: ET_TYPE; a_name: ET_FEATURE_NAME;
		an_actuals: ET_AGENT_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of typed call agent.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
			a_context_not_void: a_context /= Void
		local
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
		do
			check_type_validity (a_type)
			if not has_fatal_error then
				a_seed := a_name.seed
				if a_seed = 0 then
						-- We need to resolve `a_name' in the implementation
						-- class of `current_feature' first.
					a_class_impl := current_feature.implementation_class
					if a_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (current_feature) then
								-- Internal error: `a_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giacv_error
						end
					else
						a_context.force_first (a_type)
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
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
						a_target_type := resolved_formal_parameters (a_type)
						if not has_fatal_error then
							a_context.force_first (a_target_type)
							a_class := a_context.base_class (universe)
							a_class.process (universe.interface_checker)
							if a_class.has_interface_error then
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
						if not a_feature.is_exported_to (current_class, universe.ancestor_builder) then
								-- The feature is not exported to `current_class'.
							set_fatal_error
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vpca2a_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vpca2b_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
						check_vape_validity (a_name, a_feature, a_class)
						a_formal_arguments := a_feature.arguments
						if a_formal_arguments /= Void then
							create an_open_operands.make_with_capacity (a_formal_arguments.count + 1)
						else
							create an_open_operands.make_with_capacity (1)
						end
						check_agent_arguments_validity (an_actuals, a_context, a_name, a_feature, a_class, an_open_operands)
							-- Check whether `a_feature' satistfies CAT validity rules.
						check_cat_validity (a_name, a_feature, a_context)
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
--									a_result_type.same_named_type (universe.boolean_class, current_class, current_class, universe)
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
							a_context.force_first (an_agent_type)
						end
					end
				end
			end
		end

	check_agent_arguments_validity (an_actuals: ET_AGENT_ACTUAL_ARGUMENT_LIST;
		a_context: ET_NESTED_TYPE_CONTEXT; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_class: ET_CLASS; an_open_operands: ET_ACTUAL_PARAMETER_LIST) is
			-- Check actual arguments validity for agent on `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call. `an_open_operands', when
			-- not Void, is where to store the types of open operands.
		require
			a_context_not_void: a_context /= Void
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			a_class_impl: ET_CLASS
			an_agent_actual: ET_AGENT_ACTUAL_ARGUMENT
			an_actual: ET_EXPRESSION
			an_agent_type: ET_TARGET_TYPE
			an_actual_type: ET_TYPE
			a_question_mark: ET_QUESTION_MARK_SYMBOL
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			had_error: BOOLEAN
			an_actual_named_type: ET_NAMED_TYPE
			a_formal_named_type: ET_NAMED_TYPE
			a_convert_feature: ET_CONVERT_FEATURE
			a_convert_expression: ET_CONVERT_EXPRESSION
			an_argument_comma: ET_AGENT_ACTUAL_ARGUMENT_COMMA
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_formal_type: ET_TYPE
		do
			a_formals := a_feature.arguments
			if an_actuals = Void then
				if an_open_operands /= Void and then a_formals /= Void then
					nb := a_formals.count
					from i := nb until i < 1 loop
						an_open_operands.force_first (a_formals.formal_argument (i).type)
						i := i - 1
					end
				end
			else
				a_class_impl := current_feature.implementation_class
				if an_actuals.is_empty then
					if a_formals /= Void and then not a_formals.is_empty then
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							if a_class /= Void then
								error_handler.report_vpca3a_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vpca3c_error (current_class, a_name, a_feature)
							end
						elseif not has_implementation_error (current_feature) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `current_feature' or in
								-- the feature flattener when redeclaring `a_feature' in an
								-- ancestor of `a_class' or `current_class'.
							error_handler.report_giacw_error
						end
					end
				elseif a_formals = Void or else a_formals.count /= an_actuals.count then
					set_fatal_error
					a_class_impl := current_feature.implementation_class
					if current_class = a_class_impl then
						if a_class /= Void then
							error_handler.report_vpca3a_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vpca3c_error (current_class, a_name, a_feature)
						end
					elseif not has_implementation_error (current_feature) then
							-- Internal error: this error should have been reported when
							-- processing the implementation of `current_feature' or in
							-- the feature flattener when redeclaring `a_feature' in an
							-- ancestor of `a_class' or `current_class'.
						error_handler.report_giacx_error
					end
				else
						-- Do not use `actual_context' because it might already have
						-- been used in `check_actual_arguments_validity'. Use
						-- `expression_context' instead.
					l_actual_context := expression_context
					l_actual_context.reset (current_class)
					l_formal_context := a_context
					l_formal_type := tokens.like_current
					nb := an_actuals.count
					from i := nb until i < 1 loop
						has_fatal_error := False
						a_formal := a_formals.formal_argument (i)
						an_agent_actual := an_actuals.actual_argument (i)
						an_actual ?= an_agent_actual
						if an_actual /= Void then
							l_formal_context.force_first (a_formal.type)
							check_argument_validity (an_actual, l_actual_context, l_formal_context)
							if has_fatal_error then
								had_error := True
							elseif not l_actual_context.conforms_to_type (l_formal_type, l_formal_context, universe) then
								a_class_impl := current_feature.implementation_class
								if current_class = a_class_impl then
									a_convert_feature := type_checker.convert_feature (l_actual_context, l_formal_context)
								else
										-- Convertibility should be resolved in the implementation class.
									a_convert_feature := Void
								end
								if a_convert_feature /= Void then
										-- Insert the conversion feature call in the AST.
									a_convert_expression := universe.ast_factory.new_convert_expression (an_actual, a_convert_feature)
									if a_convert_expression /= Void then
										an_argument_comma ?= an_actuals.item (i)
										if an_argument_comma /= Void then
											an_argument_comma.set_agent_actual_argument (a_convert_expression)
										else
											an_actuals.put (a_convert_expression, i)
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
							l_formal_context.remove_first
							l_actual_context.wipe_out
						else
							an_agent_type ?= an_agent_actual
							if an_agent_type /= Void then
								an_actual_type := an_agent_type.type
								check_type_validity (an_actual_type)
								if has_fatal_error then
									had_error := True
								else
									an_actual_type := resolved_formal_parameters (an_actual_type)
									if has_fatal_error then
										had_error := True
									elseif not an_actual_type.conforms_to_type (a_formal.type, l_formal_context, current_class, universe) then
-- Note: VPCA-5 says nothing about type convertibility.
										had_error := True
										set_fatal_error
										an_actual_named_type := an_actual_type.named_type (current_class, universe)
										a_formal_named_type := a_formal.type.named_type (l_formal_context, universe)
										a_class_impl := current_feature.implementation_class
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
									elseif an_open_operands /= Void then
										an_open_operands.force_first (an_actual_type)
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

	check_call_expression_validity (an_expression: ET_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			if an_expression.target = Void then
				check_unqualified_call_validity (an_expression.name, an_expression.arguments, a_context)
			else
				check_qualified_call_validity (an_expression.target, an_expression.name, an_expression.arguments, a_context)
			end
		end

	check_convert_expression_validity (an_expression: ET_CONVERT_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_convert_feature: ET_CONVERT_FEATURE
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
		do
			a_convert_feature := an_expression.convert_feature
			if a_convert_feature.is_convert_to then
				check_qualified_call_validity (an_expression.expression, a_convert_feature.name, Void, a_context)
			elseif a_convert_feature.is_convert_from then
				an_actuals := convert_actuals
				an_actuals.wipe_out
				an_actuals.put_first (an_expression.expression)
				check_creation_expression_validity (current_target_type.named_type (universe),
					a_convert_feature.name, an_actuals, an_expression.position, a_context)
			else
				check_subexpression_validity (an_expression.expression, a_context, current_target_type)
				a_context.force_first (current_target_type.named_type (universe))
			end
		end

	check_create_expression_validity (an_expression: ET_CREATE_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
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
				check_creation_expression_validity (a_type, a_call.name, a_call.arguments, a_type.position, a_context)
			else
				check_creation_expression_validity (a_type, Void, Void, a_type.position, a_context)
			end
		end

	check_creation_expression_validity (a_type: ET_TYPE; a_name: ET_FEATURE_NAME; an_actuals: ET_ACTUAL_ARGUMENT_LIST;
		a_type_position: ET_POSITION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of creation expression.
		require
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
		do
			l_type := a_type
			check_type_validity (l_type)
			if not has_fatal_error then
				if a_name /= Void then
					l_name := a_name
					a_seed := l_name.seed
					if a_seed = 0 then
							-- We need to resolve `l_name' in the implementation
							-- class of `current_feature' first.
						a_class_impl := current_feature.implementation_class
						if a_class_impl /= current_class then
							set_fatal_error
							if not has_implementation_error (current_feature) then
									-- Internal error: `l_name' should have been resolved in
									-- the implementation feature.
								error_handler.report_giacy_error
							end
						else
							a_context.force_first (l_type)
							a_class := a_context.base_class (universe)
							a_class.process (universe.interface_checker)
							if a_class.has_interface_error then
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
					l_type := resolved_formal_parameters (l_type)
					if not has_fatal_error then
						a_context.force_first (l_type)
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
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
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc5a_error (current_class, a_type_position, a_class)
						else
							error_handler.report_vgcc5b_error (current_class, a_class_impl, a_type_position, a_class)
						end
					end
				else
					if a_feature.type /= Void then
							-- This is not a procedure.
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc6b_error (current_class, l_name, a_feature, a_class)
						elseif not has_implementation_error (current_feature) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `current_feature' or in
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
								a_class_impl := current_feature.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vgcc8a_error (current_class, l_name, a_feature, a_class, a_formal_parameter)
								else
									error_handler.report_vgcc8b_error (current_class, a_class_impl, l_name, a_feature, a_class, a_formal_parameter)
								end
							end
						end
					elseif not a_feature.is_creation_exported_to (current_class, a_class, universe.ancestor_builder) then
						if a_class.creators /= Void or else not a_feature.has_seed (universe.default_create_seed) then
								-- The procedure is not a creation procedure exported to `current_class'.
							set_fatal_error
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vgcc6d_error (current_class, l_name, a_feature, a_class)
							else
								error_handler.report_vgcc6e_error (current_class, a_class_impl, l_name, a_feature, a_class)
							end
						end
					end
					check_arguments_validity (an_actuals, a_context, l_name, a_feature, a_class)
				end
			end
		end

	check_current_validity (an_expression: ET_CURRENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (current_class)
		end

	check_current_address_validity (an_expression: ET_CURRENT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			a_typed_pointer_class := universe.typed_pointer_class
			if a_typed_pointer_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation.
				create an_actuals.make_with_capacity (1)
				an_actuals.put_first (current_class)
				create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
				a_context.force_first (a_typed_pointer_type)
			else
				a_context.force_first (universe.pointer_class)
			end
		end

	check_equality_expression_validity (an_expression: ET_EQUALITY_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
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
			any_type: ET_CLASS_TYPE
		do
			any_type := universe.any_type
			left_context := formal_context
			left_context.reset (current_class)
			right_context := expression_context
			right_context.reset (current_class)
			check_argument_validity (an_expression.left, left_context, any_type)
			if not has_fatal_error then
				check_argument_validity (an_expression.right, right_context, any_type)
				if not has_fatal_error then
					if not universe.cat_enabled then
							-- This rule is too constraining when checking CAT-calls.
						left_type := tokens.like_current
						right_type := tokens.like_current
						if left_context.conforms_to_type (right_type, right_context, universe) then
							-- OK.
						elseif right_context.conforms_to_type (left_type, left_context, universe) then
							-- OK.
						elseif left_context.same_named_type (universe.none_type, current_class, universe) then
							-- OK.
						elseif right_context.same_named_type (universe.none_type, current_class, universe) then
							-- OK.
						elseif type_checker.convert_feature (left_context, right_context) /= Void then
							-- OK.
						elseif type_checker.convert_feature (right_context, left_context) /= Void then
							-- OK.
						else
							set_fatal_error
							left_named_type := left_context.named_type (universe)
							right_named_type := right_context.named_type (universe)
							a_class_impl := current_feature.implementation_class
							if a_class_impl = current_class then
								error_handler.report_vweq0a_error (current_class, an_expression, left_named_type, right_named_type)
							else
								error_handler.report_vweq0b_error (current_class, a_class_impl, an_expression, left_named_type, right_named_type)
							end
						end
					end
					if not has_fatal_error then
						a_context.force_first (universe.boolean_class)
					end
				end
			else
				check_argument_validity (an_expression.right, right_context, any_type)
				set_fatal_error
			end
		end

	check_expression_address_validity (an_expression: ET_EXPRESSION_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			any_type: ET_CLASS_TYPE
		do
			any_type := universe.any_type
			a_typed_pointer_class := universe.typed_pointer_class
			if a_typed_pointer_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation.
				check_subexpression_validity (an_expression.expression, a_context, any_type)
				if not has_fatal_error then
					if not a_context.is_empty then
						create an_actuals.make_with_capacity (1)
						an_actuals.put_first (a_context.first)
						create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
						a_context.put (a_typed_pointer_type, 1)
					else
						create an_actuals.make_with_capacity (1)
						an_actuals.put_first (a_context.root_context)
						create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
						a_context.force_first (a_typed_pointer_type)
					end
				end
			else
					-- Use the ETL2 implementation.
				expression_context.reset (current_class)
				check_argument_validity (an_expression.expression, expression_context, any_type)
				if not has_fatal_error then
					a_context.force_first (universe.pointer_class)
				end
			end
		end

	check_false_constant_validity (a_constant: ET_FALSE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (universe.boolean_class)
		end

	check_feature_address_validity (an_expression: ET_FEATURE_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
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
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			a_name := an_expression.name
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature' first.
				a_class_impl := current_feature.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giada_error
					end
				else
					an_identifier ?= a_name
					if an_identifier /= Void then
						an_arguments := current_feature.arguments
						if an_arguments /= Void then
							a_seed := an_arguments.index_of (an_identifier)
							if a_seed /= 0 then
								an_identifier.set_seed (a_seed)
								an_identifier.set_argument (True)
								a_typed_pointer_class := universe.typed_pointer_class
								if a_typed_pointer_class.is_preparsed then
										-- Class TYPED_POINTER has been found in the universe.
										-- Use ISE's implementation.
									create an_actuals.make_with_capacity (1)
									an_actuals.put_first (an_arguments.formal_argument (a_seed).type)
									create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
									a_context.force_first (a_typed_pointer_type)
								else
									a_context.force_first (universe.pointer_class)
								end
									-- No need to check validity in the
									-- context of `current_class' again.
								already_checked := True
							end
						end
						if a_seed = 0 then
							a_locals := current_feature.locals
							if a_locals /= Void then
								a_seed := a_locals.index_of (an_identifier)
								if a_seed /= 0 then
									an_identifier.set_seed (a_seed)
									an_identifier.set_local (True)
									a_typed_pointer_class := universe.typed_pointer_class
									if a_typed_pointer_class.is_preparsed then
											-- Class TYPED_POINTER has been found in the universe.
											-- Use ISE's implementation.
										create an_actuals.make_with_capacity (1)
										an_actuals.put_first (a_locals.local_variable (a_seed).type)
										create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
										a_context.force_first (a_typed_pointer_type)
									else
										a_context.force_first (universe.pointer_class)
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
						if current_class.has_interface_error then
							set_fatal_error
						else
							a_feature := current_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
									-- $feature_name is of type POINTER, even
									-- in ISE and its TYPED_POINTER support.
								a_context.force_first (universe.pointer_class)
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
					an_arguments := current_feature.arguments
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
							create an_actuals.make_with_capacity (1)
							an_actuals.put_first (an_arguments.formal_argument (a_seed).type)
							create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
							a_context.force_first (a_typed_pointer_type)
						else
							a_context.force_first (universe.pointer_class)
						end
					end
				elseif a_name.is_local then
					a_locals := current_feature.locals
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
							create an_actuals.make_with_capacity (1)
							an_actuals.put_first (a_locals.local_variable (a_seed).type)
							create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
							a_context.force_first (a_typed_pointer_type)
						else
							a_context.force_first (universe.pointer_class)
						end
					end
				else
					current_class.process (universe.interface_checker)
					if current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.seeded_feature (a_seed)
						if a_feature /= Void then
								-- $feature_name is of type POINTER, even
								-- in ISE and its TYPED_POINTER support.
							a_context.force_first (universe.pointer_class)
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
		require
			a_name_not_void: a_name /= Void
			a_name_argument: a_name.is_argument
			a_context_not_void: a_context /= Void
		local
			a_seed: INTEGER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			an_arguments := current_feature.arguments
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
				a_context.force_first (an_arguments.formal_argument (a_seed).type)
			end
		end

	check_hexadecimal_integer_constant_validity (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			a_literal: STRING
		do
			a_literal := a_constant.literal
			inspect a_literal.count
			when 4 then
					-- 0[xX][a-fA-F0-9]{2}
				a_context.force_first (universe.integer_8_class)
			when 6 then
					-- 0[xX][a-fA-F0-9]{4}
				a_context.force_first (universe.integer_16_class)
			when 10 then
					-- 0[xX][a-fA-F0-9]{8}
				a_context.force_first (universe.integer_class)
			when 18 then
					-- 0[xX][a-fA-F0-9]{16}
				a_context.force_first (universe.integer_64_class)
			else
				a_context.force_first (universe.integer_class)
			end
		end

	check_infix_cast_expression_validity (an_expression: ET_INFIX_CAST_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_type: ET_TYPE
		do
			a_type := an_expression.type
			formal_context.reset (current_class)
			formal_context.force_first (a_type)
			check_argument_validity (an_expression.expression, a_context, formal_context)
			if not has_fatal_error then
				a_context.force_first (a_type)
			end
		end

	check_infix_expression_validity (an_expression: ET_INFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
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
			a_convert_expression: ET_CONVERT_EXPRESSION
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_actual_type: ET_TYPE
			l_formal_type: ET_TYPE
			any_type: ET_CLASS_TYPE
			a_cast_expression: ET_INFIX_CAST_EXPRESSION
		do
			any_type := universe.any_type
			a_name := an_expression.name
			a_target := an_expression.left
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature' first.
				a_class_impl := current_feature.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giadb_error
					end
				else
					check_subexpression_validity (a_target, a_context, any_type)
					if not has_fatal_error then
						if not a_context.is_empty and then a_context.first = universe.string_type then
								-- When a manifest string is the target of a call,
								-- we consider it as non-cat type.
							a_context.put (universe.string_class, 1)
						end
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
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
					check_subexpression_validity (a_target, a_context, any_type)
					if not has_fatal_error then
						if not a_context.is_empty and then a_context.first = universe.string_type then
								-- When a manifest string is the target of a call,
								-- we consider it as non-cat type.
							a_context.put (universe.string_class, 1)
						end
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
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
					if not a_feature.is_exported_to (current_class, universe.ancestor_builder) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vuex2b_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vuex2c_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					end
					check_vape_validity (a_name, a_feature, a_class)
						-- Check arguments validity.
					a_formals := a_feature.arguments
					if a_formals = Void or else a_formals.count /= 1 then
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vuar1a_error (current_class, a_name, a_feature, a_class)
						elseif not has_implementation_error (current_feature) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `current_feature' or in
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
						l_actual_context.reset (current_class)
						l_formal_context := a_context
						l_formal_type := a_formal.type
						l_formal_context.force_first (l_formal_type)
						check_argument_validity (an_actual, l_actual_context, l_formal_context)
						l_formal_context.remove_first
						if not has_fatal_error then
							if not l_actual_context.conforms_to_type (l_formal_type, l_formal_context, universe) then
								a_class_impl := current_feature.implementation_class
								if current_class = a_class_impl then
									l_formal_context.force_first (l_formal_type)
									a_convert_feature := type_checker.convert_feature (l_actual_context, l_formal_context)
									l_formal_context.remove_first
								else
										-- Convertibility should be resolved in the implementation class.
									a_convert_feature := Void
								end
								if a_convert_feature /= Void then
										-- Insert the conversion feature call in the AST.
									a_convert_expression := universe.ast_factory.new_convert_expression (an_actual, a_convert_feature)
									if a_convert_expression /= Void then
										an_expression.set_right (a_convert_expression)
									end
								else
									had_error := True
										-- Infix feature convertibility: try to convert
										-- the target to the type of the argument.
									if current_class = a_class_impl then
										other_class := l_actual_context.base_class (universe)
										if
											other_class /= a_class or else
											not l_actual_context.same_named_type (l_formal_type, l_formal_context, universe)
										then
											other_class.process (universe.interface_checker)
											if not other_class.has_interface_error then
												other_feature := other_class.named_feature (a_name)
											end
										end
										if other_feature /= Void then
											if other_feature.is_exported_to (current_class, universe.ancestor_builder) then
												a_convert_feature := type_checker.convert_feature (l_formal_context, l_actual_context)
												if a_convert_feature /= Void then
													a_convert_expression := universe.ast_factory.new_convert_expression (a_target, a_convert_feature)
													a_cast_expression := universe.ast_factory.new_infix_cast_expression (a_convert_expression, l_actual_context.named_type (universe))
												else
														-- If it does not convert, it might conform!
													l_actual_type := tokens.like_current
													if l_formal_context.conforms_to_type (l_actual_type, l_actual_context, universe) then
														a_cast_expression := universe.ast_factory.new_infix_cast_expression (a_target, l_actual_context.named_type (universe))
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
						-- Check whether `a_feature' satistfies CAT validity rules.
					check_cat_validity (a_name, a_feature, a_context)
					a_type := a_feature.type
					if a_type = Void then
							-- In a call expression, `a_feature' has to be a query.
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vkcn2a_error (current_class, a_name, a_feature, a_class)
						elseif not has_implementation_error (current_feature) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `current_feature' or in
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
							formal_context.force_first (a_feature.arguments.formal_argument (1).type)
							a_context.wipe_out
							check_argument_validity (an_expression.right, a_context, formal_context)
						else
							a_context.force_first (a_type)
						end
					end
				end
			end
		end

	check_local_variable_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of local variable `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_local: a_name.is_local
			a_context_not_void: a_context /= Void
		local
			a_seed: INTEGER
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_type: ET_TYPE
		do
			a_locals := current_feature.locals
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
				a_type := resolved_formal_parameters (a_locals.local_variable (a_seed).type)
				if not has_fatal_error then
					a_context.force_first (a_type)
				end
			end
		end

	check_manifest_array_validity (an_expression: ET_MANIFEST_ARRAY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
			a_type: ET_TYPE
			hybrid_type: BOOLEAN
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			array_class: ET_CLASS
			an_array_type: ET_CLASS_TYPE
			an_array_parameters: ET_ACTUAL_PARAMETER_LIST
			an_array_parameter: ET_TYPE
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
			any_type: ET_CLASS_TYPE
		do
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
				formal_context.reset (current_class)
				formal_context.force_first (an_array_parameter)
				expression_context.reset (current_class)
				from i := 1 until i > nb loop
					has_fatal_error := False
					check_argument_validity (an_expression.expression (i), expression_context, formal_context)
					if has_fatal_error then
						had_error := True
					else
						if not expression_context.conforms_to_type (an_array_parameter, current_class, universe) then
							if type_checker.convert_feature (expression_context, formal_context) = Void then
								an_array_type := universe.array_any_type
							end
						end
					end
					expression_context.wipe_out
					i := i + 1
				end
				if had_error then
					set_fatal_error
				else
					a_context.force_first (an_array_type)
				end
			else
				any_type := universe.any_type
				expression_context.reset (current_class)
				from i := 1 until i > nb loop
					has_fatal_error := False
					check_argument_validity (an_expression.expression (i), expression_context, any_type)
					if has_fatal_error then
						had_error := True
					elseif not had_error then
						if a_type = Void then
							a_type := expression_context.named_type (universe)
						elseif not expression_context.same_named_type (a_type, current_class, universe) then
							hybrid_type := True
						end
					end
					expression_context.wipe_out
					i := i + 1
				end
				if had_error then
					set_fatal_error
				elseif a_type = Void then
					a_context.force_first (universe.array_any_type)
				elseif hybrid_type then
					a_context.force_first (universe.array_any_type)
				else
					create an_actuals.make_with_capacity (1)
					an_actuals.put_first (a_type)
					create a_generic_class_type.make (Void, array_class.name, an_actuals, array_class)
					a_generic_class_type.set_cat_keyword (universe.array_any_type.cat_keyword)
					a_generic_class_type.set_unresolved_type (universe.array_any_type)
					a_context.force_first (a_generic_class_type)
				end
			end
		end

	check_manifest_tuple_validity (an_expression: ET_MANIFEST_TUPLE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
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
			a_tuple_type ?= current_target_type.named_type (universe)
			if a_tuple_type /= Void then
				a_tuple_parameters := a_tuple_type.actual_parameters
				if a_tuple_parameters /= Void then
					nb2 := a_tuple_parameters.count
				end
			end
			any_type := universe.any_type
			expression_context.reset (current_class)
			nb := an_expression.count
			create an_actuals.make_with_capacity (nb)
			from i := nb until i <= nb2 loop
				has_fatal_error := False
				check_argument_validity (an_expression.expression (i), expression_context, any_type)
				if has_fatal_error then
					had_error := True
				else
					an_actuals.put_first (expression_context.named_type (universe))
				end
				expression_context.wipe_out
				i := i - 1
			end
			formal_context.reset (current_class)
			from until i < 1 loop
				formal_context.force_first (a_tuple_parameters.type (i))
				has_fatal_error := False
				check_argument_validity (an_expression.expression (i), expression_context, formal_context)
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
				a_context.force_first (a_tuple_type)
			end
		end

	check_old_expression_validity (an_expression: ET_OLD_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
		do
				-- Check VAOL-2 (ETL2 p.124).
			check_subexpression_validity (an_expression.expression, a_context, current_target_type)
				-- Check VAOL-1 (ETL2 p.124).
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then
				error_handler.report_vaol1a_error (current_class, an_expression)
			else
				if not has_implementation_error (current_feature) then
						-- Internal error: the VAOL-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giade_error
				end
			end
		end

	check_once_manifest_string_validity (an_expression: ET_ONCE_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_subexpression_validity (an_expression.manifest_string, a_context, current_target_type)
		end

	check_parenthesized_expression_validity (an_expression: ET_PARENTHESIZED_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_subexpression_validity (an_expression.expression, a_context, current_target_type)
		end

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_precursor_validity (an_expression, a_context)
		end

	check_prefix_expression_validity (an_expression: ET_PREFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_call_validity (an_expression.expression, an_expression.name, Void, a_context)
		end

	check_regular_integer_constant_validity (a_constant: ET_REGULAR_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_type: ET_CLASS_TYPE
			a_class: ET_CLASS
			a_type: ET_TYPE
		do
			a_type := universe.integer_class
			a_class_type ?= current_target_type.named_type (universe)
			if a_class_type /= Void then
				a_class := a_class_type.direct_base_class (universe)
				if a_class = universe.integer_8_class then
					a_type := a_class
				elseif a_class = universe.integer_16_class then
					a_type := a_class
				elseif a_class = universe.integer_64_class then
					a_type := a_class
				end
			end
			a_context.force_first (a_type)
		end

	check_regular_manifest_string_validity (a_string: ET_REGULAR_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (universe.string_type)
		end

	check_regular_real_constant_validity (a_constant: ET_REGULAR_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (universe.double_class)
		end

	check_result_validity (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_type: ET_TYPE
			a_class_impl: ET_CLASS
		do
			a_type := current_feature.type
			if a_type = Void then
				set_fatal_error
				a_class_impl := current_feature.implementation_class
				if a_class_impl = current_class then
					error_handler.report_veen2a_error (current_class, an_expression, current_feature)
				else
					if not has_implementation_error (current_feature) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giadf_error
					end
				end
			else
				a_context.force_first (a_type)
			end
		end

	check_result_address_validity (an_expression: ET_RESULT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
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
			a_type := current_feature.type
			if a_type = Void then
				set_fatal_error
				a_class_impl := current_feature.implementation_class
				if a_class_impl = current_class then
					error_handler.report_veen2a_error (current_class, an_expression.result_keyword, current_feature)
				else
					if not has_implementation_error (current_feature) then
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
					create an_actuals.make_with_capacity (1)
					an_actuals.put_first (a_type)
					create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
					a_context.force_first (a_typed_pointer_type)
				else
					a_context.force_first (universe.pointer_class)
				end
			end
		end

	check_special_manifest_string_validity (a_string: ET_SPECIAL_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (universe.string_type)
		end

	check_static_call_expression_validity (an_expression: ET_STATIC_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_static_call_validity (an_expression, a_context)
		end

	check_strip_expression_validity (an_expression: ET_STRIP_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
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
			nb := an_expression.count
			from i := 1 until i > nb loop
				a_name := an_expression.feature_name (i)
				a_seed := a_name.seed
				had_error := False
				already_checked := False
				if a_seed = 0 then
					had_error := True
						-- We need to resolve `a_name' in the implementation
						-- class of `current_feature' first.
					a_class_impl := current_feature.implementation_class
					if a_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (current_feature) then
								-- Internal error: `a_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giadh_error
						end
					else
						current_class.process (universe.interface_checker)
						if current_class.has_interface_error then
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
					if current_class.has_interface_error then
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
								a_class_impl := current_feature.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vwst1b_error (current_class, a_name, a_feature)
								elseif not has_implementation_error (current_feature) then
										-- Internal error: this error should have been reported when
										-- processing the implementation of `current_feature' or in
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
				a_context.force_first (universe.array_any_type)
			end
		end

	check_true_constant_validity (a_constant: ET_TRUE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (universe.boolean_class)
		end

	check_underscored_integer_constant_validity (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_type: ET_CLASS_TYPE
			a_class: ET_CLASS
			a_type: ET_TYPE
		do
			a_type := universe.integer_class
			a_class_type ?= current_target_type.named_type (universe)
			if a_class_type /= Void then
				a_class := a_class_type.direct_base_class (universe)
				if a_class = universe.integer_8_class then
					a_type := a_class
				elseif a_class = universe.integer_16_class then
					a_type := a_class
				elseif a_class = universe.integer_64_class then
					a_type := a_class
				end
			end
			a_context.force_first (a_type)
		end

	check_underscored_real_constant_validity (a_constant: ET_UNDERSCORED_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			a_context.force_first (universe.double_class)
		end

	check_verbatim_string_validity (a_string: ET_VERBATIM_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
				a_context.force_first (universe.string_type)
		end

	check_subexpression_validity (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_target_type: ET_TYPE_CONTEXT) is
			-- Check validity of `an_expression' (whose target is of type
			-- `a_target_type') in `current_feature' of `current_class'.
			-- Set `has_fatal_error' is a fatal error occurred. Otherwise
			-- the type of `an_expression' is appended to `a_context'.
		do
			check_expression_validity (an_expression, a_context, a_target_type, current_feature, current_class)
		end

	check_argument_validity (an_actual: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_formal_type: ET_TYPE_CONTEXT) is
			-- Check validity of actual argument `an_actual' (whose formal is of type
			-- `a_formal_type') in `current_feature' of `current_class'. Set `has_fatal_error'
			-- is a fatal error occurred. Otherwise the type of `an_expression'
			-- is appended to `a_context'.
		local
			an_expression_checker: like Current
		do
			if expression_checker = Void then
				create an_expression_checker.make (universe)
				expression_checker := an_expression_checker
			end
			expression_checker.check_expression_validity (an_actual, a_context, a_formal_type, current_feature, current_class)
			if expression_checker.has_fatal_error then
				set_fatal_error
			end
		end

	check_arguments_validity (an_actuals: ET_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT;
		a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check actual arguments validity when calling `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call.
		local
			an_expression_checker: like Current
		do
			if expression_checker = Void then
				create an_expression_checker.make (universe)
				expression_checker := an_expression_checker
			end
			expression_checker.check_actual_arguments_validity (an_actuals, a_context, a_name, a_feature, a_class, current_feature, current_class)
			if expression_checker.has_fatal_error then
				set_fatal_error
			end
		end

	expression_checker: ET_EXPRESSION_CHECKER
			-- Sub-expression validity checker

feature {ET_CALL_CHECKER} -- Validity checking

	check_actual_arguments_validity (an_actuals: ET_ACTUAL_ARGUMENT_LIST;
		a_context: ET_NESTED_TYPE_CONTEXT; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_class: ET_CLASS; a_current_feature: ET_FEATURE; a_current_class: ET_CLASS) is
			-- Check actual arguments validity when calling `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_context_not_void: a_context /= Void
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_class_not_void: a_current_class /= Void
			implementation_checked: a_current_class /= a_current_feature.implementation_class implies implementation_checked (a_current_feature)
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			a_class_impl: ET_CLASS
			an_actual: ET_EXPRESSION
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			an_actual_named_type: ET_NAMED_TYPE
			a_formal_named_type: ET_NAMED_TYPE
			a_convert_feature: ET_CONVERT_FEATURE
			a_convert_expression: ET_CONVERT_EXPRESSION
			an_expression_comma: ET_EXPRESSION_COMMA
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_formal_type: ET_TYPE
			had_error: BOOLEAN
		do
			reset
			old_feature := current_feature
			current_feature := a_current_feature
			old_class := current_class
			current_class := a_current_class
			a_formals := a_feature.arguments
			if an_actuals = Void or else an_actuals.is_empty then
				if a_formals /= Void and then not a_formals.is_empty then
					set_fatal_error
					a_class_impl := current_feature.implementation_class
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
					elseif not has_implementation_error (current_feature) then
							-- Internal error: this error should have been reported when
							-- processing the implementation of `current_feature' or in
							-- the feature flattener when redeclaring `a_feature' in an
							-- ancestor of `a_class' or `current_class'.
						error_handler.report_giaco_error
					end
				end
			elseif a_formals = Void or else a_formals.count /= an_actuals.count then
				set_fatal_error
				a_class_impl := current_feature.implementation_class
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
				elseif not has_implementation_error (current_feature) then
						-- Internal error: this error should have been reported when
						-- processing the implementation of `current_feature' or in
						-- the feature flattener when redeclaring `a_feature' in an
						-- ancestor of `a_class' or `current_class'.
					error_handler.report_giacp_error
				end
			else
				actual_context.reset (current_class)
				l_formal_context := a_context
				l_formal_type := tokens.like_current
				nb := an_actuals.count
				from i := 1 until i > nb loop
					an_actual := an_actuals.expression (i)
					a_formal := a_formals.formal_argument (i)
					l_formal_context.force_first (a_formal.type)
					check_subexpression_validity (an_actual, actual_context, l_formal_context)
					if has_fatal_error then
						had_error := True
					elseif not actual_context.conforms_to_type (l_formal_type, l_formal_context, universe) then
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							a_convert_feature := type_checker.convert_feature (actual_context, l_formal_context)
						else
								-- Convertibility should be resolved in the implementation class.
							a_convert_feature := Void
						end
						if a_convert_feature /= Void then
								-- Insert the conversion feature call in the AST.
							a_convert_expression := universe.ast_factory.new_convert_expression (an_actual, a_convert_feature)
							if a_convert_expression /= Void then
								an_expression_comma ?= an_actuals.item (i)
								if an_expression_comma /= Void then
									an_expression_comma.set_expression (a_convert_expression)
								else
									an_actuals.put (a_convert_expression, i)
								end
							end
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
					l_formal_context.remove_first
					actual_context.wipe_out
					i := i + 1
				end
				if had_error then
					set_fatal_error
				end
			end
			current_class := old_class
			current_feature := old_feature
		end

feature {NONE} -- Type checking

	check_creation_type_validity (a_type: ET_CLASS_TYPE; a_position: ET_POSITION) is
			-- Check validity of `a_type' as base type of a creation type
			-- in `current_class'. Note that `a_type' should already be a
			-- valid type by itself (call `check_type_validity' for that).
		require
			a_type_not_void: a_type /= Void
			a_type_named_type: a_type.is_named_type
			a_position_not_void: a_position /= Void
		do
			type_checker.check_creation_type_validity (a_type, current_feature, current_class, a_position)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

feature {ET_AST_NODE} -- Processing

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_bit_constant_validity (a_constant, current_context)
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

	process_convert_expression (an_expression: ET_CONVERT_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_convert_expression_validity (an_expression, current_context)
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
				if an_identifier.is_argument then
					check_formal_argument_validity (an_identifier, current_context)
				elseif an_identifier.is_local then
					check_local_variable_validity (an_identifier, current_context)
				else
					check_unqualified_call_validity (an_identifier, Void, current_context)
				end
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

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_old_expression_validity (an_expression, current_context)
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

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_verbatim_string_validity (a_string, current_context)
			end
		end

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		end

feature {NONE} -- Access

	current_context: ET_NESTED_TYPE_CONTEXT
			-- Context of expression being checked
			-- (may be Void is not supplied)

	current_target_type: ET_TYPE_CONTEXT
			-- Type of the target of expression being processed

feature {NONE} -- Implementation

	actual_context: ET_NESTED_TYPE_CONTEXT
			-- Actual context

	expression_context: ET_NESTED_TYPE_CONTEXT
			-- Expression context

	convert_actuals: ET_ACTUAL_ARGUMENT_LIST
			-- Actual argument list used to call convert features

	in_expression: BOOLEAN is True
			-- Are we processing an expression?

invariant

	current_context_not_void: current_context /= Void
	current_target_type_not_void: current_target_type /= Void
	current_target_valid_context: current_target_type.is_valid_context
	actual_context_not_void: actual_context /= Void
	expression_context_not_void: expression_context /= Void
	convert_actuals_not_void: convert_actuals /= Void
	convert_actuals_capacity: convert_actuals.capacity >= 1

end
