note

	description:

		"A concatenation of two XPath Expressions (comma operator)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SEQUENCE_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			is_sequence_expression, as_sequence_expression,
			item_type, sub_expressions, contains_recursive_tail_function_calls,
			simplify, promote, compute_cardinality, create_iterator, create_node_iterator,
			same_expression, mark_tail_function_calls
		end

create

	make

feature {NONE} -- Initialization

	make (a_head, a_tail: XM_XPATH_EXPRESSION)
			-- Initialize `Current'.
		require
			a_head_not_void: a_head /= Void
			a_tail_not_void: a_tail /= Void
		local
			l_child_count: INTEGER
		do
			if not a_head.is_sequence_expression and not a_tail.is_sequence_expression then
				create children.make (2)
				children.put (a_head, 1)
				children.put (a_tail, 2)
			else
				if not a_head.is_sequence_expression then
					l_child_count := 1
				else
					l_child_count := a_head.as_sequence_expression.children.count
				end
				if not a_tail.is_sequence_expression then
					l_child_count := 1 + l_child_count
				else
					l_child_count := l_child_count + a_tail.as_sequence_expression.children.count
				end
				create children.make (l_child_count)
				if not a_head.is_sequence_expression then
					children.put (a_head, 1)
				else
					children.extend_last (a_head.as_sequence_expression.children)
				end
				if not a_tail.is_sequence_expression then
					children.put_last (a_tail)
				else
					children.extend_last (a_tail.as_sequence_expression.children)
				end
			end
			children.set_equality_tester (expression_tester)
			children.do_all (agent adopt_child_expression)
			compute_static_properties
			initialized := True
		ensure
			initialized: initialized
		end

feature -- Access

	children: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Child expressions

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		local
			l_type: XM_XPATH_ITEM_TYPE
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if children.count = 0 then
				Result := empty_item
			else
				from
					l_cursor := children.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_type := l_cursor.item.item_type
					if Result = Void then
						Result := l_type
						l_cursor.forth
					else
						Result := common_super_type (Result, l_type)
						if Result = any_item then
							l_cursor.go_after
						else
							l_cursor.forth
						end
					end
				variant
					children.count + 1 - l_cursor.index
				end
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			Result := children
		end

feature -- Comparison

	same_expression (a_other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `a_other' the same expression?
		local
			l_seq: XM_XPATH_SEQUENCE_EXPRESSION
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			Result := Current = a_other
			if not Result and a_other.is_sequence_expression then
				l_seq := a_other.as_sequence_expression
				-- for_all_with_index
				from
					Result := children.count = l_seq.children.count
					l_cursor := children.new_cursor
					l_cursor.start
				until
					not Result or l_cursor.after
				loop
					Result := l_cursor.item.same_expression (l_seq.children.item (l_cursor.index))
					l_cursor.forth
				end
			end
		end

