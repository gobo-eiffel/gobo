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

	XM_XSLT_SORT_ROUTINES
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
--			fixed: BOOLEAN
--			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
		do
			set_select_expression (a_select_expression)
			sort_key_list := a_sort_key_list
-- removed, due to local variables in AVT - needs optimization			
-- 			from
-- 				fixed := True
-- 				a_cursor := sort_key_list.new_cursor
-- 				a_cursor.start
-- 			variant
-- 				sort_key_list.count + 1 - a_cursor.index
-- 			until
-- 				a_cursor.after
-- 			loop
-- 				if not a_cursor.item.is_fixed_sort_key then
-- 					fixed := False
-- 					a_cursor.go_after
-- 				else
-- 					a_cursor.forth
-- 				end
-- 			end
-- 			if fixed then
-- 				from
-- 					create fixed_sort_key_list.make (sort_key_list.count)
-- 					a_cursor := sort_key_list.new_cursor
-- 					a_cursor.start
-- 				variant
-- 					sort_key_list.count + 1 - a_cursor.index
-- 				until
-- 					a_cursor.after
-- 				loop
-- 					check
-- 						fixed_sort_key: a_cursor.item.is_fixed_sort_key
-- 					end
-- 					fixed_sort_key_list.put_last (a_cursor.item.as_fixed_sort_key)
-- 					a_cursor.forth
-- 				end
-- 			end
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

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform of context-independent static optimizations.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]		
		do
			create l_replacement.make (Void)
			select_expression.simplify (l_replacement)
			set_select_expression (l_replacement.item)
			if select_expression.is_error then
				set_replacement (a_replacement, select_expression)
			end
			a_replacement.put (Current)
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]	
			l_sort_item_type: XM_XPATH_ITEM_TYPE
		do
			create l_replacement.make (Void)
			select_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			set_select_expression (l_replacement.item)
			if select_expression.is_error then
				set_replacement (a_replacement, select_expression)
			else
				l_sort_item_type := select_expression.item_type
				sort_key_list.do_all (agent check_sort_key (a_replacement, ?, a_context, l_sort_item_type))
				if a_replacement.item = Void then
					a_replacement.put (Current)
				end
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.optimize (l_replacement, a_context, a_context_item_type)
			set_select_expression (l_replacement.item)
			if select_expression.is_error or else not select_expression.cardinality_allows_many then
				set_replacement (a_replacement, select_expression)
			else
				a_replacement.put (Current)
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
				
				-- See creation procedure: if fixed_sort_key_list /= Void then
				--	l_reduced_sort_keys := fixed_sort_key_list
				--else
					from
						create l_reduced_sort_keys.make (sort_key_list.count)
						l_cursor := sort_key_list.new_cursor; l_cursor.start
					variant
						sort_key_list.count + 1 - l_cursor.index
					until
						l_cursor.after
					loop
						l_sort_key := l_cursor.item
						-- ditto: if not l_sort_key.is_reducible then
							l_sort_key.evaluate_expressions (l_evaluation_context)
						--end
						if l_sort_key.collation_name = Void or else l_evaluation_context.is_known_collation (l_sort_key.collation_name) then
							l_reduced := l_sort_key.reduced_definition (l_evaluation_context)
							if l_reduced.is_error then
								create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_reduced.error_value)
								l_cursor.go_after
							else
								l_reduced_sort_keys.put_last (l_reduced)
								l_cursor.forth
							end
						else
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string (STRING_.concat ("Unknown collation ", l_sort_key.collation_name), Xpath_errors_uri, "XTDE1035", Dynamic_error)
							l_cursor.go_after
						end
					end
				--end
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
				
				-- See creation procedure:if fixed_sort_key_list /= Void then
				--	l_reduced_sort_keys := fixed_sort_key_list
				--else
					from
						create l_reduced_sort_keys.make (sort_key_list.count)
						l_cursor := sort_key_list.new_cursor; l_cursor.start
					variant
						sort_key_list.count + 1 - l_cursor.index
					until
						l_cursor.after
					loop
						l_sort_key := l_cursor.item
						--if not l_sort_key.is_reducible then
							l_sort_key.evaluate_expressions (l_evaluation_context)
						--end
						if l_sort_key.collation_name = Void or else l_evaluation_context.is_known_collation (l_sort_key.collation_name) then
							l_reduced := l_sort_key.reduced_definition (l_evaluation_context)
							if l_reduced.is_error then
								create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_reduced.error_value)
								l_cursor.go_after
							else
								l_reduced_sort_keys.put_last (l_reduced)
								l_cursor.forth
							end
						else
							create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string (STRING_.concat ("Unknown collation ", l_sort_key.collation_name), Xpath_errors_uri, "XTDE1035", Dynamic_error)
							l_cursor.go_after
						end
					end
				--end
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
			if select_expression /= a_select_expression then
				select_expression := a_select_expression
				adopt_child_expression (select_expression)
				if are_static_properties_computed then
					reset_static_properties
				end
			end
		ensure
			select_expression_set: select_expression = a_select_expression
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinalities (select_expression)
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

			--	Commented out 20071215 - see comment for creation procedure: fixed_sort_key_list: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			-- Fixed sort keys

invariant

	select_expression_not_void: initialized implies select_expression /= Void
	sort_key_list_not_void: initialized implies sort_key_list /= Void

end
