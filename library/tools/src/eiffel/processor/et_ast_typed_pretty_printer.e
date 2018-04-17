note

	description:

	"[
		Eiffel AST pretty printers with some typing information to help generate hyper-text.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_TYPED_PRETTY_PRINTER

inherit

	ET_AST_PRETTY_PRINTER
		rename
			make as make_pretty_printer,
			make_null as make_null_pretty_printer
		redefine
			reset,
			process_attribute,
			process_constant_attribute,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent_declaration,
			process_do_procedure,
			process_do_procedure_inline_agent_declaration,
			process_dotnet_function,
			process_dotnet_procedure,
			process_extended_attribute,
			process_external_function,
			process_external_function_inline_agent_declaration,
			process_external_procedure,
			process_external_procedure_inline_agent_declaration,
			process_invariants,
			process_once_function,
			process_once_function_inline_agent_declaration,
			process_once_procedure,
			process_once_procedure_inline_agent_declaration,
			process_unique_attribute,
			set_target,
			set_current_target,
			set_target_type
		end

	ET_CLASS_PROCESSOR
		rename
			make as make_class_processor,
			make_ast_processor as make_null_pretty_printer
		undefine
			make_null_pretty_printer
		end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file; a_system_processor: like system_processor)
			-- Create a new typed pretty printer.
		require
			a_system_processor_not_void: a_system_processor /= Void
		do
			make_class_processor (a_system_processor)
			create expression_type_finder.make (a_system_processor)
			make_pretty_printer (a_file)
			create internal_type_context.make_with_capacity (current_class, 100)
		ensure
			file_set: file = a_file
			system_processor_set: system_processor = a_system_processor
		end

	make_null (a_system_processor: like system_processor)
			-- Create a new typed pretty printer,
			-- initialized with a null output stream.
		do
			make (null_output_stream, a_system_processor)
		ensure
			file_set: file = null_output_stream
			system_processor_set: system_processor = a_system_processor
		end

feature -- Initialization

	reset
			-- Reset for another pretty-printing.
		do
			precursor
			target_class := Void
			current_feature := Void
			current_invariant := Void
			current_inline_agent := Void
			current_class := tokens.unknown_class
		end

feature {ET_AST_PROCESSOR} -- Processing

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_feature: ET_FEATURE
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_do_function_inline_agent_declaration (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_agent: like current_inline_agent
		do
			l_old_agent := current_inline_agent
			current_inline_agent := an_expression
			precursor (an_expression)
			current_inline_agent := l_old_agent
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_do_procedure_inline_agent_declaration (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_agent: like current_inline_agent
		do
			l_old_agent := current_inline_agent
			current_inline_agent := an_expression
			precursor (an_expression)
			current_inline_agent := l_old_agent
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_external_function_inline_agent_declaration (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_agent: like current_inline_agent
		do
			l_old_agent := current_inline_agent
			current_inline_agent := an_expression
			precursor (an_expression)
			current_inline_agent := l_old_agent
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_external_procedure_inline_agent_declaration (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_agent: like current_inline_agent
		do
			l_old_agent := current_inline_agent
			current_inline_agent := an_expression
			precursor (an_expression)
			current_inline_agent := l_old_agent
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
		local
			l_old_invariant: like current_invariant
		do
			l_old_invariant := current_invariant
			current_invariant := a_list
			precursor (a_list)
			current_invariant := l_old_invariant
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_once_function_inline_agent_declaration (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_agent: like current_inline_agent
		do
			l_old_agent := current_inline_agent
			current_inline_agent := an_expression
			precursor (an_expression)
			current_inline_agent := l_old_agent
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

	process_once_procedure_inline_agent_declaration (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_agent: like current_inline_agent
		do
			l_old_agent := current_inline_agent
			current_inline_agent := an_expression
			precursor (an_expression)
			current_inline_agent := l_old_agent
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			precursor (a_feature)
			current_feature := l_old_feature
		end

feature {NONE} -- Call targets

	target_class: detachable ET_CLASS
			-- Base class of target when processing a feature name

	current_feature: detachable ET_FEATURE
			-- Feature being processed

	current_invariant: detachable ET_INVARIANTS
			-- Invariant being processed

	current_inline_agent: detachable ET_INLINE_AGENT
			-- Inline agent being processed

	set_target (a_target: detachable ET_EXPRESSION)
			-- Set target to be used when processing a feature name.
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			if a_target = Void then
				target_class := Void
			else
				if attached current_feature as l_current_feature then
					l_context := internal_type_context
					l_context.reset (current_class)
					if attached current_inline_agent as l_current_agent then
						expression_type_finder.find_expression_type_in_agent (a_target, l_current_agent, l_current_feature, l_context, current_universe.any_type)
					else
						expression_type_finder.find_expression_type_in_feature (a_target, l_current_feature, l_context, current_universe.any_type)
					end
					target_class := l_context.base_class
				elseif attached current_invariant as l_current_invariant then
					l_context := internal_type_context
					l_context.reset (current_class)
					if attached current_inline_agent as l_current_agent then
						expression_type_finder.find_expression_type_in_agent (a_target, l_current_agent, l_current_invariant, l_context, current_universe.any_type)
					else
						expression_type_finder.find_expression_type_in_invariant (a_target, l_current_invariant, l_context, current_universe.any_type)
					end
					target_class := l_context.base_class
				else
					target_class := Void
				end
			end
		end

	set_current_target
			-- Set 'Current' as target to be used when processing a feature name.
		do
			target_class := current_class
		end

	set_target_type (a_type: detachable ET_TYPE)
			-- Set target type to be used when processing a feature name.
		do
			if a_type = Void then
				target_class := Void
			else
				target_class := a_type.base_class (current_class)
			end
		end

feature {NONE} -- Implementation

	expression_type_finder: ET_EXPRESSION_TYPE_FINDER
			-- Expression type finder

	internal_type_context: ET_NESTED_TYPE_CONTEXT
			-- Type context to be used internally

invariant

	expression_type_finder_not_void: expression_type_finder /= Void
	internal_type_context_not_void: internal_type_context /= Void

end
