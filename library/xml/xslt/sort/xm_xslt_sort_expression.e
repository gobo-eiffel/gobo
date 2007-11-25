indexing

	description:

		"Objects equivalent to the imaginary syntax: expr sortby (sort-key)"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SORT_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, create_iterator, compute_special_properties, is_repeated_sub_expression,
			sub_expressions, create_node_iterator -- TODO promote
		end

	XM_XPATH_ROLE
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_select_expression: XM_XPATH_EXPRESSION; a_sort_key_list: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]) is
			-- Establish invariant.
		require
			select_expression_not_void: a_select_expression /= Void
			sort_key_list_not_void: a_sort_key_list /= Void
		local
			fixed: BOOLEAN
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
		do
			set_select_expression (a_select_expression)
			sort_key_list := a_sort_key_list
			from
				fixed := True
				a_cursor := sort_key_list.new_cursor
				a_cursor.start
			variant
				sort_key_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				if not a_cursor.item.is_fixed_sort_key then
					fixed := False
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
			if fixed then
				from
					create fixed_sort_key_list.make (sort_key_list.count)
					a_cursor := sort_key_list.new_cursor
					a_cursor.start
				variant
					sort_key_list.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					check
						fixed_sort_key: a_cursor.item.is_fixed_sort_key
					end
					fixed_sort_key_list.put_last (a_cursor.item.as_fixed_sort_key)
					a_cursor.forth
				end
			end
			compute_static_properties
			initialized := True
		ensure
			select_expression_set: select_expression = a_select_expression
			sort_key_list_set: sort_key_list = a_sort_key_list
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := select_expression.item_type
		end

	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		do
			Result := is_sort_key (a_child)
		end

	is_sort_key (a_child: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `a_child' one of the sort-keys?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
		do
			from
				a_cursor := sort_key_list.new_cursor; a_cursor.start
			variant
				sort_key_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				if a_child = a_cursor.item.sort_key then
					Result := True
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			l_sort_key: XM_XSLT_SORT_KEY_DEFINITION 
		do
			create Result.make (7)
			Result.set_equality_tester (expression_tester)
			Result.force_last (select_expression)
			from l_cursor := sort_key_list.new_cursor; l_cursor.start until l_cursor.after loop
				l_sort_key := l_cursor.item
				Result.force_last (l_sort_key.sort_key)
				if l_sort_key.order_expression /= Void then
					Result.force_last (l_sort_key.order_expression)
				end
				if l_sort_key.case_order_expression /= Void then
					Result.force_last (l_sort_key.case_order_expression)
				end
				if l_sort_key.language_expression /= Void then
					Result.force_last (l_sort_key.language_expression)
				end
				if l_sort_key.data_type_expression /= Void then
					Result.force_last (l_sort_key.data_type_expression)
				end
				if l_sort_key.collation_name_expression /= Void then
					Result.force_last (l_sort_key.collation_name_expression)
				end
				l_cursor.forth
			end
		end
	
feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "sort")
			select_expression.display (a_level + 1)
		end

feature -- Optimization

	simplify is
			-- Perform of context-independent static optimizations.
		do
			select_expression.simplify
			if select_expression.was_expression_replaced then
				set_select_expression (select_expression.replacement_expression)
			end
			if select_expression.is_error then
				set_last_error (select_expression.error_value)
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			select_expression.check_static_type (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				set_select_expression (select_expression.replacement_expression)
			end
			if select_expression.is_error then
				set_last_error (select_expression.error_value)
			end
			sort_key_list.do_all_with_index (agent check_sort_key (?, ?, a_context, a_context_item_type))
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			select_expression.optimize (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				set_select_expression (select_expression.replacement_expression)
			end
			if select_expression.is_error then
				set_last_error (select_expression.error_value)
			elseif not select_expression.cardinality_allows_many then
				set_replacement (select_expression)
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			l_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			l_reduced_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			l_sort_key: XM_XSLT_SORT_KEY_DEFINITION
			l_reduced: XM_XSLT_FIXED_SORT_KEY_DEFINITION
		do
			last_iterator := Void
			select_expression.create_iterator (a_context)
			l_sequence_iterator := select_expression.last_iterator
			if l_sequence_iterator.is_error then
				last_iterator := l_sequence_iterator
			else
				l_evaluation_context ?= a_context.new_context
				check
					evaluation_context_not_void: l_evaluation_context /= Void
					-- as this is XSLT
				end
				
				if fixed_sort_key_list /= Void then
					l_reduced_sort_keys := fixed_sort_key_list
				else
					from
						create l_reduced_sort_keys.make (sort_key_list.count)
						l_cursor := sort_key_list.new_cursor; l_cursor.start
					variant
						sort_key_list.count + 1 - l_cursor.index
					until
						l_cursor.after
					loop
						l_sort_key := l_cursor.item
						if not l_sort_key.is_reducible then
							l_sort_key.evaluate_expressions (l_evaluation_context)
						end
						if l_sort_key.collation_name = Void or else l_evaluation_context.is_known_collation (l_sort_key.collation_name) then
							l_reduced := l_sort_key.reduced_definition (l_evaluation_context)
							l_reduced_sort_keys.put_last (l_reduced)
							l_cursor.forth
						else
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string (STRING_.concat ("Unknown collation ", l_sort_key.collation_name), Xpath_errors_uri, "XTDE1035", Dynamic_error)
							l_cursor.go_after
						end
					end
				end
				if last_iterator /= Void then
					-- error
				elseif l_sequence_iterator.is_node_iterator then
					create {XM_XSLT_SORTED_NODE_ITERATOR} last_iterator.make (l_evaluation_context, l_sequence_iterator.as_node_iterator, l_reduced_sort_keys)
				else
					create {XM_XSLT_SORTED_ITERATOR} last_iterator.make (l_evaluation_context, l_sequence_iterator, l_reduced_sort_keys)
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the nodes of a sequence
		local
			l_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			l_reduced_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			l_sort_key: XM_XSLT_SORT_KEY_DEFINITION
			l_reduced: XM_XSLT_FIXED_SORT_KEY_DEFINITION
		do
			last_node_iterator := Void
			select_expression.create_node_iterator (a_context)
			l_sequence_iterator := select_expression.last_node_iterator
			if l_sequence_iterator.is_error then
				last_node_iterator := l_sequence_iterator
			else
				l_evaluation_context ?= a_context.new_context
				check
					evaluation_context_not_void: l_evaluation_context /= Void
					-- as this is XSLT
				end
				
				if fixed_sort_key_list /= Void then
					l_reduced_sort_keys := fixed_sort_key_list
				else
					from
						create l_reduced_sort_keys.make (sort_key_list.count)
						l_cursor := sort_key_list.new_cursor; l_cursor.start
					variant
						sort_key_list.count + 1 - l_cursor.index
					until
						l_cursor.after
					loop
						l_sort_key := l_cursor.item
						if not l_sort_key.is_reducible then
							l_sort_key.evaluate_expressions (l_evaluation_context)
						end
						if l_sort_key.collation_name = Void or else l_evaluation_context.is_known_collation (l_sort_key.collation_name) then
							l_reduced := l_sort_key.reduced_definition (l_evaluation_context)
							l_reduced_sort_keys.put_last (l_reduced)
							l_cursor.forth
						else
							create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string (STRING_.concat ("Unknown collation ", l_sort_key.collation_name), Xpath_errors_uri, "XTDE1035", Dynamic_error)
							l_cursor.go_after
						end
					end
				end
				if last_node_iterator /= Void then
					create {XM_XSLT_SORTED_NODE_ITERATOR} last_node_iterator.make (l_evaluation_context, l_sequence_iterator, l_reduced_sort_keys)
				end
			end
		end

feature {XM_XSLT_SORT_EXPRESSION} -- Local

	set_select_expression (a_select_expression: XM_XPATH_EXPRESSION) is
			-- Set `select_expression'.
		require
			underlying_expression_not_void: a_select_expression /= Void
		do
			select_expression := a_select_expression
			if select_expression.was_expression_replaced then select_expression.mark_unreplaced end
			adopt_child_expression (select_expression)
		ensure
			select_expression_set: select_expression = a_select_expression
			select_expression_not_marked_for_replacement: not select_expression.was_expression_replaced
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted
	
	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (select_expression)
		end

	compute_special_properties is
			-- Compute special properties.
		do
			initialize_special_properties
			if select_expression.context_document_nodeset then
				set_context_document_nodeset
			end
			if select_expression.single_document_nodeset then
				set_single_document_nodeset
			end
			if select_expression.non_creating then
				set_non_creating
			end
		end

feature {NONE} -- Implementation

	select_expression: XM_XPATH_EXPRESSION
			-- Base unsorted expression

	sort_key_list: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			-- Sort keys

	fixed_sort_key_list: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			-- Fixed sort keys

	check_sort_key (a_key: XM_XSLT_SORT_KEY_DEFINITION; a_index: INTEGER; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Check `a_key' for more than one item.
			-- TODO: also perform early evaluation of comparators.
		require
			a_key_not_void: a_key /= Void
			a_index_large_enough: a_index > 0
			a_index_small_enough: a_index <= sort_key_list.count
			a_context_not_void: a_context /= Void
			context_item_may_not_be_set: True
		local
			l_expression: XM_XPATH_EXPRESSION
			l_role: XM_XPATH_ROLE_LOCATOR
		do
			l_expression := a_key.sort_key
			l_expression.check_static_type (a_context, a_context_item_type)
			if l_expression.is_error then
				set_last_error (l_expression.error_value)
			else
				if l_expression.was_expression_replaced then
					l_expression := l_expression.replacement_expression
				end
				if a_context.is_backwards_compatible_mode then
					create {XM_XPATH_FIRST_ITEM_EXPRESSION} l_expression.make (l_expression)
				else
					create l_role.make (Instruction_role, "xsl:sort select", 1, Xpath_errors_uri, "XTTE1020")
					create {XM_XPATH_CARDINALITY_CHECKER} l_expression.make (l_expression, Required_cardinality_optional, l_role)
				end
				a_key.set_sort_key (l_expression)
			end
		end

invariant

	select_expression_not_void: initialized implies select_expression /= Void
	sort_key_list_not_void: initialized implies sort_key_list /= Void

end
