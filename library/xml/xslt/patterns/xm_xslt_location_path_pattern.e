indexing

	description:

		"XSLT location path patterns (e.g. A/B/C)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_LOCATION_PATH_PATTERN

inherit

	XM_XSLT_PATTERN
		redefine
			item_type, fingerprint, simplify, type_check, internal_matches
		end

	XM_XPATH_AXIS

	XM_XPATH_TYPE

	XM_XPATH_SHARED_EXPRESSION_TESTER

feature -- Access

	parent_pattern: XM_XSLT_PATTERN
			-- Parent pattern

	ancestor_pattern: XM_XSLT_PATTERN
			-- Ancestor pattern

	item_type: INTEGER is
			-- Determine the types of nodes to which this pattern applies
		do
			Result := node_test.item_type
		end
	
	node_test: XM_XSLT_NODE_TEST is
			-- A node test that this pattern matches
		once
			create internal_node_test.make
			Result := internal_node_test
		end

	fingerprint: INTEGER is
			-- Determine the name fingerprint of nodes to which this pattern applies
		do
			Result := node_test.fingerprint
		end

feature -- Status report

	is_constructed: BOOLEAN
			-- Has the pattern finished construction?

feature -- Status setting

	finish_construction is
			-- Pattern is finished.
		require
			not_finished: not is_constructed
		do
			is_constructed := True
		ensure
			finished: is_constructed
		end

feature -- Optimization

	simplify: XM_XSLT_PATTERN is
			-- Simplify a pattern by applying any context-independent optimizations;
			-- Default implementation does nothing
		local
			a_location_pattern, a_result_pattern: XM_XSLT_LOCATION_PATH_PATTERN
			a_filter_expression: XM_XPATH_EXPRESSION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do

			-- Detect the simple cases: no parent or ancestor pattern, no predicates
			
			if parent_pattern = Void and then ancestor_pattern = Void and then filters = Void then
				Result := clone (node_test)
				Result.set_system_id (system_id)
				Result.set_line_number (line_number)
			else
				a_result_pattern := clone (Current)
				
				-- Simplify each component of the pattern
				
				if parent_pattern /= Void then
					a_result_pattern.set_parent_pattern (parent_pattern.simplify)
					a_location_pattern ?= a_result_pattern.parent_pattern
					if a_location_pattern /= Void then
						a_result_pattern.set_uses_current (a_location_pattern.uses_current)
					end
				elseif ancestor_pattern /= Void then
					a_result_pattern.set_ancestor_pattern (ancestor_pattern.simplify)
					a_location_pattern ?= a_result_pattern.ancestor_pattern
					if a_location_pattern /= Void then
						a_result_pattern.set_uses_current (a_location_pattern.uses_current)
					end
				end
				
				if filters /= Void then
					from
						a_cursor := a_result_pattern.filters.new_cursor
						a_cursor.start
					variant
						a_result_pattern.filters.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						a_filter_expression := a_cursor.item.simplified_expression -- TODO - error may get lost
						a_cursor.replace (a_filter_expression)
						if a_filter_expression.depends_upon_current_item then
							a_result_pattern.set_uses_current (True)
						end
						a_cursor.forth
					end
				end
				Result := a_result_pattern
			end
		end

	type_check (a_context: XM_XPATH_STATIC_CONTEXT): XM_XSLT_PATTERN is
			-- Type-check the pattern;
			-- Default implementation does nothing. This is only needed for patterns that contain
			-- variable references or function calls.
		local
			a_boolean: XM_XPATH_BOOLEAN_VALUE
			an_integer: XM_XPATH_INTEGER_VALUE
			a_position_range: XM_XPATH_POSITION_RANGE
			is_last_expression: XM_XPATH_IS_LAST_EXPRESSION
			an_expression_context: XM_XSLT_EXPRESSION_CONTEXT
			a_result_pattern: XM_XSLT_LOCATION_PATH_PATTERN
			a_filter_expression, an_expression: XM_XPATH_EXPRESSION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			a_result_pattern := clone (Current)

			-- Analyze each component of the pattern

			if parent_pattern /= Void then
				a_result_pattern.set_parent_pattern (parent_pattern.type_check (a_context))
			elseif ancestor_pattern /= Void then
				a_result_pattern.set_ancestor_pattern (ancestor_pattern.type_check (a_context))
			end

			if filters /= Void then
				from
					a_cursor := a_result_pattern.filters.new_cursor
					a_cursor.start
				variant
					a_result_pattern.filters.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_cursor.item.analyze (a_context)
					if a_cursor.item.was_expression_replaced then
						a_filter_expression := a_cursor.item.replacement_expression
					else
						a_filter_expression := a_cursor.item
					end
					
					-- If the last filter is constant true, remove it.
					
					a_boolean ?= a_filter_expression
					if a_boolean /= Void and then a_boolean.value then
						do_nothing
					else
						a_cursor.replace (a_filter_expression)
					end
					an_expression_context ?= a_context
						check
							an_expression_context_not_void: an_expression_context /= Void
						end
					an_expression_context.style_element.allocate_slots (a_filter_expression)
					
					a_cursor.forth
				end
			end

			-- See if it's an element pattern with a single positional predicate of [1]

			if node_test.item_type = Element_node and then a_result_pattern.filters.count = 1 then
				a_filter_expression := a_result_pattern.filters.item (1)
				an_integer ?= a_filter_expression
				a_position_range ?= a_filter_expression
				if (an_integer /= Void and then an_integer.value = 1)
					or else (a_position_range /= Void and then
								a_position_range.minimum_position = 1 and a_position_range.maximum_position = 1) then
					a_result_pattern.set_first_element_pattern (True)
					a_result_pattern.set_special_filter (True)
					a_result_pattern.set_filters (Void)
				end
			end

			-- See if it's an element pattern with a single positional predicate
			-- of [position()=last()]

			if not a_result_pattern.is_first_element_pattern and then node_test.item_type = Element_node and then a_result_pattern.filters.count = 1 then
				is_last_expression ?= a_result_pattern.filters.item (1)
				if is_last_expression /= Void and then is_last_expression.condition then
					a_result_pattern.set_last_element_pattern (True)
					a_result_pattern.set_special_filter (True)
					a_result_pattern.set_filters (Void)
				end
			end

			if a_result_pattern.is_positional then
				an_expression := make_equivalent_expression
				an_expression.analyze (a_context)
				if an_expression.was_expression_replaced then
					a_result_pattern.set_equivalent_expression (an_expression.replacement_expression)
				else
					a_result_pattern.set_equivalent_expression (an_expression)
				end
				a_result_pattern.set_special_filter (True)
			end
			Result := a_result_pattern
		end

