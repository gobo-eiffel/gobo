note

	description:

		"Compiled objects that construct string value of xsl:attribute, comment and text nodes, etc."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CONTENT_CONSTRUCTOR

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			native_implementations, simplify, sub_expressions, promote, evaluate_item
		end

	XM_XPATH_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_select_expression, a_separator_expression: XM_XPATH_EXPRESSION)
			-- Establish invariant.
		require
			select_expression_not_void: a_select_expression /= Void
			separator_expression: a_separator_expression /= Void
		do
			select_expression := a_select_expression
			separator_expression := a_separator_expression
			adopt_child_expression (select_expression)
			adopt_child_expression (separator_expression)
			compute_static_properties
			initialized := True
		ensure
			select_expression_set: select_expression = a_select_expression
			separator_expression_set: separator_expression = a_separator_expression
		end

feature -- Access

	select_expression: XM_XPATH_EXPRESSION
			-- Select expression

	separator_expression: XM_XPATH_EXPRESSION
			-- Separator expression

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (select_expression, 1)
			Result.put (separator_expression, 2)
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "constructed content")
			std.error.put_string (a_string); std.error.put_new_line
			select_expression.display (a_level + 1)
			separator_expression.display (a_level + 1)
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Preform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			if not select_expression.is_error then
				select_expression.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					set_select_expression (l_replacement_item)
					l_replacement.put (Void)
				end
			end
			separator_expression.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				set_separator_expression (l_replacement_item)
				a_replacement.put (Current)
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			if not select_expression.is_error then
				select_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					set_select_expression (l_replacement_item)
					if select_expression.is_error then
						set_replacement (a_replacement, select_expression)
					end
				end
			end
			if a_replacement.item = Void and not separator_expression.is_error then
				l_replacement.put (Void)
				separator_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					set_separator_expression (l_replacement_item)
					if separator_expression.is_error then
						set_replacement (a_replacement, separator_expression)
					end
				end
			end
			if not select_expression.cardinality_allows_many then
				is_singleton := True
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			if not select_expression.is_error then
				select_expression.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
					set_select_expression (l_replacement_item)
					if select_expression.is_error then
						set_replacement (a_replacement, select_expression)
					end
				end
			end
			if a_replacement.item = Void and not separator_expression.is_error then
				l_replacement.put (Void)
				separator_expression.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
					set_separator_expression (l_replacement_item)
					if separator_expression.is_error then
						set_replacement (a_replacement, separator_expression)
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_offer.accept (Current)
			if attached a_offer.accepted_expression as l_accepted_expression then
				set_replacement (a_replacement, l_accepted_expression)
				reset_static_properties
			else
				a_replacement.put (Current)
				create l_replacement.make (Void)
				select_expression.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					set_select_expression (l_replacement_item)
					l_replacement.put (Void)
					separator_expression.promote (l_replacement, a_offer)
					check postcondition_of_promote: attached l_replacement.item as l_replacement_item_2 then
						set_separator_expression (l_replacement_item_2)
					end
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			if attached select_expression.error_value as l_error_value then
				check is_error: select_expression.is_error end
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
			elseif is_singleton then

				-- common case, so optimize

				select_expression.evaluate_item (a_result, a_context)
				if attached a_result.item as l_result_item then
					if l_result_item.is_error then
						-- nothing to do
					elseif l_result_item.is_string_value then
						a_result.put (l_result_item.as_string_value)
					elseif l_result_item.is_atomic_value then
						l_result_item.as_atomic_value.convert_to_type (type_factory.string_type)
						a_result.put (l_result_item.as_atomic_value.converted_value)
					else
						create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} l_iterator.make (l_result_item)
						a_result.put (Void)
						evaluate_sequence (a_result, a_context, l_iterator)
					end
				end
			else
				select_expression.create_iterator (a_context)
				check postcondition_of_create_iterator: attached select_expression.last_iterator as l_last_iterator then
					l_iterator := l_last_iterator
					if attached l_iterator.error_value as l_error_value then
						check is_error: l_iterator.is_error end
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
					else
						evaluate_sequence (a_result, a_context, l_iterator)
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
			Result := Supports_evaluate
		end

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	is_singleton: BOOLEAN
			-- Is `select_expression' a single item?

	set_select_expression (a_select_expression: XM_XPATH_EXPRESSION)
			-- Ensure `select_expression' = `a_select_expression'.
		require
			select_expression_not_void: a_select_expression /= Void
		do
			if select_expression /= a_select_expression then
				select_expression := a_select_expression
				adopt_child_expression (select_expression)
				reset_static_properties
			end
		ensure
			set: select_expression = a_select_expression
		end

	set_separator_expression (a_separator_expression: XM_XPATH_EXPRESSION)
			-- Ensure `separator_expression' = `a_separator_expression'.
		require
			separator_expression_not_void: a_separator_expression /= Void
		do
			if separator_expression /= a_separator_expression then
				separator_expression := a_separator_expression
				adopt_child_expression (separator_expression)
				reset_static_properties
			end
		ensure
			set: separator_expression = a_separator_expression
		end

	evaluate_sequence (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT; a_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM])
			-- Evaluate `a_iterator'.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			context_may_be_void: True
			expression_not_in_error: not is_error
			iterator_is_before: a_iterator /= Void and then not a_iterator.is_error and then a_iterator.before
		local
			l_buffer, l_text: STRING
			l_separator: detachable STRING
			l_item: XM_XPATH_ITEM
			l_node: XM_XPATH_NODE
			l_is_first_item, l_was_previous_item_text: BOOLEAN
			l_typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
			l_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			from
				l_is_first_item := True; l_buffer := ""; a_iterator.start
			until
				a_result.item /= Void or a_iterator.is_error or else a_iterator.after
			loop
				l_item := a_iterator.item
				if l_item.is_error then
					a_result.put (l_item)
				else
					if l_item.is_node then
						l_node := l_item.as_node
						if l_node.node_type = Text_node then
							l_text := l_node.string_value
							if l_text.count > 0 then
								if not l_is_first_item and then not l_was_previous_item_text then
									if l_separator = Void then
										l_separator := separator_value (a_result, a_context)
									end
									if a_result.item = Void then
										check postcondition_of_separator_value: l_separator /= Void then
											l_buffer := STRING_.appended_string (l_buffer, l_separator)
										end
									end
								end
								l_buffer := STRING_.appended_string (l_buffer, l_text)
								l_is_first_item := False
								l_was_previous_item_text := True
							end
						else
							from
								l_was_previous_item_text := False;	l_typed_value := l_node.typed_value; l_typed_value.start
							until
								l_typed_value.after
							loop
								l_atomic_value := l_typed_value.item
								if not l_is_first_item then
									if l_separator = Void then
										l_separator := separator_value (a_result, a_context)
									end
									if a_result.item = Void then
										check l_separator /= Void then
											l_buffer := STRING_.appended_string (l_buffer, l_separator)
										end
									end
								end
								l_is_first_item := False
								l_buffer := STRING_.appended_string (l_buffer, l_atomic_value.string_value)
								l_typed_value.forth
							end
						end
					else
						if not l_is_first_item then
							if l_separator = Void then
								l_separator := separator_value (a_result, a_context)
							end
							if a_result.item = Void then
								check l_separator /= Void then
									l_buffer := STRING_.appended_string (l_buffer, l_separator)
								end
							end
						end
						l_is_first_item := False
						l_was_previous_item_text := False
						if a_result.item = Void then l_buffer := STRING_.appended_string (l_buffer, l_item.string_value) end
					end
				end
				a_iterator.forth
			end
			if attached a_iterator.error_value as l_error_value then
				check is_error: a_iterator.is_error end
				check attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_evaluation_context then
					l_error_value.set_location (system_id, line_number)
					check attached l_evaluation_context.transformer as l_transformer then
						l_transformer.report_fatal_error (l_error_value)
					end
				end
			end
			if a_result.item = Void then
				a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_buffer))
			end
		ensure
			item_evaluated_but_may_be_void: True
		end

	separator_value  (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT): detachable STRING
			-- Value of `separator_expression';
			-- Trashes `a_result', so not pure.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
		do
			separator_expression.evaluate_item (a_result, a_context)
			if attached a_result.item as l_result_item then
				if not l_result_item.is_error then
					Result := l_result_item.string_value
					a_result.put (Void)
				end
			else
				Result := ""
			end
		ensure
			no_error_implies_result_not_void: a_result.item = Void implies Result /= Void
			error_implies_result_is_void: attached a_result.item as l_result_item implies l_result_item.is_error and then Result = Void
		end

invariant

	select_expression_not_void: initialized implies select_expression /= Void
	separator_expression: initialized implies separator_expression /= Void

end

