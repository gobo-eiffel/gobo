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
			fingerprint, simplified_pattern, type_check, internal_matches, node_kind
		end

	XM_XPATH_AXIS

	XM_XPATH_TYPE

	XM_XPATH_SHARED_EXPRESSION_TESTER

	XM_XSLT_SHARED_ANY_NODE_TEST

	MA_DECIMAL_MATH

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			node_test := any_xslt_node_test
		end

feature -- Access

	parent_pattern: XM_XSLT_PATTERN
			-- Parent pattern

	ancestor_pattern: XM_XSLT_PATTERN
			-- Ancestor pattern

	node_test: XM_XSLT_NODE_TEST
			-- A node test that this pattern matches

	node_kind: INTEGER is
			-- Type of nodes matched
		do
			Result := node_test.node_kind
		end
	
	original_text: STRING is
			-- Original text
		do
			if parent_pattern /= Void then
				Result := STRING_.concat (parent_pattern.original_text, "/")
				Result := STRING_.appended_string (Result, node_test.original_text)
			elseif ancestor_pattern /= Void then
				Result := STRING_.concat (parent_pattern.original_text, "/")
				Result := STRING_.appended_string (Result, node_test.original_text)
			else
				Result := node_test.original_text
			end
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

	simplified_pattern: XM_XSLT_PATTERN is
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
				-- TODO Result.set_system_id (system_id)
				Result.set_line_number (line_number)
			else
				a_result_pattern := clone (Current)
				
				-- Simplify each component of the pattern
				
				if parent_pattern /= Void then
					a_result_pattern.set_parent_pattern (parent_pattern.simplified_pattern)
					a_location_pattern ?= a_result_pattern.parent_pattern
					if a_location_pattern /= Void then
						a_result_pattern.set_uses_current (a_location_pattern.uses_current)
					end
				elseif ancestor_pattern /= Void then
					a_result_pattern.set_ancestor_pattern (ancestor_pattern.simplified_pattern)
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

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Type-check the pattern;
		local
			a_boolean: XM_XPATH_BOOLEAN_VALUE
			an_integer: XM_XPATH_INTEGER_VALUE
			a_position_range: XM_XPATH_POSITION_RANGE
			is_last_expression: XM_XPATH_IS_LAST_EXPRESSION
			an_expression_context: XM_XSLT_EXPRESSION_CONTEXT
			a_filter_expression, an_expression: XM_XPATH_EXPRESSION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do

			-- Analyze each component of the pattern

			if parent_pattern /= Void then
				parent_pattern.type_check (a_context)
				if parent_pattern.is_error then set_error_value (parent_pattern.error_value) end
			elseif ancestor_pattern /= Void then
				ancestor_pattern.type_check (a_context)
				if ancestor_pattern.is_error then set_error_value (ancestor_pattern.error_value) end
			end

			if not is_error and then filters /= Void then
				from
					a_cursor := filters.new_cursor
					a_cursor.start
				variant
					filters.count + 1 - a_cursor.index
				until
					is_error or else a_cursor.after
				loop
					a_cursor.item.analyze (a_context)
					if a_cursor.item.was_expression_replaced then
						a_filter_expression := a_cursor.item.replacement_expression
					else
						a_filter_expression := a_cursor.item
					end
					if a_filter_expression.is_error then
						set_error_value (a_filter_expression.error_value)
					end
					if not is_error then

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
					end
					a_cursor.forth
				end
			end

			if not is_error then
				
				-- See if it's an element pattern with a single positional predicate of [1]

				if node_test.node_kind = Element_node and then filters /= Void and then filters.count = 1 then
					a_filter_expression := filters.item (1)
					an_integer ?= a_filter_expression
					a_position_range ?= a_filter_expression
					if (an_integer /= Void and then an_integer.value.is_equal (one))
						or else (a_position_range /= Void and then
									a_position_range.minimum_position = 1 and a_position_range.maximum_position = 1) then
						set_first_element_pattern (True)
						set_special_filter (True)
						set_filters (Void)
					end
				end

				-- See if it's an element pattern with a single positional predicate
				-- of [position()=last()]
				
				if not is_first_element_pattern and then node_test.node_kind = Element_node and then filters /= Void and then filters.count = 1 then
					is_last_expression ?= filters.item (1)
					if is_last_expression /= Void and then is_last_expression.condition then
						set_last_element_pattern (True)
						set_special_filter (True)
						set_filters (Void)
					end
				end
				
				if is_positional then
					an_expression := make_equivalent_expression
					an_expression.analyze (a_context)
					if an_expression.was_expression_replaced then
						set_equivalent_expression (an_expression.replacement_expression)
					else
						set_equivalent_expression (an_expression)
					end
					if equivalent_expression.is_error then
						set_error_value (equivalent_expression.error_value)
					else
						set_special_filter (True)
					end
				end
			end
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

	set_node_test (a_node_test: XM_XSLT_NODE_TEST) is
			-- Set `node_test'.
		require
			node_test_not_void: a_node_test /= Void
		do
			node_test := a_node_test
		ensure
			node_test_set: node_test = a_node_test
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
			if node_test.node_kind = Attribute_node then
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
					type := a_filter_expression.item_type.primitive_type
					if type = type_factory.double_type.fingerprint or else type = type_factory.decimal_type.fingerprint
						or else type = type_factory.integer_type.fingerprint or else type = type_factory.float_type.fingerprint
						or else type = type_factory.any_atomic_type.fingerprint then
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

feature {XM_XSLT_PATTERN} -- Implementation

	internal_matches (a_node: XM_XPATH_NODE; a_transformer: XM_XSLT_TRANSFORMER): BOOLEAN is
			-- Does `Current' match `a_node'?
		local
			another_node: XM_XPATH_NODE
			is_candidate_match, is_result_determined: BOOLEAN
			a_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_context: XM_XSLT_EVALUATION_CONTEXT
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_NODE]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if node_test.matches_node (a_node.node_type, a_node.fingerprint, a_node.type_annotation) then
				if parent_pattern /= void then
					another_node := a_node.parent
					if another_node /= Void then
						is_candidate_match := parent_pattern.internal_matches (another_node, a_transformer)
					end
				elseif ancestor_pattern /= Void then
					from
						another_node := a_node.parent
					until
						is_candidate_match or else another_node = Void
					loop
						is_candidate_match := ancestor_pattern.internal_matches (another_node, a_transformer)
						another_node := another_node.parent	
					end
				end
				if is_candidate_match then
					if is_special_filter then
						is_result_determined := True
						if is_first_element_pattern then
							a_node_iterator := a_node.new_axis_iterator_with_node_test (Preceding_sibling_axis, node_test)
							a_node_iterator.start; Result := a_node_iterator.after
						elseif is_last_element_pattern then
							a_node_iterator := a_node.new_axis_iterator_with_node_test (Following_sibling_axis, node_test)
							a_node_iterator.start; Result := a_node_iterator.after
						elseif equivalent_expression /= Void then
							Result := equivalent_expression_matches (a_node, a_transformer)
						else
							is_result_determined := False
						end
					end
					if not is_result_determined then
						if filters = Void then
							Result := True
						else
							a_context := a_transformer.new_xpath_context
							create a_singleton_iterator.make (a_node)
							a_context.set_current_iterator (a_singleton_iterator)

							-- as it's a non-positional filter, we can handle each node separately

							from
								a_cursor := filters.new_cursor; a_cursor.start; Result := True
							variant
								filters.count + 1 - a_cursor.index
							until
								Result = False or else a_cursor.after
							loop
								Result := a_cursor.item.effective_boolean_value (a_context).value
								a_cursor.forth
							end
						end
					end
				end
			end
		end
	
feature {NONE} -- Implementation

	equivalent_expression_matches (a_node: XM_XPATH_NODE; a_transformer: XM_XSLT_TRANSFORMER): BOOLEAN is
			-- Does `a_node' matches `equivalent_expression'?
		require
			node_not_void: a_node /= Void
			equivalent_expression_not_void: equivalent_expression /= Void
			transformer_not_void: a_transformer /= Void
		do
			todo ("equivalent_expression_matches", False)
		end

invariant

	not_parent_and_ancestor: (parent_pattern /= Void implies ancestor_pattern = Void)
		and then (ancestor_pattern /= Void implies parent_pattern = Void)
	node_test_not_void: node_test /= Void

end
