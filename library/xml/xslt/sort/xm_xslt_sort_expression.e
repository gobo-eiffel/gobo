indexing

	description:

		"Objects equivalent to the imaginary syntax: expr sortby (sort-key)"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SORT_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, iterator, compute_special_properties
		end

creation

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
			a_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION
		do
			select_expression := a_select_expression
			sort_key_list := a_sort_key_list
			from
				fixed := True
				a_cursor := sort_key_list.new_cursor; a_cursor.start
			variant
				sort_key_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_fixed_sort_key ?= a_cursor.item
				if a_fixed_sort_key = Void then
					fixed := False
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
			if fixed then
				from
					create fixed_sort_key_list.make (sort_key_list.count)
					a_cursor := sort_key_list.new_cursor; a_cursor.start
				variant
					sort_key_list.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_fixed_sort_key ?= a_cursor.item
					check
						fixed_sort_key: a_fixed_sort_key /= Void
					end
					fixed_sort_key_list.put_last (a_fixed_sort_key)
					a_cursor.forth
				end
			end
			compute_static_properties
			initialize
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

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			mark_unreplaced
			select_expression.analyze (a_context)
			if select_expression.was_expression_replaced then
				set_select_expression (select_expression.replacement_expression)
			end
			if select_expression.is_error then
				set_last_error (select_expression.error_value)
			else
				if not select_expression.cardinality_allows_many then
					set_replacement (select_expression)
				end
			end
		end

feature -- Evaluation
	
	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			reduced_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			a_sort_key: XM_XSLT_SORT_KEY_DEFINITION
		do
			a_sequence_iterator := select_expression.iterator (a_context)
			an_evaluation_context ?= a_context.new_context
			check
				evaluation_context_not_void: an_evaluation_context /= Void
				-- as this is XSLT
			end

			if fixed_sort_key_list /= Void then
				reduced_sort_keys := fixed_sort_key_list
			else
				from
					create reduced_sort_keys.make (sort_key_list.count)
					a_cursor := sort_key_list.new_cursor; a_cursor.start
				variant
					sort_key_list.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_sort_key := a_cursor.item
					if not a_sort_key.is_reducible then
						a_sort_key.evaluate_expressions (an_evaluation_context)
					end
					reduced_sort_keys.put_last (a_sort_key.reduced_definition (an_evaluation_context))
					a_cursor.forth
				end
			end
			create {XM_XSLT_SORTED_ITERATOR} Result.make (an_evaluation_context, a_sequence_iterator, reduced_sort_keys)
		end

feature {XM_XSLT_SORT_EXPRESSION} -- Local

	set_select_expression (a_select_expression: XM_XPATH_EXPRESSION) is
			-- Set `select_expression'.
		require
			underlying_expression_not_void: a_select_expression /= Void
		do
			select_expression := a_select_expression
			if select_expression.was_expression_replaced then select_expression.mark_unreplaced end
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
		end

feature {NONE} -- Implementation

	select_expression: XM_XPATH_EXPRESSION
			-- Base unsorted expression

	sort_key_list: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			-- Sort keys

	fixed_sort_key_list: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			-- Fixed sort keys

invariant

	select_expression_not_void: select_expression /= Void
	sort_key_list_not_void: sort_key_list /= Void

end
