note

	description:

		"Builders for document highlights"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_DOCUMENT_HIGHLIGHT_BUILDER

inherit

	ET_AST_ITERATOR
		rename
			make as make_ast_iterator
		redefine
			process_across_expression,
			process_across_instruction,
			process_check_instruction,
			process_class,
			process_constraint_creator,
			process_constraint_rename_list,
			process_debug_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_dotnet_function,
			process_dotnet_procedure,
			process_extended_attribute,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_if_expression,
			process_if_instruction,
			process_infix_and_then_operator,
			process_infix_or_else_operator,
			process_inline_separate_instruction,
			process_inspect_expression,
			process_inspect_instruction,
			process_loop_instruction,
			process_named_object_test,
			process_once_function,
			process_once_function_inline_agent,
			process_once_procedure,
			process_once_procedure_inline_agent,
			process_parent
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} end

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_message_manager: like message_manager)
			-- Create a new document highlight builder.
		require
			a_response_not_void: a_response /= Void
			a_message_manager_not_void: a_message_manager /= Void
		do
			response := a_response
			message_manager := a_message_manager
			current_class := tokens.unknown_class
			current_keyword := tokens.if_keyword
			make_ast_iterator
		ensure
			response_set: response = a_response
			message_manager_set: message_manager = a_message_manager
		end

feature -- Access

	response: LS_DOCUMENT_HIGHLIGHT_RESPONSE
			-- List of document highlights to be built

	message_manager: GELSP
			-- Message manager

feature -- Basic operations

	build_document_highlight (a_keyword: ET_KEYWORD; a_class: ET_CLASS)
			-- Build document highlight for `a_keyword` in `a_class`.
		require
			a_keyword_not_void: a_keyword /= Void
			a_class_not_void: a_class /= Void
		local
			l_old_keyword: like current_keyword
			l_old_class: like current_class
		do
			l_old_class := current_class
			current_class := a_class
			l_old_keyword := current_keyword
			current_keyword := a_keyword
			a_class.process (Current)
			current_keyword := l_old_keyword
			current_class := l_old_class
		end

