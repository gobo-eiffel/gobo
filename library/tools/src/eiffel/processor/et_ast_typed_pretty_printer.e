note

	description:

	"[
		Eiffel AST pretty printers with some typing information to help generate hyper-text.
		Use UTF-8 encoding. Note that the byte order mark (BOM) for UTF-8 is not
		printed unless it was found in the class file when parsing the class text
		and `bom_enabled' is True, or it is explicitly printed by calling `print_bom'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2026, Eric Bezault and others"
	license: "MIT License"

class ET_AST_TYPED_PRETTY_PRINTER

inherit

	ET_AST_PRETTY_PRINTER
		rename
			make as make_pretty_printer,
			make_null as make_null_pretty_printer
		redefine
			reset,
			process_attribute,
			process_class,
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
			set_target_type,
			set_target_type_with_seeded_feature
		end

	ET_CLASS_PROCESSOR
		rename
			make as make_class_processor,
			make_ast_processor as make_null_pretty_printer
		undefine
			make_null_pretty_printer
		redefine
			set_current_class
		end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file; a_system_processor: like system_processor)
			-- Create a new typed pretty printer.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
			a_system_processor_not_void: a_system_processor /= Void
		do
			make_class_processor (a_system_processor)
			current_closure := tokens.unknown_feature
			current_closure_impl := tokens.unknown_feature
			current_class_impl := tokens.unknown_class
			current_type := current_class
			create expression_type_finder.make (a_system_processor)
			make_pretty_printer (a_file)
			create internal_type_context.make_with_capacity (current_class, 100)
		ensure
			file_set: file = a_file
			bom_enabled: bom_enabled
			system_processor_set: system_processor = a_system_processor
		end

	make_null (a_system_processor: like system_processor)
			-- Create a new typed pretty printer,
			-- initialized with a null output stream.
		do
			make (null_output_stream, a_system_processor)
		ensure
			file_set: file = null_output_stream
			bom_enabled: bom_enabled
			system_processor_set: system_processor = a_system_processor
		end

feature -- Initialization

	reset
			-- Reset for another pretty-printing.
		do
			precursor
			target_class := Void
			current_closure := tokens.unknown_feature
			current_closure_impl := tokens.unknown_feature
			current_class_impl := tokens.unknown_class
			current_class := tokens.unknown_class
			current_type := current_class
		end

feature -- Access

	current_type: ET_TYPE_CONTEXT
			-- Type of the objects on which features and invariants apply

feature -- Setting

	set_current_class (a_class: like current_class)
			-- Set `current_class' to `a_class'.
		do
			current_class := a_class
			current_type := a_class
		ensure then
			current_type_set: current_type = a_class
		end

	set_current_type (a_type_context: like current_type)
			-- Set `current_type' to `a_type_context'.
		require
			a_type_context_not_void: a_type_context /= Void
		do
			current_type := a_type_context
			current_class := a_type_context.base_class
		ensure
			current_type_set: current_type = a_type_context
			current_class_set: current_class = a_type_context.base_class
		end

feature {ET_AST_PROCESSOR} -- Processing

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		local
			l_old_current_class: like current_class
			l_old_current_type: like current_type
		do
			l_old_current_class := current_class
			l_old_current_type := current_type
			set_current_class (a_class)
			precursor (a_class)
			current_class := l_old_current_class
			current_type := l_old_current_type
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_do_function_inline_agent_declaration (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := an_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := an_expression.implementation_closure
			precursor (an_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_do_procedure_inline_agent_declaration (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := an_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := an_expression.implementation_closure
			precursor (an_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_external_function_inline_agent_declaration (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := an_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := an_expression.implementation_closure
			precursor (an_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_external_procedure_inline_agent_declaration (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := an_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := an_expression.implementation_closure
			precursor (an_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_list
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_list.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_list.implementation_class
			precursor (a_list)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_once_function_inline_agent_declaration (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := an_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := an_expression.implementation_closure
			precursor (an_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_once_procedure_inline_agent_declaration (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := an_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := an_expression.implementation_closure
			precursor (an_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			precursor (a_feature)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

feature {NONE} -- Call targets

	target_class: detachable ET_CLASS
			-- Base class of target when processing a feature name

	current_closure: ET_CLOSURE
			-- Inner closure being processed

	current_closure_impl: ET_CLOSURE
			-- Inner closure where the code being processed has been written
			--
			-- It might be different from `current_closure' or even from
			-- `current_closure.implementation_closure' when
			-- processing inherited assertions. For example:
			--
			--    deferred class A
			--    feature
			--       f (a: ANY)
			--           require
			--               pre: g (a)
			--           deferred
			--           end
			--      g (a: ANY): BOOLEAN deferred end
			--    end
			--    class B
			--    inherit
			--        A
			--    feature
			--        f (a: STRING) do ... end
			--        g (a: STRING): BOOLEAN do ... end
			--    end
			--
			-- When processing the inherited precondition 'pre' in B.f,
			-- `current_closure' is B.f and `current_closure_impl' is A.f
			-- (where the inherited precondition has been written).

	current_class_impl: ET_CLASS
			-- Class where `current_closure_impl' has been written

	set_target (a_target: detachable ET_EXPRESSION)
			-- Set target to be used when processing a feature name.
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			if a_target = Void then
				target_class := Void
			else
				l_context := internal_type_context
				current_type.copy_to_type_context (l_context)
				expression_type_finder.find_expression_type_in_closure (a_target, current_closure_impl, current_closure, current_class_impl, l_context, current_universe.any_type)
				target_class := l_context.base_class
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
				target_class := a_type.base_class (current_type)
			end
		end

	set_target_type_with_seeded_feature (a_type: detachable ET_TYPE; a_seed: INTEGER)
			-- Set target type to be used when processing a feature name.
			-- In case of a formal parameter, choose one of its constraint
			-- adapted base classes containing a feature with seed `a_seed'
			-- (or any of the constraints if none contains such feature).
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			if a_type = Void then
				target_class := Void
			else
				l_context := internal_type_context
				current_type.copy_to_type_context (l_context)
				l_context.put_last (a_type)
				target_class := l_context.adapted_base_class_with_seeded_feature (a_seed).base_class
			end
		end

feature {NONE} -- Implementation

	expression_type_finder: ET_EXPRESSION_TYPE_FINDER
			-- Expression type finder

	internal_type_context: ET_NESTED_TYPE_CONTEXT
			-- Type context to be used internally

invariant

	current_closure_not_void: current_closure /= Void
	current_closure_impl_not_void: current_closure_impl /= Void
	current_class_impl_not_void: current_class_impl /= Void
	current_type_not_void: current_type /= Void
	current_type_is_valid_context: current_type.is_valid_context
	expression_type_finder_not_void: expression_type_finder /= Void
	internal_type_context_not_void: internal_type_context /= Void

end
