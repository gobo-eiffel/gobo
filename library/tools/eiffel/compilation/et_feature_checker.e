indexing

	description:

		"Eiffel feature validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_CHECKER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_attribute,
			process_constant_attribute,
			process_deferred_function,
			process_deferred_procedure,
			process_external_function,
			process_external_procedure,
			process_do_function,
			process_do_procedure,
			process_once_function,
			process_once_procedure,
			process_unique_attribute
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new feature validity checker.
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			current_feature := dummy_feature
			create instruction_checker.make (a_universe)
			create rescue_checker.make (a_universe)
			create type_checker.make (a_universe)
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last feature?

feature -- Validity checking

	check_feature_validity (a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `a_feature' in `a_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			a_feature_impl: ET_FEATURE
			a_class_impl: ET_CLASS
		do
			has_fatal_error := False
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
				-- First, make sure that the interface of
				-- `current_class' is valid.
			current_class.process (universe.interface_checker)
			if current_class.has_interface_error then
				set_fatal_error
			else
				a_class_impl := a_feature.implementation_class
				if a_class_impl /= current_class then
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
					internal_call := True
					a_feature.process (Current)
					if internal_call then
							-- Internal error.
						internal_call := False
						set_fatal_error
						error_handler.report_giabr_error
					end
					if current_class = a_class_impl then
						current_feature.set_implementation_checked
						if has_fatal_error then
							current_feature.set_implementation_error
						end
					end
				end
			end
			current_class := old_class
			current_feature := old_feature
		end

feature {NONE} -- Feature validity

	check_attribute_validity (a_feature: ET_ATTRIBUTE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			check_type_validity (a_feature.type)
		end

	check_constant_attribute_validity (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_type: ET_TYPE
			a_constant: ET_CONSTANT
			a_class_impl: ET_CLASS
			a_bit_type: ET_BIT_TYPE
		do
			a_type := a_feature.type
			check_type_validity (a_type)
			if not has_fatal_error then
				a_constant := a_feature.constant
				if a_constant.is_boolean_constant then
					if not a_type.same_named_type (universe.boolean_class, current_class, current_class, universe) then
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc1a_error (current_class, a_feature)
						else
							error_handler.report_vqmc1b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_character_constant then
					if not a_type.same_named_type (universe.character_class, current_class, current_class, universe) then
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc2a_error (current_class, a_feature)
						else
							error_handler.report_vqmc2b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_integer_constant then
					if a_type.same_named_type (universe.integer_class, current_class, current_class, universe) then
						-- OK.
					elseif a_type.same_named_type (universe.integer_8_class, current_class, current_class, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.integer_16_class, current_class, current_class, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					elseif a_type.same_named_type (universe.integer_64_class, current_class, current_class, universe) then
						-- Valid with ISE Eiffel. To be checked with other compilers.
					else
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc3a_error (current_class, a_feature)
						else
							error_handler.report_vqmc3b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_real_constant then
					if a_type.same_named_type (universe.real_class, current_class, current_class, universe) then
						-- OK.
					elseif a_type.same_named_type (universe.double_class, current_class, current_class, universe) then
						-- OK.
					else
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc4a_error (current_class, a_feature)
						else
							error_handler.report_vqmc4b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_string_constant then
					if
						not a_type.same_named_type (universe.string_type, current_class, current_class, universe) and
						not a_type.same_named_type (universe.string_class, current_class, current_class, universe)
					then
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vqmc5a_error (current_class, a_feature)
						else
							error_handler.report_vqmc5b_error (current_class, a_class_impl, a_feature)
						end
					end
				elseif a_constant.is_bit_constant then
					a_bit_type ?= a_type.named_type (current_class, universe)
					if a_bit_type /= Void then
-- TODO: check bit size.
					else
						set_fatal_error
						a_class_impl := current_feature.implementation_class
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
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_arguments_validity (an_arguments)
			end
			check_type_validity (a_feature.type)
		end

	check_deferred_procedure_validity (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_arguments_validity (an_arguments)
			end
		end

	check_do_function_validity (a_feature: ET_DO_FUNCTION) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_arguments_validity (an_arguments)
			end
			check_type_validity (a_feature.type)
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
			end
			if not has_fatal_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound)
				end
				a_compound := a_feature.rescue_clause
				if a_compound /= Void then
					check_rescue_validity (a_compound)
				end
			end
		end

	check_do_procedure_validity (a_feature: ET_DO_PROCEDURE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_arguments_validity (an_arguments)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
			end
			if not has_fatal_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound)
				end
				a_compound := a_feature.rescue_clause
				if a_compound /= Void then
					check_rescue_validity (a_compound)
				end
			end
		end

	check_external_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_arguments_validity (an_arguments)
			end
			check_type_validity (a_feature.type)
		end

	check_external_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_arguments_validity (an_arguments)
			end
		end

	check_once_function_validity (a_feature: ET_ONCE_FUNCTION) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_arguments_validity (an_arguments)
			end
			check_type_validity (a_feature.type)
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
			end
			if not has_fatal_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound)
				end
				a_compound := a_feature.rescue_clause
				if a_compound /= Void then
					check_rescue_validity (a_compound)
				end
			end
		end

	check_once_procedure_validity (a_feature: ET_ONCE_PROCEDURE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				check_arguments_validity (an_arguments)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
			end
			if not has_fatal_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound)
				end
				a_compound := a_feature.rescue_clause
				if a_compound /= Void then
					check_rescue_validity (a_compound)
				end
			end
		end

	check_unique_attribute_validity (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_type: ET_TYPE
			a_class_impl: ET_CLASS
		do
			a_type := a_feature.type
			check_type_validity (a_type)
			if not has_fatal_error then
				if a_type.same_named_type (universe.integer_class, current_class, current_class, universe) then
					-- OK.
				elseif a_type.same_named_type (universe.integer_8_class, current_class, current_class, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.integer_16_class, current_class, current_class, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_type.same_named_type (universe.integer_64_class, current_class, current_class, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				else
					set_fatal_error
					a_class_impl := current_feature.implementation_class
					if current_class = a_class_impl then
						error_handler.report_vqui0a_error (current_class, a_feature)
					else
						error_handler.report_vqui0b_error (current_class, a_class_impl, a_feature)
					end
				end
			end
		end

feature {NONE} -- Locals/Arguments validity

	check_arguments_validity (an_arguments: ET_FORMAL_ARGUMENT_LIST) is
			-- Check validity of `an_arguments'.
		require
			an_arguments_not_void: an_arguments /= Void
		local
			i, nb: INTEGER
		do
			nb := an_arguments.count
			from i := 1 until i > nb loop
				check_type_validity (an_arguments.formal_argument (i).type)
				i := i + 1
			end
		end

	check_locals_validity (a_locals: ET_LOCAL_VARIABLE_LIST) is
			-- Check validity of `a_locals'.
		require
			a_locals_not_void: a_locals /= Void
		local
			i, nb: INTEGER
		do
			nb := a_locals.count
			from i := 1 until i > nb loop
				check_local_type_validity (a_locals.local_variable (i).type)
				i := i + 1
			end
		end

	check_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type'.
		require
			a_type_not_void: a_type /= Void
		local
			a_class_type: ET_CLASS_TYPE
		do
			type_checker.check_type_validity (a_type, current_feature, current_class)
			if type_checker.has_fatal_error then
				set_fatal_error
			else
				if a_type.is_type_expanded (current_class, universe) then
					a_class_type ?= a_type.named_type (current_class, universe)
					if a_class_type /= Void then
						type_checker.check_creation_type_validity (a_class_type, current_feature, current_class, a_type.position)
						if type_checker.has_fatal_error then
							set_fatal_error
						end
					end
				end
			end
		end

	check_local_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type'.
		require
			a_type_not_void: a_type /= Void
		local
			a_class_type: ET_CLASS_TYPE
		do
			type_checker.check_type_validity (a_type, current_feature.implementation_feature, current_feature.implementation_class)
			if type_checker.has_fatal_error then
				set_fatal_error
			else
				if a_type.is_type_expanded (current_class, universe) then
					a_class_type ?= a_type.named_type (current_class, universe)
					if a_class_type /= Void then
						type_checker.check_creation_type_validity (a_class_type, current_feature.implementation_feature, current_feature.implementation_class, a_type.position)
						if type_checker.has_fatal_error then
							set_fatal_error
						end
					end
				end
			end
		end

	type_checker: ET_TYPE_CHECKER
			-- Type checker

feature {NONE} -- Instructions validity

	check_instructions_validity (a_compound: ET_COMPOUND) is
			-- Check validity of `a_compound'.
		require
			a_compound_not_void: a_compound /= Void
		do
			instruction_checker.check_instructions_validity (a_compound, current_feature, current_class)
			if instruction_checker.has_fatal_error then
				set_fatal_error
			end
		end

	instruction_checker: ET_INSTRUCTION_CHECKER
			-- Instruction validity checker

	check_rescue_validity (a_compound: ET_COMPOUND) is
			-- Check validity of Rescue clause `a_compound'.
		require
			a_compound_not_void: a_compound /= Void
		do
			rescue_checker.check_instructions_validity (a_compound, current_feature, current_class)
			if rescue_checker.has_fatal_error then
				set_fatal_error
			end
		end

	rescue_checker: ET_RESCUE_CHECKER
			-- Rescue clause validity checker

feature {ET_AST_NODE} -- Processing

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_attribute_validity (a_feature)
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

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_once_function_validity (a_feature)
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

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			if internal_call then
				internal_call := False
				check_unique_attribute_validity (a_feature)
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

	current_feature: ET_FEATURE
			-- Feature being processed

	current_class: ET_CLASS
			-- Class to with `current_feature' belongs

feature {NONE} -- Implementation

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

	current_feature_not_void: current_feature /= Void
	current_class_not_void: current_class /= Void
	instruction_checker_not_void: instruction_checker /= Void
	rescue_checker_not_void: rescue_checker /= Void
	type_checker_not_void: type_checker /= Void

end
