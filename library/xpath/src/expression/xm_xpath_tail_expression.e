note

	description:

		"Objects that represent a filter of the form EXPR[position() > n]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TAIL_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			promote, compute_special_properties, sub_expressions, same_expression, create_iterator,
			is_tail_expression, as_tail_expression, create_node_iterator
		end

	KL_SHARED_PLATFORM

create

	make

feature {NONE} -- Initialization

	make (a_base_expression: XM_XPATH_EXPRESSION; a_start: INTEGER)
			-- Establish invariant.
		require
			base_expression_not_void: a_base_expression /= Void
			strictly_positive_start: a_start > 0
		do
			base_expression := a_base_expression
			start := a_start
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_base_expression
			start_set: start = a_start
		end

feature -- Access

	is_tail_expression: BOOLEAN
			-- Is `Current' a tail expression?
		do
			Result := True
		end

	as_tail_expression: XM_XPATH_TAIL_EXPRESSION
			-- `Current' seen as a tail expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := base_expression.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression to be filtered

	start: INTEGER
			--  Offset of first item within `base_expression' to be included

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (base_expression, 1)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		do
			if other.is_tail_expression then
				Result := base_expression.same_expression (other.as_tail_expression.base_expression) and then start = other.as_tail_expression.start
			end
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "tail ")
			a_string := STRING_.appended_string (a_string, start.out)
			std.error.put_string (a_string)
			std.error.put_new_line
			base_expression.display (a_level + 1)
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				set_base_expression (l_replacement_item)
				if base_expression.is_error then
					set_replacement (a_replacement, base_expression)
				else
					a_replacement.put (Current)
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.optimize (l_replacement, a_context, a_context_item_type)
			if base_expression.is_error then
				set_replacement (a_replacement, base_expression)
			else
				a_replacement.put (Current)
			end
		end


	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		local
			l_promotion: detachable XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_offer.accept (Current)
			l_promotion := a_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (a_replacement, l_promotion)
			else
				a_replacement.put (Current)
				if not (a_offer.action = Unordered) then
					create l_replacement.make (Void)
					base_expression.promote (l_replacement, a_offer)
					check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
						set_base_expression (l_replacement_item)
						reset_static_properties
					end
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over the values of a sequence
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			check postcondition_of_create_iterator: attached base_expression.last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				if l_iterator.is_error then
					last_iterator := l_iterator
				elseif l_iterator.is_array_iterator then
					if start > l_iterator.as_array_iterator.last_item then
						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
					else
						last_iterator := l_iterator.as_array_iterator.new_slice_iterator (start, Platform.Maximum_integer)
					end
				elseif l_iterator.is_node_iterator then
					create {XM_XPATH_NODE_TAIL_ITERATOR} last_iterator.make (l_iterator.as_node_iterator, start)
				else
					create {XM_XPATH_TAIL_ITERATOR} last_iterator.make (l_iterator, start)
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			base_expression.create_iterator (a_context)
			check postcondition_of_create_iterator: attached base_expression.last_node_iterator as l_last_node_iterator then
				l_iterator := l_last_node_iterator
				if l_iterator.is_error then
					last_node_iterator := l_iterator
				elseif l_iterator.is_array_iterator then
					if start > l_iterator.as_array_iterator.last_item then
						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
					else
						last_node_iterator := l_iterator.as_array_iterator.new_slice_iterator (start, Platform.Maximum_integer)
					end
				else
					create {XM_XPATH_NODE_TAIL_ITERATOR} last_node_iterator.make (l_iterator, start)
				end
			end
		end

feature -- Element change

	set_base_expression (a_base_expression: XM_XPATH_EXPRESSION)
			-- Set `base_expression.
		require
			base_expression_not_void: a_base_expression /= Void
		do
			base_expression := a_base_expression
		ensure
			base_expression_set: base_expression = a_base_expression
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinalities (base_expression)
			set_cardinality_allows_zero
		end

	compute_special_properties
			-- Compute special properties.
		do
			clone_special_properties (base_expression)
		end

invariant

	strictly_positive_start: start > 0
	base_expression_not_void: base_expression /= Void

end
