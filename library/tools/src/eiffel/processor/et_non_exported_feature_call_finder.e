note

	description:

		"Finders of calls whose feature is not exported"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_NON_EXPORTED_FEATURE_CALL_FINDER

inherit

	ET_FEATURE_CALLEE_FINDER
		rename
			find_callees as find_non_exported_feature_calls,
			find_callees_in_ast_node as find_non_exported_feature_calls_in_ast_node
		redefine
			find_non_exported_feature_calls_in_ast_node,
			report_callee,
			process_creation_expression,
			process_creation_instruction
		end

create

	make

feature -- Basic operations

	find_non_exported_feature_calls_in_ast_node (a_ast_node: ET_AST_NODE; a_closure_impl, a_closure: ET_CLOSURE; a_class_impl, a_class: ET_CLASS)
			-- Find non-exported features called in `a_ast_node' which is written in `a_closure_impl`
			-- in `a_class_impl` and viewed from `a_closure` in `a_class`.
		do
			has_non_exported_feature_calls := False
			precursor (a_ast_node, a_closure_impl, a_closure, a_class_impl, a_class)
		end

	report_callee (a_call_name: ET_CALL_NAME; a_callee_class: ET_CLASS)
			-- Report that feature `a_call_name' from `a_callee_class'
			-- is called in a closure from `current_class'.
		do
			if attached a_callee_class.seeded_feature (a_call_name.seed) as l_feature then
				if not l_feature.is_exported_to (a_callee_class.current_system.any_type.base_class, system_processor) then
					has_non_exported_feature_calls := True
				end
			end
		end

	report_creation_callee (a_call_name: ET_CALL_NAME; a_callee_class: ET_CLASS)
			-- Report that feature `a_call_name' from `a_callee_class'
			-- is called as a creation procedure in a closure from `current_class'.
		do
			if attached a_callee_class.seeded_procedure (a_call_name.seed) as l_procedure then
				if not l_procedure.is_creation_exported_to (a_callee_class.current_system.any_type.base_class, a_callee_class, system_processor) then
					has_non_exported_feature_calls := True
				end
			end
		end

feature -- Status report

	has_non_exported_feature_calls: BOOLEAN
			-- Have non-exported feature calls been found?

feature {ET_AST_NODE} -- Processing

	process_creation_expression (a_expression: ET_CREATION_EXPRESSION)
			-- Process `a_expression`.
		local
			l_name: ET_FEATURE_NAME
			l_class: ET_CLASS
		do
			l_name := a_expression.name
			internal_type_context.reset (current_class)
			internal_type_context.put_last (a_expression.type)
			l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_name.seed).base_class
			report_creation_callee (l_name, l_class)
		end

	process_creation_instruction (a_instruction: ET_CREATION_INSTRUCTION)
			-- Process `a_instruction`.
		local
			l_name: ET_FEATURE_NAME
			l_class: ET_CLASS
			l_target: ET_WRITABLE
		do
			l_name := a_instruction.name
			l_target := a_instruction.target
			internal_type_context.reset (current_class)
			if attached a_instruction.type as l_type then
				internal_type_context.put_last (l_type)
			else
				expression_type_finder.find_expression_type_in_closure (l_target, current_closure_impl, current_closure, current_class_impl, internal_type_context, current_universe.detachable_separate_any_type)
			end
			l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_name.seed).base_class
			report_creation_callee (l_name, l_class)
			if attached {ET_IDENTIFIER} l_target as l_identifier and then l_identifier.is_feature_name then
				report_callee (l_identifier, current_class)
			end
		end

end