feature -- Status report

	is_sequence_expression: BOOLEAN
			-- Is `Current' a sequence expression [e.g. (,,,)]?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			l_string: STRING
		do
			l_string := STRING_.appended_string (indentation (a_level), "(")
			std.error.put_string (l_string)
			std.error.put_new_line
			children.do_all (agent {XM_XPATH_EXPRESSION}.display (a_level + 1))
			l_string := STRING_.appended_string (indentation (a_level), ")")
			std.error.put_string (l_string)
			std.error.put_new_line
		end

	contains_recursive_tail_function_calls (a_name_code, a_arity: INTEGER): UT_TRISTATE
			-- Does `Current' contains recursive tail calls of stylesheet functions?
			-- `Undecided' means it contains a tail call to another function.
		do
			Result := children.last.contains_recursive_tail_function_calls (a_name_code, a_arity)
		end

feature -- Status setting

	mark_tail_function_calls
			-- Mark tail-recursive calls on stylesheet functions.
		do
			children.last.mark_tail_function_calls
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_all_atomic, l_nested: DS_CELL [BOOLEAN]
			l_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]
			l_children: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			l_extent: XM_XPATH_SEQUENCE_EXTENT
			l_child: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if children.count = 0 then
				set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
			elseif children.count = 1 then
				l_child := children.item (1)
				create l_replacement.make (Void)
				l_child.simplify (l_replacement)
				set_replacement (a_replacement, l_replacement.item)
			else
				create l_all_atomic.make (True)
				create l_nested.make (False)
				children.do_all_with_index (agent simplify_child (l_all_atomic, l_nested, ?, ?))
				if l_nested.item then
					create l_children.make (children.count * 2)
					flatten_list (l_children)
					repopulate_children (l_children)
				end
				if l_all_atomic.item then
					create l_list.make (children.count)
					children.do_all (agent add_atomic_value (l_list, ?))
					create l_extent.make_from_list (l_list)
					set_replacement (a_replacement, l_extent)
				else
					a_replacement.put (Current)
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_nested: DS_CELL [BOOLEAN]
			l_children: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			create l_nested.make (False)
			children.do_all_with_index (agent check_child_type (a_replacement, l_nested, a_context, a_context_item_type, ?, ?))
			if a_replacement.item = Void then
				if l_nested.item then
					create l_children.make (children.count * 2)
					flatten_list (l_children)
					repopulate_children (l_children)
				end
				a_replacement.put (Current)
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			children.do_all_with_index (agent optimize_child (a_replacement, a_context, a_context_item_type, ?, ?))
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote `Current'.
		local
			l_promotion: XM_XPATH_EXPRESSION
		do
			a_offer.accept (Current)
			l_promotion := a_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (a_replacement, l_promotion)
			elseif a_offer.action /= Unordered then
				children.do_all_with_index (agent promote_child (a_offer, ?, ?))
				if a_replacement.item = Void then
					a_replacement.put (Current)
				end
			else
				a_replacement.put (Current)
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterate over the values of a sequence.
		do
			if children.is_empty then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
			elseif is_node_item_type (item_type) then
				create {XM_XPATH_BLOCK_NODE_ITERATOR} last_iterator.make (children, a_context)
			else
				create {XM_XPATH_BLOCK_ITERATOR} last_iterator.make (children, a_context)
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterate over the nodees of a sequence.
		do
			if children.is_empty then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
			else
				create {XM_XPATH_BLOCK_NODE_ITERATOR} last_node_iterator.make (children, a_context)
			end
		end

