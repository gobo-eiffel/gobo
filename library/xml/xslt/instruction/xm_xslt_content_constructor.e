indexing

	description:

	"Compiled objects that construct string value of xsl:attribute, comment and text nodes, etc."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
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

	make (a_select_expression, a_separator_expression: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			select_expression_not_void: a_select_expression /= Void
			separator_expression: a_separator_expression /= Void
		do
			select_expression := a_select_expression
			adopt_child_expression (select_expression)
			separator_expression := a_separator_expression
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

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (select_expression, 1)
			Result.put (separator_expression, 2)
		end

feature -- Status report

	display (a_level: INTEGER) is
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

	simplify is
			-- Preform context-independent static optimizations
		do
			if not select_expression.is_error then
				select_expression.simplify
				if select_expression.was_expression_replaced then select_expression := select_expression.replacement_expression end
			end
			separator_expression.simplify
			if separator_expression.was_expression_replaced then separator_expression := separator_expression.replacement_expression end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			if not select_expression.is_error then
				select_expression.check_static_type (a_context, a_context_item_type)
				if select_expression.is_error then
					set_last_error (select_expression.error_value)
				elseif select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
				end
			end
			if not is_error and not separator_expression.is_error then
				separator_expression.check_static_type (a_context, a_context_item_type)
				if separator_expression.is_error then
					set_last_error (separator_expression.error_value)
				elseif separator_expression.was_expression_replaced then
					separator_expression := separator_expression.replacement_expression
				end
			end
			if not select_expression.cardinality_allows_many then is_singleton := True	end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			if not select_expression.is_error then
				select_expression.optimize (a_context, a_context_item_type)
				if select_expression.is_error then
					set_last_error (select_expression.error_value)
				elseif select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
				end
			end
			if not is_error and not separator_expression.is_error then
				separator_expression.optimize (a_context, a_context_item_type)
				if separator_expression.is_error then
					set_last_error (separator_expression.error_value)
				elseif separator_expression.was_expression_replaced then
					separator_expression := separator_expression.replacement_expression
				end
			end
		end	

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			an_offer.accept (Current)
			if an_offer.accepted_expression /= Void then
				set_replacement (an_offer.accepted_expression)
				reset_static_properties
			else
				select_expression.promote (an_offer)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
					adopt_child_expression (select_expression)
					reset_static_properties
				end
				separator_expression.promote (an_offer)
				if separator_expression.was_expression_replaced then
					separator_expression := separator_expression.replacement_expression
					adopt_child_expression (separator_expression)
					reset_static_properties
				end				
			end
		end
		
feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			last_evaluated_item := Void
			if select_expression.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (select_expression.error_value)
			elseif is_singleton then

				-- common case, so optimize
	
				select_expression.evaluate_item (a_context)
				if select_expression.last_evaluated_item /= Void then
					if select_expression.last_evaluated_item.is_error then
						last_evaluated_item := select_expression.last_evaluated_item
					elseif select_expression.last_evaluated_item.is_string_value then
						last_evaluated_item := select_expression.last_evaluated_item.as_string_value
					elseif select_expression.last_evaluated_item.is_atomic_value then
						last_evaluated_item := select_expression.last_evaluated_item.as_atomic_value.convert_to_type (type_factory.string_type)
					else
						create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} an_iterator.make (select_expression.last_evaluated_item)
						evaluate_sequence (a_context, an_iterator)
					end
				end
			else
				select_expression.create_iterator (a_context)
				an_iterator := select_expression.last_iterator
				if an_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
				else
					evaluate_sequence (a_context, an_iterator)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := Supports_evaluate_item
		end

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation
	
	is_singleton: BOOLEAN
			-- Is `select_expression' a single item?
	
	evaluate_sequence (a_context: XM_XPATH_CONTEXT; an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Evaluate `an_iterator' setting `last_evaluated_item'.
		require
			context_may_be_void: True
			expression_not_in_error: not is_error
			iterator_is_before: an_iterator /= Void and then not an_iterator.is_error and then an_iterator.before
		local
			a_buffer, a_separator, a_text: STRING
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
			is_first_item, was_previous_item_text: BOOLEAN
			a_typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
		do
			from
				is_first_item := True; a_buffer := ""; an_iterator.start
			until
				last_evaluated_item /= Void or else an_iterator.is_error or else an_iterator.after
			loop
				an_item := an_iterator.item
				if an_item.is_error then
					last_evaluated_item := an_item
				else
					if an_item.is_node then
						a_node := an_item.as_node
						if a_node.node_type = Text_node then
							a_text := a_node.string_value
							if a_text.count > 0 then
								if not is_first_item and then not was_previous_item_text then
									if a_separator = Void then a_separator := separator_value (a_context) end
									if last_evaluated_item = Void then a_buffer := STRING_.appended_string (a_buffer, a_separator) end
								end
								a_buffer := STRING_.appended_string (a_buffer, a_text)
								is_first_item := False
								was_previous_item_text := True
							end
						else
							from
								was_previous_item_text := False;	a_typed_value := a_node.typed_value; a_typed_value.start
							until
								a_typed_value.after
							loop
								an_atomic_value := a_typed_value.item
								if not is_first_item then
									if a_separator = Void then a_separator := separator_value (a_context) end
									if last_evaluated_item = Void then a_buffer := STRING_.appended_string (a_buffer, a_separator) end
								end
								is_first_item := False
								a_buffer := STRING_.appended_string (a_buffer, an_atomic_value.string_value)
								a_typed_value.forth
							end
						end
					else
						if not is_first_item then
							if a_separator = Void then a_separator := separator_value (a_context) end
							if last_evaluated_item = Void then a_buffer := STRING_.appended_string (a_buffer, a_separator) end
						end
						is_first_item := False
						if last_evaluated_item = Void then a_buffer := STRING_.appended_string (a_buffer, an_item.string_value) end
					end
				end
				an_iterator.forth
			end
			if an_iterator.is_error then
				an_evaluation_context ?= a_context
				an_iterator.error_value.set_location (system_id, line_number)
				an_evaluation_context.transformer.report_fatal_error (an_iterator.error_value)
			end
			if last_evaluated_item = Void then create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (a_buffer) end
		ensure
			item_evaluated_but_may_be_void: True
		end

	separator_value  (a_context: XM_XPATH_CONTEXT): STRING is
			-- Value of `separator_expression';
			-- N.B. May put `last_evaluated_item' into error status, so not pure.
		require
			not_yet_evaluated: last_evaluated_item = Void
		do
			separator_expression.evaluate_item (a_context)
			if separator_expression.last_evaluated_item /= Void then
				if separator_expression.last_evaluated_item.is_error then
					last_evaluated_item := separator_expression.last_evaluated_item
				else
					Result := separator_expression.last_evaluated_item.string_value
				end
			else
				Result := ""
			end
		ensure
			no_error_implies_result_not_void: last_evaluated_item = Void implies Result /= Void
			error_implies_result_is_void: last_evaluated_item /= Void implies last_evaluated_item.is_error and then Result = Void
		end
	
invariant

	select_expression_not_void: initialized implies select_expression /= Void
	separator_expression: initialized implies separator_expression /= Void

end