feature -- Matching

	matches (a_node: XM_XPATH_NODE; a_transformer: XM_XSLT_TRANSFORMER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
		local
			a_saved_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_NODE]
		do
			if uses_current then
				a_saved_iterator := a_transformer.current_iterator
				create a_singleton_iterator.make (a_node)
				a_transformer.set_current_iterator (a_singleton_iterator)
				Result := internal_matches (a_node, a_transformer)
				a_transformer.set_current_iterator (a_saved_iterator)
			else
				Result := internal_matches (a_node, a_transformer)
			end
		end

feature -- Element change

	add_filter (a_filter_expression: XM_XPATH_EXPRESSION) is
			-- Add `a_filter_expression' to the pattern (whilst under construction).
		require
			under_construction: not is_constructed
			valid_filter: a_filter_expression /= Void
		do
			if filters = Void then
				create filters.make (3)
				filters.set_equality_tester (expression_tester)
			end
			if not filters.extendible (1) then
				filters.resize (2 * filters.count)
			end
			filters.put_last (a_filter_expression)
		ensure
			filters_present: filters /= Void
		end

	set_parent_pattern (p: XM_XSLT_PATTERN) is
			-- Set `parent_pattern'.
		do
			parent_pattern := p
		ensure
			set: parent_pattern = p
		end

	set_ancestor_pattern (p: XM_XSLT_PATTERN) is
			-- Set `ancestor_pattern'.
		do
			ancestor_pattern := p
		ensure
			set: ancestor_pattern = p
		end

	set_special_filter (b: BOOLEAN) is
			-- Set `is_special_filter'.
		do
			is_special_filter := b
		ensure
			set: is_special_filter = b
		end

	set_filters (f: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Set `filters'.
		do
			filters := f
		ensure
			set: filters = f
		end

	set_equivalent_expression (exp: XM_XPATH_EXPRESSION) is
			-- Set `equivalent_expression'.
		require
			expression_not_void: exp /= Void
		do
			equivalent_expression := exp
		ensure
			set: equivalent_expression = exp
		end

feature {XM_XSLT_LOCATION_PATH_PATTERN} -- Local
	
	filters: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Filters applied to `node_test`

	uses_current: BOOLEAN
			-- At least one component depends upon `Current'

	set_uses_current (u: BOOLEAN) is
			-- Set `uses_current'.
		do
			uses_current := u
		ensure
			set: uses_current = u
		end

	set_first_element_pattern (f: BOOLEAN) is
			-- Set `is_first_element_pattern'.
		do
			is_first_element_pattern := f
		ensure
			set: is_first_element_pattern = f
		end

	set_last_element_pattern (l: BOOLEAN) is
			-- Set `is_last_element_pattern'.
		do
			is_last_element_pattern := l
		ensure
			set: is_last_element_pattern = l
		end

	make_equivalent_expression: XM_XPATH_PATH_EXPRESSION is
			-- Make a nodeset expression equivalent to a positional filter
		local
			axis: INTEGER
			step: XM_XPATH_COMPUTED_EXPRESSION
			parent_node: XM_XPATH_PARENT_NODE_EXPRESSION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if node_test.item_type = Attribute_node then
				axis := Attribute_axis
			else
				axis := Child_axis
			end
			create {XM_XPATH_AXIS_EXPRESSION} step.make (axis, node_test)
			from
				a_cursor := filters.new_cursor
				a_cursor.start
			variant
				filters.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				create {XM_XPATH_FILTER_EXPRESSION} step.make (step, a_cursor.item)
				a_cursor.forth
			end
			create parent_node.make
			create Result.make (parent_node, step) 
		end

	is_positional: BOOLEAN is
			-- Does `Current' use positional filters?
		local
			type: INTEGER
			a_filter_expression: XM_XPATH_EXPRESSION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if filters /= Void then
				from
					a_cursor := filters.new_cursor
					a_cursor.start
				variant
					filters.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_filter_expression := a_cursor.item
					type := a_filter_expression.item_type
					if type = Double_type or else type = Decimal_type
						or else type = Integer_type or else type = Float_type
						or else type = Atomic_type then
						Result := True
					elseif a_filter_expression.depends_upon_position or else a_filter_expression.depends_upon_last then
						Result := True
					end
					a_cursor.forth
				end
			end
		end


	equivalent_expression: XM_XPATH_EXPRESSION
			-- A nodeset expression equivalent to a positional filter

	is_first_element_pattern: BOOLEAN
			-- Pattern is element in first position

	is_last_element_pattern: BOOLEAN
			-- Pattern is element in last position

	is_special_filter: BOOLEAN
			-- `Current' is a special filter

feature {NONE} -- Implementation

	internal_node_test: XM_XSLT_ANY_NODE_TEST
			-- match any node

feature {XM_XSLT_PATTERN} -- Implementation

	internal_matches (a_node: XM_XPATH_NODE; a_transformer: XM_XSLT_TRANSFORMER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node
		local
			a_parent, an_ancestor, another_node: XM_XPATH_NODE
			an_enumerator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_NODE]
			a_nsv: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_new_context: XM_XPATH_CONTEXT
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			finished: BOOLEAN
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if node_test.matches_node (a_node.item_type, a_node.fingerprint, Any_item) then
				if parent_pattern /= Void then
					a_parent := a_node.parent
					if a_parent /= Void then
						if parent_pattern.internal_matches (a_parent, a_transformer) then
							if ancestor_pattern /= Void then
								an_ancestor := a_node.parent
								from
									
								until
									Result = True or else an_ancestor = Void
								loop
									if ancestor_pattern.internal_matches (an_ancestor, a_transformer) then
										Result := True
									end
									an_ancestor := an_ancestor.parent
								end
								if an_ancestor /= Void then
									if is_special_filter then
										if is_first_element_pattern then
											an_enumerator := a_node.new_axis_iterator_with_node_test (Preceding_sibling_axis, node_test)
											Result := an_enumerator.after
										elseif is_last_element_pattern then
											an_enumerator := a_node.new_axis_iterator_with_node_test (Following_sibling_axis, node_test)
											Result := an_enumerator.after
										elseif equivalent_expression /= Void then

											-- For a positional pattern, we do it the hard way: test whether
											-- `a_node' is a member of the nodeset obtained by evaluating the
											-- equivalent expression

											a_new_context := a_transformer.new_xpath_context
											create a_singleton_iterator.make (a_node)
											a_new_context.set_current_iterator (a_singleton_iterator)
											a_nsv := equivalent_expression.iterator (a_new_context)
											from
												finished := False
												a_nsv.forth
											until
												finished or else a_nsv.after
											loop
												another_node ?= a_nsv.item
												if another_node /= Void and then another_node.is_same_node (a_node) then
													Result := True
													finished := True
												end
												a_nsv.forth
											end
										end
									elseif filters /= Void then
										a_new_context := a_transformer.new_xpath_context
										create a_singleton_iterator.make (a_node)
										a_new_context.set_current_iterator (a_singleton_iterator)

										-- It's a non-positional filter, so we can handle each node separately

										from
											a_cursor := filters.new_cursor
											a_cursor.start
										variant
											filters.count + 1 - a_cursor.index
										until
											a_cursor.after
										loop
											a_boolean_value :=  a_cursor.item.effective_boolean_value (a_new_context)
											if a_boolean_value = Void or else not a_boolean_value.value  then
												Result := False
											end
											a_cursor.forth
										end
									else
										Result := True
									end
								end
							end
						end
					end
				end
			end
		end

invariant

	not_parent_and_ancestor: (parent_pattern /= Void implies ancestor_pattern = Void)
		and then (ancestor_pattern /= Void implies parent_pattern = Void)

end
