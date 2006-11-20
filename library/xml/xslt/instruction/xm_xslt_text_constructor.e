indexing

	description:

		"Compiled instructions that produce text output"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEXT_CONSTRUCTOR

inherit

	XM_XSLT_INSTRUCTION
		redefine
			evaluate_item, compute_special_properties, creates_new_nodes, sub_expressions,
			promote_instruction, create_iterator
		end

	XM_XPATH_ROLE

feature -- Access

	select_expression: XM_XPATH_EXPRESSION
			-- Select expression

	last_string_value: STRING
			-- Result from `expand_children' or `check_content'

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			if select_expression /= Void then Result.put (select_expression, 1) end
		end
	
feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := True
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			if select_expression /= Void then
				select_expression.display (a_level)
			end
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type checking
		require
			static_context_not_void: a_context /= Void
		deferred
		end

	simplify is
			-- Preform context-independent static optimizations
		do
			if select_expression /= Void and then not select_expression.is_error then
				select_expression.simplify
				if select_expression.was_expression_replaced then
					set_select_expression (select_expression.replacement_expression)
				end
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			an_atomizer: XM_XPATH_ATOMIZER_EXPRESSION
			an_atomic_converter: XM_XPATH_ATOMIC_SEQUENCE_CONVERTER
		do
			mark_unreplaced
			type_check (a_context, a_context_item_type)
			if select_expression /= Void and then not select_expression.is_error then
				select_expression.check_static_type (a_context, a_context_item_type)
				if select_expression.is_error then
					set_last_error (select_expression.error_value)
				elseif select_expression.was_expression_replaced then
					set_select_expression (select_expression.replacement_expression)
				end
				if not is_error then
					if not is_sub_type (select_expression.item_type, type_factory.any_atomic_type) then
						create an_atomizer.make (select_expression, a_context.configuration.are_all_nodes_untyped)
						set_select_expression (an_atomizer)
					end
					if not is_sub_type (select_expression.item_type, type_factory.string_type) then
						create an_atomic_converter.make (select_expression, type_factory.string_type)
						set_select_expression (an_atomic_converter)
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
			if select_expression /= Void and then not select_expression.is_error then
				select_expression.optimize (a_context, a_context_item_type)
				if select_expression.is_error then
					set_last_error (select_expression.error_value)
				elseif select_expression.was_expression_replaced then
					set_select_expression (select_expression.replacement_expression)
				end
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			if select_expression /= Void and then not select_expression.is_error then
				select_expression.promote (an_offer)
				if select_expression.was_expression_replaced then
					set_select_expression (select_expression.replacement_expression)
					reset_static_properties
				end
			end
			Precursor (an_offer)
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		local
			a_content: STRING
			an_orphan: XM_XPATH_ORPHAN
			l_context: XM_XSLT_EVALUATION_CONTEXT
		do
			last_evaluated_item := Void
			if select_expression = Void then
				a_content := ""
			else
				select_expression.evaluate_as_string (a_context)
				if select_expression.last_evaluated_string.is_error then
					last_evaluated_item := select_expression.last_evaluated_string
				else
					a_content := select_expression.last_evaluated_string.string_value
				end
			end
			if last_evaluated_item = Void then
				check_content (a_content, a_context)
				if not is_error then
					evaluate_name_code (a_context)
					if not is_error then
						create an_orphan.make (item_type.primitive_type, last_string_value)
						an_orphan.set_name_code (last_name_code)
						last_evaluated_item := an_orphan
					else
						l_context ?= a_context
						check
							xslt_context: l_context /= Void
							-- this is XSLT
						end
						l_context.transformer.report_fatal_error (error_value)
					end
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		do
			evaluate_item (a_context)
			if last_evaluated_item /= Void and then last_evaluated_item.is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (last_evaluated_item.error_value)
			elseif last_evaluated_item.is_node then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (last_evaluated_item.as_node)
			else
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (last_evaluated_item)
			end
		end

	expand_children (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Calculate string value of subordinates.
		require
			context_not_void: a_context /= Void
			select_expression_not_void: select_expression /= Void
			no_error: not a_context.transformer.is_error
		do
			select_expression.evaluate_item (a_context)
			if select_expression.last_evaluated_item = Void then
				last_string_value := ""
			elseif select_expression.last_evaluated_item.is_error then
				last_string_value := Void
				set_last_error (select_expression.last_evaluated_item.error_value)
			else
				last_string_value := select_expression.last_evaluated_item.string_value
			end
		ensure
			error_or_string_value_not_void: is_error or else last_string_value /= Void
		end

feature -- Element change

	set_select_expression (a_select_expression: XM_XPATH_EXPRESSION) is
			-- Set `select_expression'.
		require
			select_expression_not_void: a_select_expression /= Void
		do
			select_expression := a_select_expression
			adopt_child_expression (select_expression)
		ensure
			set: select_expression = a_select_expression
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_single_document_nodeset
		end

feature {NONE} -- Implementation

	last_name_code: INTEGER
			-- Result from `evaluate_name_code'

	check_content (a_content: STRING; a_context: XM_XPATH_CONTEXT) is
			-- Check and possibly modify `a_content' for conformance to node kind.
		require
			content_not_void: a_content /= Void
		do
			last_string_value := a_content
		ensure
			error_or_string_value_not_void: is_error or else last_string_value /= Void
		end

	evaluate_name_code (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate name code.
		do
			last_name_code := -1
		ensure
			error_or_name_code_set: is_error or else last_name_code >= -1
		end

end
	
