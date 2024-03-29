﻿note

	description:

		"Compiled instructions that produce text output"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

deferred class XM_XSLT_TEXT_CONSTRUCTOR

inherit

	XM_XSLT_INSTRUCTION
		redefine
			evaluate_item, compute_special_properties, creates_new_nodes, sub_expressions,
			promote_instruction, create_iterator
		end

	XM_XPATH_ROLE

feature -- Access

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Select expression

	last_string_value: detachable STRING
			-- Result from `expand_children' or `check_content'

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			if attached select_expression as l_select_expression then
				Result.put (l_select_expression, 1)
			end
		end

feature -- Status report

	creates_new_nodes: BOOLEAN
			-- Can `Current' create new nodes?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		do
			if attached select_expression as l_select_expression then
				l_select_expression.display (a_level)
			end
		end

feature -- Optimization

	type_check (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type checking
		require
			a_context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		deferred
		end

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if attached select_expression as l_select_expression and then not l_select_expression.is_error then
				create l_replacement.make (Void)
				l_select_expression.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					set_select_expression (l_replacement_item)
				end
			end
			a_replacement.put (Current)
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_atomizer: XM_XPATH_ATOMIZER_EXPRESSION
			l_atomic_converter: XM_XPATH_ATOMIC_SEQUENCE_CONVERTER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_select_expression: like select_expression
		do
			type_check (a_replacement, a_context, a_context_item_type)
			l_select_expression := select_expression
			if a_replacement.item /= Void then
				-- type check failed
			elseif l_select_expression /= Void and then not l_select_expression.is_error then
				create l_replacement.make (Void)
				l_select_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					set_select_expression (l_replacement_item)
					l_select_expression := l_replacement_item
					if l_select_expression.is_error then
						set_replacement (a_replacement, l_select_expression)
					else
						a_replacement.put (Current)
						if not is_sub_type (l_select_expression.item_type, type_factory.any_atomic_type) then
							create l_atomizer.make (l_select_expression, a_context.configuration.are_all_nodes_untyped)
							set_select_expression (l_atomizer)
							l_select_expression := l_atomizer
						end
						if not is_sub_type (l_select_expression.item_type, type_factory.string_type) then
							create l_atomic_converter.make (l_select_expression, type_factory.string_type)
							set_select_expression (l_atomic_converter)
						end
					end
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if attached select_expression as l_select_expression and then not l_select_expression.is_error then
				create l_replacement.make (Void)
				l_select_expression.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_select_expression then
					set_select_expression (l_new_select_expression)
					if l_new_select_expression.is_error then
						set_replacement (a_replacement, l_new_select_expression)
					else
						a_replacement.put (Current)
					end
				end
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if attached select_expression as l_select_expression and then not l_select_expression.is_error then
				create l_replacement.make (Void)
				l_select_expression.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					set_select_expression (l_replacement_item)
				end
			end
			Precursor (a_offer)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_content: detachable STRING
			l_orphan: XM_XPATH_ORPHAN
		do
			if not attached select_expression as l_select_expression then
				l_content := ""
			else
				l_select_expression.evaluate_as_string (a_context)
				check postcondition_of_evaluate_as_string: attached l_select_expression.last_evaluated_string as l_last_evaluated_string then
					if l_last_evaluated_string.is_error then
						a_result.put (l_last_evaluated_string)
					else
						l_content := l_last_evaluated_string.string_value
					end
				end
			end
			if l_content /= Void then
				check a_result_empty: a_result.item = Void end
				check_content (l_content, a_context)
				if not is_error then
					check postcondition_of_check_content: attached last_string_value as l_last_string_value then
						evaluate_name_code (a_context)
						if not attached error_value as l_error_value then
							check not_is_error: not is_error end
							create l_orphan.make (item_type.primitive_type, l_last_string_value)
							if last_name_code /= -1 then
								l_orphan.set_name_code (last_name_code)
							end
							a_result.put (l_orphan)
						else
							check
								xslt_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context
								-- this is XSLT
								attached l_context.transformer as l_transformer
							then
								l_transformer.report_fatal_error (l_error_value)
							end
						end
					end
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_item.make (Void)
			evaluate_item (l_item, a_context)
			if not attached l_item.item as l_item_item then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
			elseif attached l_item_item.error_value as l_error_value then
				check is_error: l_item_item.is_error end
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (l_error_value)
			elseif l_item_item.is_node then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (l_item_item.as_node)
			else
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (l_item_item)
			end
		end

	expand_children (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Calculate string value of subordinates.
		require
			context_not_void: a_context /= Void
			select_expression_not_void: select_expression /= Void
			no_error: attached a_context.transformer as a_context_transformer and then not a_context_transformer.is_error
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			check precondition_select_expression_not_void: attached select_expression as l_select_expression then
				if not is_error then
					if attached l_select_expression.error_value as l_error_value then
						check is_error: l_select_expression.is_error end
						set_last_error (l_error_value)
					else
						create l_item.make (Void)
						l_select_expression.evaluate_item (l_item, a_context)
						if not attached l_item.item as l_item_item then
							last_string_value := ""
						elseif attached l_item_item.error_value as l_error_value then
							check is_error: l_item_item.is_error end
							last_string_value := Void
							set_last_error (l_error_value)
						else
							last_string_value := l_item_item.string_value
						end
					end
				end
			end
		ensure
			error_or_string_value_not_void: is_error or else last_string_value /= Void
		end

feature -- Element change

	set_select_expression (a_select_expression: XM_XPATH_EXPRESSION)
			-- Ensure `select_expression' = `a_select_expression'.
		require
			select_expression_not_void: a_select_expression /= Void
		do
			if select_expression /= a_select_expression then
				select_expression := a_select_expression
				adopt_child_expression (a_select_expression)
				reset_static_properties
			end
		ensure
			set: select_expression = a_select_expression
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties
			-- Compute special properties.
		do
			Precursor
			set_single_document_nodeset
		end

feature {NONE} -- Implementation

	last_name_code: INTEGER
			-- Result from `evaluate_name_code'

	check_content (a_content: STRING; a_context: XM_XPATH_CONTEXT)
			-- Check and possibly modify `a_content' for conformance to node kind.
		require
			content_not_void: a_content /= Void
		do
			last_string_value := a_content
		ensure
			error_or_string_value_not_void: is_error or else last_string_value /= Void
		end

	evaluate_name_code (a_context: XM_XPATH_CONTEXT)
			-- Evaluate name code.
		do
			last_name_code := -1
		ensure
			error_or_name_code_set: is_error or last_name_code >= -1
		end

end