feature {ET_AST_NODE} -- Processing

	process_across_expression (an_expression: ET_ACROSS_EXPRESSION)
			-- Process `an_expression'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_across then
				l_found := an_expression.across_keyword = current_keyword
			elseif current_keyword.is_as then
				l_found := an_expression.as_keyword = current_keyword
			elseif current_keyword.is_invariant then
				l_found := attached an_expression.invariant_part as l_invariant_part and then l_invariant_part.invariant_keyword = current_keyword
			elseif current_keyword.is_until then
				l_found := attached {ET_KEYWORD_EXPRESSION} an_expression.until_conditional as l_until_conditional and then l_until_conditional.keyword = current_keyword
			elseif current_keyword.is_all or current_keyword.is_some then
				l_found := attached {ET_KEYWORD_EXPRESSION} an_expression.iteration_conditional as l_iteration_conditional and then l_iteration_conditional.keyword = current_keyword
			elseif current_keyword.is_variant then
				l_found := attached an_expression.variant_part as l_variant_part and then l_variant_part.variant_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := an_expression.end_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (an_expression.across_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				l_range := message_manager.range (an_expression.as_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				if attached an_expression.invariant_part as l_invariant_part then
					l_range := message_manager.range (l_invariant_part.invariant_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_EXPRESSION} an_expression.until_conditional as l_until_conditional then
					l_range := message_manager.range (l_until_conditional.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_EXPRESSION} an_expression.iteration_conditional as l_iteration_conditional then
					l_range := message_manager.range (l_iteration_conditional.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_expression.variant_part as l_variant_part then
					l_range := message_manager.range (l_variant_part.variant_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (an_expression.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (an_expression)
			end
		end

	process_across_instruction (an_instruction: ET_ACROSS_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_across then
				l_found := an_instruction.across_keyword = current_keyword
			elseif current_keyword.is_as then
				l_found := an_instruction.as_keyword = current_keyword
			elseif current_keyword.is_from then
				l_found := attached an_instruction.from_compound as l_from_compound and then l_from_compound.keyword = current_keyword
			elseif current_keyword.is_invariant then
				l_found := attached an_instruction.invariant_part as l_invariant_part and then l_invariant_part.invariant_keyword = current_keyword
			elseif current_keyword.is_until then
				l_found := attached {ET_KEYWORD_EXPRESSION} an_instruction.until_conditional as l_until_conditional and then l_until_conditional.keyword = current_keyword
			elseif current_keyword.is_loop then
				l_found := attached an_instruction.loop_compound as l_loop_compound and then l_loop_compound.keyword = current_keyword
			elseif current_keyword.is_variant then
				l_found := attached an_instruction.variant_part as l_variant_part and then l_variant_part.variant_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := an_instruction.end_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (an_instruction.across_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				l_range := message_manager.range (an_instruction.as_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				if attached an_instruction.from_compound as l_from_compound then
					l_range := message_manager.range (l_from_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_instruction.invariant_part as l_invariant_part then
					l_range := message_manager.range (l_invariant_part.invariant_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_EXPRESSION} an_instruction.until_conditional as l_until_conditional then
					l_range := message_manager.range (l_until_conditional.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_instruction.loop_compound as l_loop_compound then
					l_range := message_manager.range (l_loop_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_instruction.variant_part as l_variant_part then
					l_range := message_manager.range (l_variant_part.variant_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (an_instruction.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (an_instruction)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_check then
				l_found := an_instruction.check_keyword = current_keyword
			elseif current_keyword.is_then then
				l_found := attached an_instruction.then_compound as l_then_compound and then l_then_compound.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := an_instruction.end_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (an_instruction.check_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				if attached an_instruction.then_compound as l_then_compound then
					l_range := message_manager.range (l_then_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (an_instruction.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (an_instruction)
			end
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_class then
				l_found := a_class.class_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_class.end_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (a_class.class_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				l_range := message_manager.range (a_class.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (a_class)
			end
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR)
			-- Process `a_list'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_create then
				l_found := a_list.create_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_list.end_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (a_list.create_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				l_range := message_manager.range (a_list.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (a_list)
			end
		end

	process_constraint_rename_list (a_list: ET_CONSTRAINT_RENAME_LIST)
			-- Process `a_list'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_rename then
				l_found := a_list.rename_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_list.end_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (a_list.rename_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				l_range := message_manager.range (a_list.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (a_list)
			end
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_debug then
				l_found := attached an_instruction.compound as l_compound and then l_compound.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := an_instruction.end_keyword = current_keyword
			end
			if l_found then
				if attached an_instruction.compound as l_compound then
					l_range := message_manager.range (l_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (an_instruction.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (an_instruction)
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		do
			process_deferred_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		do
			process_deferred_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_deferred_routine (a_feature: ET_DEFERRED_ROUTINE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_is then
				l_found := a_feature.is_keyword = current_keyword
			elseif current_keyword.is_note or current_keyword.is_indexing then
				l_found := attached a_feature.first_note as l_first_note and then l_first_note.note_keyword = current_keyword
			elseif current_keyword.is_obsolete then
				l_found := attached {ET_KEYWORD_EXPRESSION} a_feature.obsolete_message as l_obsolete_message and then l_obsolete_message.keyword = current_keyword
			elseif current_keyword.is_require then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.require_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_deferred then
				l_found := a_feature.deferred_keyword = current_keyword
			elseif current_keyword.is_ensure then
				l_found := attached a_feature.postconditions as l_postconditions and then l_postconditions.ensure_keyword = current_keyword
			elseif current_keyword.is_then then
				l_found := attached a_feature.postconditions as l_postconditions and then l_postconditions.then_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_feature.end_keyword = current_keyword
			end
			if l_found then
				if attached a_feature.is_keyword as l_is_keyword then
					l_range := message_manager.range (l_is_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.first_note as l_first_note then
					l_range := message_manager.range (l_first_note.note_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_EXPRESSION} a_feature.obsolete_message as l_obsolete_message then
					l_range := message_manager.range (l_obsolete_message.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.preconditions as l_preconditions then
					l_range := message_manager.range (l_preconditions.require_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_preconditions.else_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				l_range := message_manager.range (a_feature.deferred_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				if attached a_feature.postconditions as l_postconditions then
					l_range := message_manager.range (l_postconditions.ensure_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_postconditions.then_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				l_range := message_manager.range (a_feature.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
			if attached {LS_NULL} response.result_ then
				precursor (an_expression)
			end
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
			if attached {LS_NULL} response.result_ then
				precursor (an_expression)
			end
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		do
			process_dotnet_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		do
			process_dotnet_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_dotnet_routine (a_feature: ET_DOTNET_ROUTINE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_is then
				l_found := a_feature.is_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_feature.end_keyword = current_keyword
			end
			if l_found then
				if attached a_feature.is_keyword as l_is_keyword then
					l_range := message_manager.range (l_is_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (a_feature.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			end
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_note or current_keyword.is_indexing then
				l_found := attached a_feature.first_note as l_first_note and then l_first_note.note_keyword = current_keyword
			elseif current_keyword.is_obsolete then
				l_found := attached {ET_KEYWORD_EXPRESSION} a_feature.obsolete_message as l_obsolete_message and then l_obsolete_message.keyword = current_keyword
			elseif current_keyword.is_require then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.require_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_local then
				l_found := attached a_feature.locals as l_locals and then l_locals.local_keyword = current_keyword
			elseif current_keyword.is_do then
				l_found := attached a_feature.compound as l_compound and then l_compound.keyword = current_keyword
			elseif current_keyword.is_ensure then
				l_found := attached a_feature.postconditions as l_postconditions and then l_postconditions.ensure_keyword = current_keyword
			elseif current_keyword.is_then then
				l_found := attached a_feature.postconditions as l_postconditions and then l_postconditions.then_keyword = current_keyword
			elseif current_keyword.is_rescue then
				l_found := attached a_feature.rescue_clause as l_rescue_clause and then l_rescue_clause.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_feature.end_keyword = current_keyword
			end
			if l_found then
				if attached a_feature.first_note as l_first_note then
					l_range := message_manager.range (l_first_note.note_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_EXPRESSION} a_feature.obsolete_message as l_obsolete_message then
					l_range := message_manager.range (l_obsolete_message.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.preconditions as l_preconditions then
					l_range := message_manager.range (l_preconditions.require_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_preconditions.else_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				if attached a_feature.locals as l_locals then
					l_range := message_manager.range (l_locals.local_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.compound as l_compound then
					l_range := message_manager.range (l_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.postconditions as l_postconditions then
					l_range := message_manager.range (l_postconditions.ensure_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_postconditions.then_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				if attached a_feature.rescue_clause as l_rescue_clause then
					l_range := message_manager.range (l_rescue_clause.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (a_feature.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (a_feature)
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		do
			process_external_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_external_routine_inline_agent (an_expression)
			if attached {LS_NULL} response.result_ then
				precursor (an_expression)
			end
		end

	process_external_routine_inline_agent (an_expression: ET_EXTERNAL_ROUTINE_INLINE_AGENT)
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_agent then
				l_found := an_expression.agent_keyword = current_keyword
			elseif current_keyword.is_require then
				l_found := attached an_expression.preconditions as l_preconditions and then l_preconditions.require_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached an_expression.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached an_expression.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_external then
				l_found := attached {ET_KEYWORD_MANIFEST_STRING} an_expression.language as l_language and then l_language.keyword = current_keyword
			elseif current_keyword.is_alias then
				l_found := attached {ET_KEYWORD_MANIFEST_STRING} an_expression.alias_clause as l_alias_clause and then l_alias_clause.keyword = current_keyword
			elseif current_keyword.is_ensure then
				l_found := attached an_expression.postconditions as l_postconditions and then l_postconditions.ensure_keyword = current_keyword
			elseif current_keyword.is_then then
				l_found := attached an_expression.postconditions as l_postconditions and then l_postconditions.then_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := an_expression.end_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (an_expression.agent_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				if attached an_expression.preconditions as l_preconditions then
					l_range := message_manager.range (l_preconditions.require_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_preconditions.else_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				if attached {ET_KEYWORD_MANIFEST_STRING} an_expression.language as l_language then
					l_range := message_manager.range (l_language.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_MANIFEST_STRING} an_expression.alias_clause as l_alias_clause then
					l_range := message_manager.range (l_alias_clause.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_expression.postconditions as l_postconditions then
					l_range := message_manager.range (l_postconditions.ensure_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_postconditions.then_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				l_range := message_manager.range (an_expression.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			end
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		do
			process_external_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_external_routine_inline_agent (an_expression)
			if attached {LS_NULL} response.result_ then
				precursor (an_expression)
			end
		end

	process_external_routine (a_feature: ET_EXTERNAL_ROUTINE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_is then
				l_found := a_feature.is_keyword = current_keyword
			elseif current_keyword.is_note or current_keyword.is_indexing then
				l_found := attached a_feature.first_note as l_first_note and then l_first_note.note_keyword = current_keyword
			elseif current_keyword.is_obsolete then
				l_found := attached {ET_KEYWORD_EXPRESSION} a_feature.obsolete_message as l_obsolete_message and then l_obsolete_message.keyword = current_keyword
			elseif current_keyword.is_require then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.require_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_external then
				l_found := attached {ET_KEYWORD_MANIFEST_STRING} a_feature.language as l_language and then l_language.keyword = current_keyword
			elseif current_keyword.is_alias then
				l_found := attached {ET_KEYWORD_MANIFEST_STRING} a_feature.alias_clause as l_alias_clause and then l_alias_clause.keyword = current_keyword
			elseif current_keyword.is_ensure then
				l_found := attached a_feature.postconditions as l_postconditions and then l_postconditions.ensure_keyword = current_keyword
			elseif current_keyword.is_then then
				l_found := attached a_feature.postconditions as l_postconditions and then l_postconditions.then_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_feature.end_keyword = current_keyword
			end
			if l_found then
				if attached a_feature.is_keyword as l_is_keyword then
					l_range := message_manager.range (l_is_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.first_note as l_first_note then
					l_range := message_manager.range (l_first_note.note_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_EXPRESSION} a_feature.obsolete_message as l_obsolete_message then
					l_range := message_manager.range (l_obsolete_message.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.preconditions as l_preconditions then
					l_range := message_manager.range (l_preconditions.require_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_preconditions.else_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				if attached {ET_KEYWORD_MANIFEST_STRING} a_feature.language as l_language then
					l_range := message_manager.range (l_language.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_MANIFEST_STRING} a_feature.alias_clause as l_alias_clause then
					l_range := message_manager.range (l_alias_clause.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.postconditions as l_postconditions then
					l_range := message_manager.range (l_postconditions.ensure_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_postconditions.then_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				l_range := message_manager.range (a_feature.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			end
		end

	process_if_expression (a_expression: ET_IF_EXPRESSION)
			-- Process `a_expression'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
			i, nb: INTEGER
		do
			if current_keyword.is_if then
				l_found := attached {ET_KEYWORD_EXPRESSION} a_expression.conditional as l_conditional and then l_conditional.keyword = current_keyword
			elseif current_keyword.is_then then
				if a_expression.then_keyword = current_keyword then
					l_found := True
				elseif attached a_expression.elseif_parts as l_elseif_parts then
					nb := l_elseif_parts.count
					from i := 1 until i > nb loop
						if l_elseif_parts.item (i).then_keyword = current_keyword then
							l_found := True
							i := nb -- Jump out of the loop.
						end
						i := i + 1
					end
				end
			elseif current_keyword.is_elseif then
				if attached a_expression.elseif_parts as l_elseif_parts then
					nb := l_elseif_parts.count
					from i := 1 until i > nb loop
						if attached {ET_KEYWORD_EXPRESSION} l_elseif_parts.item (i).conditional as l_conditional and then l_conditional.keyword = current_keyword then
							l_found := True
						end
						i := i + 1
					end
				end
			elseif current_keyword.is_else then
				l_found := a_expression.else_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_expression.end_keyword = current_keyword
			end
			if l_found then
				if attached {ET_KEYWORD_EXPRESSION} a_expression.conditional as l_conditional then
					l_range := message_manager.range (l_conditional.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (a_expression.then_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				if attached a_expression.elseif_parts as l_elseif_parts then
					nb := l_elseif_parts.count
					from i := 1 until i > nb loop
						if attached {ET_KEYWORD_EXPRESSION} l_elseif_parts.item (i).conditional as l_conditional then
							l_range := message_manager.range (l_conditional.keyword, current_class)
							create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
							response.add_document_highlight (l_document_highlight)
						end
						l_range := message_manager.range (l_elseif_parts.item (i).then_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
						i := i + 1
					end
				end
				l_range := message_manager.range (a_expression.else_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				l_range := message_manager.range (a_expression.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (a_expression)
			end
		end

	process_if_instruction (a_instruction: ET_IF_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
			i, nb: INTEGER
		do
			if current_keyword.is_if then
				l_found := attached {ET_KEYWORD_EXPRESSION} a_instruction.conditional as l_conditional and then l_conditional.keyword = current_keyword
			elseif current_keyword.is_then then
				if attached a_instruction.then_compound as l_then_compound and then l_then_compound.keyword = current_keyword then
					l_found := True
				elseif attached a_instruction.elseif_parts as l_elseif_parts then
					nb := l_elseif_parts.count
					from i := 1 until i > nb loop
						if attached l_elseif_parts.item (i).then_compound as l_then_compound and then l_then_compound.keyword = current_keyword then
							l_found := True
							i := nb -- Jump out of the loop.
						end
						i := i + 1
					end
				end
			elseif current_keyword.is_elseif then
				if attached a_instruction.elseif_parts as l_elseif_parts then
					nb := l_elseif_parts.count
					from i := 1 until i > nb loop
						if attached {ET_KEYWORD_EXPRESSION} l_elseif_parts.item (i).conditional as l_conditional and then l_conditional.keyword = current_keyword then
							l_found := True
						end
						i := i + 1
					end
				end
			elseif current_keyword.is_else then
				l_found := attached a_instruction.else_compound as l_else_compound and then l_else_compound.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_instruction.end_keyword = current_keyword
			end
			if l_found then
				if attached {ET_KEYWORD_EXPRESSION} a_instruction.conditional as l_conditional then
					l_range := message_manager.range (l_conditional.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_instruction.then_compound as l_then_compound then
					l_range := message_manager.range (l_then_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_instruction.elseif_parts as l_elseif_parts then
					nb := l_elseif_parts.count
					from i := 1 until i > nb loop
						if attached {ET_KEYWORD_EXPRESSION} l_elseif_parts.item (i).conditional as l_conditional then
							l_range := message_manager.range (l_conditional.keyword, current_class)
							create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
							response.add_document_highlight (l_document_highlight)
						end
						if attached l_elseif_parts.item (i).then_compound as l_then_compound then
							l_range := message_manager.range (l_then_compound.keyword, current_class)
							create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
							response.add_document_highlight (l_document_highlight)
						end
						i := i + 1
					end
				end
				if attached a_instruction.else_compound as l_else_compound then
					l_range := message_manager.range (l_else_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (a_instruction.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (a_instruction)
			end
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR)
			-- Process `an_operator'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_and then
				l_found := an_operator.and_keyword = current_keyword
			elseif current_keyword.is_then then
				l_found := an_operator.then_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (an_operator.and_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				l_range := message_manager.range (an_operator.then_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (an_operator)
			end
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR)
			-- Process `an_operator'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_or then
				l_found := an_operator.or_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := an_operator.else_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (an_operator.or_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				l_range := message_manager.range (an_operator.else_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (an_operator)
			end
		end

	process_inline_separate_instruction (a_instruction: ET_INLINE_SEPARATE_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
			i, nb: INTEGER
		do
			if current_keyword.is_separate then
				l_found := a_instruction.arguments.separate_keyword = current_keyword
			elseif current_keyword.is_as then
				nb := a_instruction.arguments.count
				from i := 1 until i > nb loop
					if a_instruction.arguments.argument (i).as_keyword = current_keyword then
						l_found := True
						i := nb -- Jump out of the loop.
					end
					i := i + 1
				end
			elseif current_keyword.is_do then
				l_found := attached a_instruction.compound as l_compound and then l_compound.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_instruction.end_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (a_instruction.arguments.separate_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				nb := a_instruction.arguments.count
				from i := 1 until i > nb loop
					l_range := message_manager.range (a_instruction.arguments.argument (i).as_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					i := i + 1
				end
				if attached a_instruction.compound as l_compound then
					l_range := message_manager.range (l_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (a_instruction.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (a_instruction)
			end
		end

	process_inspect_expression (a_expression: ET_INSPECT_EXPRESSION)
			-- Process `a_expression'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
			i, nb: INTEGER
		do
			if current_keyword.is_inspect then
				l_found := attached {ET_KEYWORD_EXPRESSION} a_expression.conditional as l_conditional and then l_conditional.keyword = current_keyword
			elseif current_keyword.is_when then
				if attached a_expression.when_parts as l_when_parts then
					nb := l_when_parts.count
					from i := 1 until i > nb loop
						if l_when_parts.item (i).choices.when_keyword  = current_keyword then
							l_found := True
							i := nb
						end
						i := i + 1
					end
				end
			elseif current_keyword.is_then then
				if attached a_expression.when_parts as l_when_parts then
					nb := l_when_parts.count
					from i := 1 until i > nb loop
						if l_when_parts.item (i).then_keyword = current_keyword then
							l_found := True
							i := nb
						end
						i := i + 1
					end
				end
			elseif current_keyword.is_else then
				l_found :=  attached {ET_KEYWORD_EXPRESSION} a_expression.else_part as l_else_part and then l_else_part.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_expression.end_keyword = current_keyword
			end
			if l_found then
				if attached {ET_KEYWORD_EXPRESSION} a_expression.conditional as l_conditional then
					l_range := message_manager.range (l_conditional.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_expression.when_parts as l_when_parts then
					nb := l_when_parts.count
					from i := 1 until i > nb loop
						l_range := message_manager.range (l_when_parts.item (i).choices.when_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
						l_range := message_manager.range (l_when_parts.item (i).then_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
						i := i + 1
					end
				end
				if attached {ET_KEYWORD_EXPRESSION} a_expression.else_part as l_else_part then
					l_range := message_manager.range (l_else_part.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (a_expression.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (a_expression)
			end
		end

	process_inspect_instruction (a_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `a_expression'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
			i, nb: INTEGER
		do
			if current_keyword.is_inspect then
				l_found := attached {ET_KEYWORD_EXPRESSION} a_instruction.conditional as l_conditional and then l_conditional.keyword = current_keyword
			elseif current_keyword.is_when then
				if attached a_instruction.when_parts as l_when_parts then
					nb := l_when_parts.count
					from i := 1 until i > nb loop
						if l_when_parts.item (i).choices.when_keyword  = current_keyword then
							l_found := True
							i := nb
						end
						i := i + 1
					end
				end
			elseif current_keyword.is_then then
				if attached a_instruction.when_parts as l_when_parts then
					nb := l_when_parts.count
					from i := 1 until i > nb loop
						if attached l_when_parts.item (i).then_compound as l_then_compound and then l_then_compound.keyword = current_keyword then
							l_found := True
							i := nb
						end
						i := i + 1
					end
				end
			elseif current_keyword.is_else then
				l_found :=  attached a_instruction.else_compound as l_else_compound and then l_else_compound.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_instruction.end_keyword = current_keyword
			end
			if l_found then
				if attached {ET_KEYWORD_EXPRESSION} a_instruction.conditional as l_conditional then
					l_range := message_manager.range (l_conditional.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_instruction.when_parts as l_when_parts then
					nb := l_when_parts.count
					from i := 1 until i > nb loop
						l_range := message_manager.range (l_when_parts.item (i).choices.when_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
						if attached l_when_parts.item (i).then_compound as l_then_compound then
							l_range := message_manager.range (l_then_compound.keyword, current_class)
							create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
							response.add_document_highlight (l_document_highlight)
						end
						i := i + 1
					end
				end
				if attached a_instruction.else_compound as l_else_compound then
					l_range := message_manager.range (l_else_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (a_instruction.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (a_instruction)
			end
		end

	process_internal_routine (a_feature: ET_INTERNAL_ROUTINE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_is then
				l_found := a_feature.is_keyword = current_keyword
			elseif current_keyword.is_note or current_keyword.is_indexing then
				l_found := attached a_feature.first_note as l_first_note and then l_first_note.note_keyword = current_keyword
			elseif current_keyword.is_obsolete then
				l_found := attached {ET_KEYWORD_EXPRESSION} a_feature.obsolete_message as l_obsolete_message and then l_obsolete_message.keyword = current_keyword
			elseif current_keyword.is_require then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.require_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached a_feature.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_local then
				l_found := attached a_feature.locals as l_locals and then l_locals.local_keyword = current_keyword
			elseif current_keyword.is_do then
				l_found := attached a_feature.compound as l_compound and then l_compound.keyword = current_keyword
			elseif current_keyword.is_ensure then
				l_found := attached a_feature.postconditions as l_postconditions and then l_postconditions.ensure_keyword = current_keyword
			elseif current_keyword.is_then then
				l_found := attached a_feature.postconditions as l_postconditions and then l_postconditions.then_keyword = current_keyword
			elseif current_keyword.is_rescue then
				l_found := attached a_feature.rescue_clause as l_rescue_clause and then l_rescue_clause.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_feature.end_keyword = current_keyword
			end
			if l_found then
				if attached a_feature.is_keyword as l_is_keyword then
					l_range := message_manager.range (l_is_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.first_note as l_first_note then
					l_range := message_manager.range (l_first_note.note_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_EXPRESSION} a_feature.obsolete_message as l_obsolete_message then
					l_range := message_manager.range (l_obsolete_message.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.preconditions as l_preconditions then
					l_range := message_manager.range (l_preconditions.require_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_preconditions.else_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				if attached a_feature.locals as l_locals then
					l_range := message_manager.range (l_locals.local_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.compound as l_compound then
					l_range := message_manager.range (l_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_feature.postconditions as l_postconditions then
					l_range := message_manager.range (l_postconditions.ensure_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_postconditions.then_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				if attached a_feature.rescue_clause as l_rescue_clause then
					l_range := message_manager.range (l_rescue_clause.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (a_feature.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			end
		end

	process_internal_routine_inline_agent (an_expression: ET_INTERNAL_ROUTINE_INLINE_AGENT)
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_agent then
				l_found := an_expression.agent_keyword = current_keyword
			elseif current_keyword.is_require then
				l_found := attached an_expression.preconditions as l_preconditions and then l_preconditions.require_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached an_expression.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_else then
				l_found := attached an_expression.preconditions as l_preconditions and then l_preconditions.else_keyword = current_keyword
			elseif current_keyword.is_local then
				l_found := attached an_expression.locals as l_locals and then l_locals.local_keyword = current_keyword
			elseif current_keyword.is_do then
				l_found := attached an_expression.compound as l_compound and then l_compound.keyword = current_keyword
			elseif current_keyword.is_ensure then
				l_found := attached an_expression.postconditions as l_postconditions and then l_postconditions.ensure_keyword = current_keyword
			elseif current_keyword.is_then then
				l_found := attached an_expression.postconditions as l_postconditions and then l_postconditions.then_keyword = current_keyword
			elseif current_keyword.is_rescue then
				l_found := attached an_expression.rescue_clause as l_rescue_clause and then l_rescue_clause.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := an_expression.end_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (an_expression.agent_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				if attached an_expression.preconditions as l_preconditions then
					l_range := message_manager.range (l_preconditions.require_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_preconditions.else_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				if attached an_expression.locals as l_locals then
					l_range := message_manager.range (l_locals.local_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_expression.compound as l_compound then
					l_range := message_manager.range (l_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_expression.postconditions as l_postconditions then
					l_range := message_manager.range (l_postconditions.ensure_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
					if attached l_postconditions.then_keyword as l_else_keyword then
						l_range := message_manager.range (l_else_keyword, current_class)
						create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
						response.add_document_highlight (l_document_highlight)
					end
				end
				if attached an_expression.rescue_clause as l_rescue_clause then
					l_range := message_manager.range (l_rescue_clause.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (an_expression.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_from then
				l_found := attached an_instruction.from_compound as l_from_compound and then l_from_compound.keyword = current_keyword
			elseif current_keyword.is_invariant then
				l_found := attached an_instruction.invariant_part as l_invariant_part and then l_invariant_part.invariant_keyword = current_keyword
			elseif current_keyword.is_until then
				l_found := attached {ET_KEYWORD_EXPRESSION} an_instruction.until_conditional as l_until_conditional and then l_until_conditional.keyword = current_keyword
			elseif current_keyword.is_loop then
				l_found := attached an_instruction.loop_compound as l_loop_compound and then l_loop_compound.keyword = current_keyword
			elseif current_keyword.is_variant then
				l_found := attached an_instruction.variant_part as l_variant_part and then l_variant_part.variant_keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := an_instruction.end_keyword = current_keyword
			end
			if l_found then
				if attached an_instruction.from_compound as l_from_compound then
					l_range := message_manager.range (l_from_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_instruction.invariant_part as l_invariant_part then
					l_range := message_manager.range (l_invariant_part.invariant_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached {ET_KEYWORD_EXPRESSION} an_instruction.until_conditional as l_until_conditional then
					l_range := message_manager.range (l_until_conditional.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_instruction.loop_compound as l_loop_compound then
					l_range := message_manager.range (l_loop_compound.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached an_instruction.variant_part as l_variant_part then
					l_range := message_manager.range (l_variant_part.variant_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				l_range := message_manager.range (an_instruction.end_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (an_instruction)
			end
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_attached then
				l_found := an_expression.attached_keyword = current_keyword
			elseif current_keyword.is_as then
				l_found := an_expression.as_keyword = current_keyword
			end
			if l_found then
				l_range := message_manager.range (an_expression.attached_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
				l_range := message_manager.range (an_expression.as_keyword, current_class)
				create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
				response.add_document_highlight (l_document_highlight)
			else
				precursor (an_expression)
			end
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
			if attached {LS_NULL} response.result_ then
				precursor (an_expression)
			end
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
			if attached {LS_NULL} response.result_ then
				precursor (a_feature)
			end
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
			if attached {LS_NULL} response.result_ then
				precursor (an_expression)
			end
		end

	process_parent (a_parent: ET_PARENT)
			-- Process `a_parent'.
		local
			l_document_highlight: LS_DOCUMENT_HIGHLIGHT
			l_range: LS_RANGE
			l_found: BOOLEAN
		do
			if current_keyword.is_rename then
				l_found := attached a_parent.renames as l_renames and then l_renames.rename_keyword = current_keyword
			elseif current_keyword.is_export then
				l_found := attached a_parent.exports as l_exports and then l_exports.export_keyword = current_keyword
			elseif current_keyword.is_undefine then
				l_found := attached a_parent.undefines as l_undefines and then l_undefines.keyword = current_keyword
			elseif current_keyword.is_redefine then
				l_found := attached a_parent.redefines as l_redefines and then l_redefines.keyword = current_keyword
			elseif current_keyword.is_select then
				l_found := attached a_parent.selects as l_selects and then l_selects.keyword = current_keyword
			elseif current_keyword.is_end then
				l_found := a_parent.end_keyword = current_keyword
			end
			if l_found then
				if attached a_parent.renames as l_renames then
					l_range := message_manager.range (l_renames.rename_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_parent.exports as l_exports then
					l_range := message_manager.range (l_exports.export_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_parent.undefines as l_undefines then
					l_range := message_manager.range (l_undefines.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_parent.redefines as l_redefines then
					l_range := message_manager.range (l_redefines.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_parent.selects as l_selects then
					l_range := message_manager.range (l_selects.keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
				if attached a_parent.end_keyword as l_end_keyword then
					l_range := message_manager.range (l_end_keyword, current_class)
					create l_document_highlight.make_with_kind (l_range, {LS_DOCUMENT_HIGHLIGHT_KINDS}.text)
					response.add_document_highlight (l_document_highlight)
				end
			else
				precursor (a_parent)
			end
		end

feature {NONE} -- Implementation

	current_class: ET_CLASS
			-- Class being processed

	current_keyword: ET_KEYWORD
			-- Keyword being processed

invariant

	response_not_void: response /= Void
	message_manager_not_void: message_manager /= Void
	current_class_not_void: current_class /= Void
	current_keyword_not_void: current_keyword /= Void

end