feature -- Conversion

	as_sequence_expression: XM_XPATH_SEQUENCE_EXPRESSION
			-- `Current' seen as a sequence expression
		do
			Result := Current
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		local
			l_cardinality: DS_CELL [INTEGER]
		do
			if children.count = 0 then
				set_cardinality_empty
			else
				create l_cardinality.make (Required_cardinality_empty)
				children.do_all (agent compute_child_cardinality (l_cardinality, ?))
				set_cardinality (l_cardinality.item)
			end
		end

feature {NONE} -- Agents

	compute_child_cardinality (a_cardinality: DS_CELL [INTEGER]; a_child: XM_XPATH_EXPRESSION)
			-- Compute and add cardinality for `a_child' to `a_cardinality'.
		require
			a_cardinality_not_void: a_cardinality /= Void
			a_child_not_void: a_child /= Void
		do
			a_cardinality.put (add_cardinality (a_cardinality.item, a_child.cardinality))
		end

	simplify_child (a_all_atomic, a_nested: DS_CELL [BOOLEAN]; a_child: XM_XPATH_EXPRESSION; a_index: INTEGER)
			-- Simplify `a_child' and conditionally replace at `children.item (a_index)'.
		require
			initialized: initialized
			a_all_atomic_not_void: a_all_atomic /= Void
			a_nested_not_void: a_nested /= Void
			a_child_not_void: a_child /= Void
			a_index_large_enough: a_index > 0
			a_index_small_enough: a_index <= children.count
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			a_child.simplify (l_replacement)
			if a_child /= l_replacement.item then
				children.replace (l_replacement.item, a_index)
			else
				if not a_child.is_atomic_value then
					a_all_atomic.put (False)
				end
			end
			if a_child.is_sequence_expression or a_child.is_empty_sequence then
				a_nested.put (True)
			end
		end

	add_atomic_value (a_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]; a_expression: XM_XPATH_EXPRESSION)
			-- Add `a_expression' to `a_list' at end.
		require
			a_list_not_void: a_list /= Void
			a_list_extendible: a_list.extendible (1)
			a_expression_not_void: a_expression /= Void
			a_expression_is_atomic_value: a_expression.is_atomic_value
		do
			a_list.put_last (a_expression.as_atomic_value)
		ensure
			one_more: a_list.count = old a_list.count + 1
			a_expression_added: a_list.last = a_expression.as_atomic_value
		end

	check_child_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_nested: DS_CELL [BOOLEAN]; a_context: XM_XPATH_STATIC_CONTEXT;
		a_context_item_type: XM_XPATH_ITEM_TYPE; a_child: XM_XPATH_EXPRESSION; a_index: INTEGER)
			-- Check static type of `a_child'.
		require
			initialized: initialized
			a_nested_not_void: a_nested /= Void
			a_context_not_void: a_context /= Void
			a_context_item_type_may_not_be_set: True
			a_child_not_void: a_child /= Void
			no_previous_error: not a_child.is_error
			a_replacement_not_void: a_replacement /= Void
			static_properties_computed: a_child.are_static_properties_computed
			a_index_large_enough: a_index > 0
			a_index_small_enough: a_index <= children.count
		local
			l_child: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if a_replacement.item = Void then
				create l_replacement.make (Void)
				a_child.check_static_type (l_replacement, a_context, a_context_item_type)
				if l_replacement.item /= Void and then l_replacement.item.is_error then
					set_replacement (a_replacement, l_replacement.item)
				else
					if a_child /= l_replacement.item then
						children.replace (l_replacement.item, a_index)
					end
					l_child := l_replacement.item
					if l_child.is_sequence_expression or l_child.is_empty_sequence then
						a_nested.put (True)
					end
				end
			end
		end

	optimize_child (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT;
		a_context_item_type: XM_XPATH_ITEM_TYPE; a_child: XM_XPATH_EXPRESSION; a_index: INTEGER)
			-- Optimize `a_child'.
		require
			initialized: initialized
			a_context_not_void: a_context /= Void
			a_context_item_type_may_not_be_set: True
			a_child_not_void: a_child /= Void
			no_previous_error: not a_child.is_error
			a_replacement_not_void: a_replacement /= Void
			static_properties_computed: a_child.are_static_properties_computed
			a_index_large_enough: a_index > 0
			a_index_small_enough: a_index <= children.count
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if a_replacement.item = Void then
				create l_replacement.make (Void)
				a_child.optimize (l_replacement, a_context, a_context_item_type)
				if l_replacement.item /= Void and then l_replacement.item.is_error then
					set_replacement (a_replacement, l_replacement.item)
				elseif a_child /= l_replacement.item then
					children.replace (l_replacement.item, a_index)
				end
			end
		end

	promote_child (a_offer: XM_XPATH_PROMOTION_OFFER; a_child: XM_XPATH_EXPRESSION; a_index: INTEGER)
			-- Promote `a_child'.
		require
			initialized: initialized
			a_offer_not_void: a_offer /= Void
			a_child_not_void: a_child /= Void
			a_index_large_enough: a_index > 0
			a_index_small_enough: a_index <= children.count
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			a_child.promote (l_replacement, a_offer)
			if a_child /= l_replacement.item then
				children.replace (l_replacement.item, a_index)
				reset_static_properties
			end
		end

feature {XM_XPATH_SEQUENCE_EXPRESSION} -- Implementation

	flatten_list (a_list: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION])
			-- Reallocate `a_list' so it contains no sequence expressions.
		require
			initialized: initialized
			a_list_not_void: a_list /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_child: XM_XPATH_EXPRESSION
		do
			from
				l_cursor := children.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_child := l_cursor.item
				if l_child.is_sequence_expression then
					l_child.as_sequence_expression.flatten_list (a_list)
				elseif l_child.is_empty_sequence then
					-- let it drop
				else
					if not a_list.extendible (1) then
						a_list.resize (2 * a_list.count)
					end
					a_list.put_last (l_child)
				end
				l_cursor.forth
			end

		end

	repopulate_children (a_list: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION])
			-- Recreate and repopulate `children' from `a_list'.
		require
			initialized: initialized
			a_list_not_void: a_list /= Void
		do
			initialized := False
			create children.make_from_linear (a_list)
			children.set_equality_tester (expression_tester)
			children.do_all (agent adopt_child_expression)
			reset_static_properties
			initialized := True
		ensure
			initialized: initialized
		end

invariant

	children_not_void: initialized implies children /= Void

end
