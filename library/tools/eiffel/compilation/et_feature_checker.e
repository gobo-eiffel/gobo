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
		end

feature -- Access

	current_feature: ET_FEATURE
			-- Feature being processed

	current_class: ET_CLASS
			-- Class to with `current_feature' belongs

feature -- Validity checking

	check_feature_validity (a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `a_feature' in `a_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
		do
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
				-- First, make sure that the interface of
				-- `current_class' is valid.
			current_class.process (universe.interface_checker)
			if not current_class.has_interface_error then
				internal_call := True
				a_feature.process (Current)
				internal_call := False
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
			a_feature.declared_type.process (Current)
		end

	check_constant_attribute_validity (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			a_feature.declared_type.process (Current)
			a_feature.constant.process (Current)
		end

	check_deferred_function_validity (a_feature: ET_DEFERRED_FUNCTION) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
		end

	check_deferred_procedure_validity (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
		end

	check_do_function_validity (a_feature: ET_DO_FUNCTION) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			has_local_error: BOOLEAN
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND

			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
		do
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
			end
			if not has_local_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound)
				end
			end



			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := a_feature.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
		end

	check_do_procedure_validity (a_feature: ET_DO_PROCEDURE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			has_local_error: BOOLEAN
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND

			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
		do
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
			end
			if not has_local_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound)
				end
			end



			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := a_feature.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
		end

	check_external_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			an_alias_clause: ET_EXTERNAL_ALIAS
			a_postconditions: ET_POSTCONDITIONS
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.language.process (Current)
			an_alias_clause := a_feature.alias_clause
			if an_alias_clause /= Void then
				an_alias_clause.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
		end

	check_external_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			an_alias_clause: ET_EXTERNAL_ALIAS
			a_postconditions: ET_POSTCONDITIONS
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.language.process (Current)
			an_alias_clause := a_feature.alias_clause
			if an_alias_clause /= Void then
				an_alias_clause.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
		end

	check_once_function_validity (a_feature: ET_ONCE_FUNCTION) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			has_local_error: BOOLEAN
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND

			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
		do
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
			end
			if not has_local_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound)
				end
			end



			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := a_feature.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
		end

	check_once_procedure_validity (a_feature: ET_ONCE_PROCEDURE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			has_local_error: BOOLEAN
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_compound: ET_COMPOUND


			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
		do
			a_locals := a_feature.locals
			if a_locals /= Void then
				check_locals_validity (a_locals)
			end
			if not has_local_error then
				a_compound := a_feature.compound
				if a_compound /= Void then
					check_instructions_validity (a_compound)
				end
			end



			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := a_feature.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
		end

	check_unique_attribute_validity (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Check validity of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			a_feature.declared_type.process (Current)
		end

feature {NONE} -- Locals validity

	check_locals_validity (a_locals: ET_LOCAL_VARIABLE_LIST) is
			-- Check validity of `a_locals'.
		require
			a_locals_not_void: a_locals /= Void
		do
		end

feature {NONE} -- Instructions validity

	check_instructions_validity (a_compound: ET_COMPOUND) is
			-- Check validity of `a_compound'.
		require
			a_compound_not_void: a_compound /= Void
		do
			instruction_checker.check_instructions_validity (a_compound, current_feature, current_class)
		end

	instruction_checker: ET_INSTRUCTION_CHECKER
			-- Instruction validity checker

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

feature {NONE} -- Implementation

	internal_call: BOOLEAN
			-- Have the process routines been called from here?

	dummy_feature: ET_FEATURE is
			-- Dummy feature
		local
			a_name: ET_FEATURE_NAME
			a_clients: ET_NONE_CLIENTS
		once
			create {ET_IDENTIFIER} a_name.make ("**dummy**")
			create a_clients.make (tokens.left_brace_symbol, tokens.right_brace_symbol)
			create {ET_DEFERRED_PROCEDURE} Result.make (a_name, Void, Void, Void, Void, a_clients, current_class)
		ensure
			dummy_feature_not_void: Result /= Void
		end

invariant

	current_feature_not_void: current_feature /= Void
	current_class_not_void: current_class /= Void
	instruction_checker_not_void: instruction_checker /= Void

end
