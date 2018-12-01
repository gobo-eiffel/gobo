note

	description:

		"XSLT location path patterns (e.g. A/B/C)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_LOCATION_PATH_PATTERN

inherit

	XM_XSLT_PATTERN
		redefine
			fingerprint, simplified_pattern, type_check, internal_match, node_kind,
			sub_expressions, is_location_pattern, as_location_pattern,
			compute_dependencies, promote
		end

	XM_XPATH_AXIS

	XM_XPATH_TYPE

	XM_XPATH_SHARED_EXPRESSION_TESTER
		export {NONE} all end

	XM_XSLT_SHARED_ANY_NODE_TEST
		export {NONE} all end

	MA_SHARED_DECIMAL_CONSTANTS
		export {NONE} all end

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT)
			-- Establish invariant.
		require
			static_context_not_void: a_static_context /= Void
		do
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
			original_node_test := any_xslt_node_test
			initialize_dependencies
		ensure
			system_id_set: STRING_.same_string (system_id, a_static_context.system_id)
			line_number_set: line_number = a_static_context.line_number
		end

feature -- Access

	parent_pattern: detachable XM_XSLT_PATTERN
			-- Parent pattern

	ancestor_pattern: detachable XM_XSLT_PATTERN
			-- Ancestor pattern

	node_test: XM_XSLT_NODE_TEST
			-- A node test that this pattern matches
		do
			if attached refined_node_test as l_refined_node_test then
				Result := l_refined_node_test
			else
				Result := original_node_test
			end
		end

	node_kind: INTEGER
			-- Type of nodes matched
		do
			Result := original_node_test.node_kind
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			Result := Precursor
			if attached variable_binding as l_variable_binding then
				Result.force_last (l_variable_binding)
			end
			if attached parent_pattern as l_parent_pattern then
				Result.append_last (l_parent_pattern.sub_expressions)
			end
			if attached ancestor_pattern as l_ancestor_pattern then
				Result.append_last (l_ancestor_pattern.sub_expressions)
			end
			if attached filters as l_filters then
				from l_cursor := l_filters.new_cursor; l_cursor.start until l_cursor.after loop
					Result.append_last (l_cursor.item.sub_expressions)
					l_cursor.forth
				end
			end
		end

	original_text: STRING
			-- Original text
		do
			if attached parent_pattern as l_parent_pattern then
				Result := STRING_.concat (l_parent_pattern.original_text, "/")
				Result := STRING_.appended_string (Result, original_node_test.original_text)
			elseif attached ancestor_pattern as l_ancestor_pattern then
				Result := STRING_.concat (l_ancestor_pattern.original_text, "/")
				Result := STRING_.appended_string (Result, original_node_test.original_text)
			else
				Result := original_node_test.original_text
			end
		end

	fingerprint: INTEGER
			-- Determine the name fingerprint of nodes to which this pattern applies
		do
			Result := original_node_test.fingerprint
		end

	compute_dependencies
			-- Compute dependencies which restrict optimizations
		local
			l_depends: BOOLEAN
			l_cursor:  DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if attached parent_pattern as l_parent_pattern and then l_parent_pattern.depends_upon_local_variables then
				l_depends := True
			elseif attached ancestor_pattern as l_ancestor_pattern and then l_ancestor_pattern.depends_upon_local_variables then
				l_depends := True
			elseif attached filters as l_filters then
				from l_cursor := l_filters.new_cursor; l_cursor.start until l_cursor.after loop
					if l_cursor.item.depends_upon_local_variables then
						l_depends := True
						l_cursor.go_after
					else
						l_cursor.forth
					end
				end
			end
			if l_depends then
				set_depends_upon_local_variables
			end
		end

feature -- Status report

	is_constructed: BOOLEAN
			-- Has the pattern finished construction?

	is_location_pattern: BOOLEAN
			-- Is `Current' a location-path pattern?
		do
			Result := True
		end

feature -- Status setting

	finish_construction
			-- Pattern is finished.
		require
			not_finished: not is_constructed
		do
			is_constructed := True
		ensure
			finished: is_constructed
		end

	resolve_current (a_let_expression: XM_XPATH_LET_EXPRESSION; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Resolve calls to fn:current().
		require
			a_let_expression_not_void: a_let_expression /= Void
			a_offer_not_void: a_offer /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if attached filters as l_filters then
				from
					create l_replacement.make (Void)
					l_cursor := l_filters.new_cursor
					l_cursor.start
				until l_cursor.after loop
					l_cursor.item.promote (l_replacement, a_offer)
					check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
						if l_cursor.item /= l_replacement_item then
							l_cursor.replace (l_replacement_item)
						end
					end
					l_replacement.put (Void)
					l_cursor.forth
				end
			end
			if attached parent_pattern as l_parent_pattern and then l_parent_pattern.is_location_pattern then
				l_parent_pattern.as_location_pattern.resolve_current (a_let_expression, a_offer)
			end
			if attached ancestor_pattern as l_ancestor_pattern and then l_ancestor_pattern.is_location_pattern then
				l_ancestor_pattern.as_location_pattern.resolve_current (a_let_expression, a_offer)
			end
			variable_binding := a_let_expression
		end


feature -- Optimization

	simplified_pattern: XM_XSLT_PATTERN
			-- Simplify a pattern by applying any context-independent optimizations;
			-- Default implementation does nothing
		local
			l_result_pattern: XM_XSLT_LOCATION_PATH_PATTERN
			l_filter_expression: XM_XPATH_EXPRESSION
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do

			-- Detect the simple cases: no parent or ancestor pattern, no predicates

			if parent_pattern = Void and then ancestor_pattern = Void and then filters = Void then
				Result := node_test.cloned_object
				Result.set_system_id (system_id)
				Result.set_line_number (line_number)
			else
				l_result_pattern := cloned_object

				-- Simplify each component of the pattern

				if attached parent_pattern as l_parent_pattern then
					l_result_pattern.set_parent_pattern (l_parent_pattern.simplified_pattern)
				elseif attached ancestor_pattern as l_ancestor_pattern then
					l_result_pattern.set_ancestor_pattern (l_ancestor_pattern.simplified_pattern)
				end

				if attached l_result_pattern.filters as l_filters then
					from
						l_cursor := l_filters.new_cursor
						l_cursor.start
						create l_replacement.make (Void)
					until
						l_cursor.after
					loop
						l_filter_expression := l_cursor.item

						l_filter_expression.simplify (l_replacement)
						check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
							if l_filter_expression /= l_replacement_item then
								l_cursor.replace (l_replacement_item)
							end
						end
						l_replacement.put (Void)
						l_cursor.forth
					variant
						l_filters.count + 1 - l_cursor.index
					end
				end
				Result := l_result_pattern
			end
		end

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Type-check the pattern;
		local
			l_filter_expression, l_expression: XM_XPATH_EXPRESSION
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_step: XM_XPATH_AXIS_EXPRESSION
			l_filters: like filters
			l_routines: XM_XSLT_PATTERN_ROUTINES
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check
				l_context_not_void: attached {XM_XSLT_EXPRESSION_CONTEXT} a_context as l_context
				-- this is XSLT
			then

				-- Analyze each component of the pattern

				if attached parent_pattern as l_parent_pattern then
					l_parent_pattern.type_check (a_context, a_context_item_type)
					if attached l_parent_pattern.error_value as l_error_value then
						check is_error: l_parent_pattern.is_error end
						set_error_value (l_error_value)
					else
						if original_node_test.primitive_type = Attribute_node then
							create l_step.make (Attribute_axis, original_node_test)
						else
							create l_step.make (Child_axis, original_node_test)
						end
						check attached l_context.style_element.containing_stylesheet as l_containing_stylesheet then
							l_step.set_source_location (l_containing_stylesheet.module_number (a_context.system_id), line_number)
						end
						create l_replacement.make (Void)
						l_step.check_static_type (l_replacement, a_context, l_parent_pattern.node_test)
						check potcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
							l_expression := l_replacement_item
						end
						if attached l_expression.error_value as l_error_value then
							check is_erorr: l_expression.is_error end
							set_error_value (l_error_value)
						end
						if not is_error and then l_expression.item_type.is_node_test then
							create l_routines
							refined_node_test := l_routines.xpath_to_xslt_node_test (l_expression.item_type.as_node_test, a_context)
						end
					end
				elseif attached ancestor_pattern as l_ancestor_pattern then
					l_ancestor_pattern.type_check (a_context, a_context_item_type)
					if attached l_ancestor_pattern.error_value as l_error_value then
						check is_error: l_ancestor_pattern.is_error end
						set_error_value (l_error_value)
					end
				end

				if not is_error and then attached filters as l_filters_2 then
					create l_filters.make (l_filters_2.count)
					l_filters.set_equality_tester (expression_tester)
					from
						create l_replacement.make (Void)
						l_cursor := l_filters_2.new_cursor
						l_cursor.finish
					until
						is_error or else l_cursor.before
					loop
						l_cursor.item.check_static_type (l_replacement, a_context, node_test)
						check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
							l_filter_expression := l_replacement_item
						end
						if attached l_filter_expression.error_value as l_error_value then
							check is_error: l_filter_expression.is_error end
							set_error_value (l_error_value)
						else
							l_replacement.put (Void)
							l_filter_expression.optimize (l_replacement, a_context, node_test)
							check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
								l_filter_expression := l_replacement_item
							end
							l_replacement.put (Void)
						end
						if not is_error then

							-- If the last filter is constant true, remove it.

							if l_filter_expression.is_boolean_value then
								if l_filter_expression.as_boolean_value.value then
									-- do nothing
								end
							else
								l_filters.put_first (l_filter_expression)
								check attached l_context.style_element.containing_stylesheet as l_containing_stylesheet then
									l_context.style_element.allocate_slots (l_filter_expression, l_containing_stylesheet.slot_manager)
								end
							end
						end
						l_cursor.back
					variant
						l_cursor.index
					end
					filters := l_filters
				end
			end

			if not is_error then

				-- See if it's an element pattern with a single positional predicate of [1]

				if original_node_test.node_kind = Element_node and (attached filters as l_filters_2 and then l_filters_2.count = 1) then
					l_filter_expression := l_filters_2.item (1)
					if (l_filter_expression.is_machine_integer_value and then l_filter_expression.as_machine_integer_value.value = 1
						or else (l_filter_expression.is_position_range and then
									(l_filter_expression.as_position_range.minimum_position = 1 and
									 l_filter_expression.as_position_range.maximum_position = 1))) then
						set_first_element_pattern (True)
						set_special_filter (True)
						set_filters (Void)
					end
				end

				-- See if it's an element pattern with a single positional predicate
				-- of [position()=last()]

				if not is_first_element_pattern and original_node_test.node_kind = Element_node and (attached filters as l_filters_2 and then l_filters_2.count = 1) then
					if l_filters_2.item (1).is_last_expression  and then l_filters_2.item (1).as_last_expression.condition then
						set_last_element_pattern (True)
						set_special_filter (True)
						set_filters (Void)
					end
				end

				if is_positional then
					l_expression := make_equivalent_expression
					create l_replacement.make (Void)
					l_expression.check_static_type (l_replacement, a_context, a_context_item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_equivalent_expression then
						set_equivalent_expression (l_equivalent_expression)
						if attached l_equivalent_expression.error_value as l_error_value then
							check is_error: l_equivalent_expression.is_error end
							set_error_value (l_error_value)
						else
							check
								l_context_not_void: attached {XM_XSLT_EXPRESSION_CONTEXT} a_context as l_context
								attached l_context.style_element.containing_stylesheet as l_containing_stylesheet
							then
								l_context.style_element.allocate_slots (l_equivalent_expression, l_containing_stylesheet.slot_manager)
								set_special_filter (True)
							end
						end
					end
				end
			end
		end

	promote (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote sub-expressions of `Current'.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if attached parent_pattern as l_parent_pattern then
				l_parent_pattern.promote (a_offer)
			end
			if attached ancestor_pattern as l_ancestor_pattern then
				l_ancestor_pattern.promote (a_offer)
			end
			if attached filters as l_filters then
				from
					l_cursor := l_filters.new_cursor
					l_cursor.start
					create l_replacement.make (Void)
				until l_cursor.after loop
					l_cursor.item.promote (l_replacement, a_offer)
					check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
						if l_cursor.item /= l_replacement_item then
							l_cursor.replace (l_replacement_item)
						end
					end
					l_replacement.put (Void)
					l_cursor.forth
				end
			end
		end

feature -- Matching

	match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Does `Current' match `a_node'?
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			if attached variable_binding as l_variable_binding then
				create l_item.make (Void)
				l_variable_binding.evaluate_item (l_item, a_context)
			end
			if is_error then
				internal_last_match_result := False
			else
				internal_match (a_node, a_context)
			end
		end

feature -- Element change

	add_filter (a_filter_expression: XM_XPATH_EXPRESSION)
			-- Add `a_filter_expression' to the pattern (whilst under construction).
		require
			under_construction: not is_constructed
			valid_filter: a_filter_expression /= Void
		local
			l_filters: like filters
		do
			l_filters := filters
			if l_filters = Void then
				create l_filters.make (3)
				l_filters.set_equality_tester (expression_tester)
				filters := l_filters
			end
			if not l_filters.extendible (1) then
				l_filters.resize (2 * l_filters.count)
			end
			l_filters.put_last (a_filter_expression)
		ensure
			filters_present: filters /= Void
		end

	set_parent_pattern (p: XM_XSLT_PATTERN)
			-- Set `parent_pattern'.
		do
			parent_pattern := p
		ensure
			set: parent_pattern = p
		end

	set_ancestor_pattern (p: XM_XSLT_PATTERN)
			-- Set `ancestor_pattern'.
		do
			ancestor_pattern := p
		ensure
			set: ancestor_pattern = p
		end

	set_special_filter (b: BOOLEAN)
			-- Set `is_special_filter'.
		do
			is_special_filter := b
		ensure
			set: is_special_filter = b
		end

	set_filters (f: detachable DS_ARRAYED_LIST [XM_XPATH_EXPRESSION])
			-- Set `filters'.
		do
			filters := f
		ensure
			set: filters = f
		end

	set_equivalent_expression (exp: XM_XPATH_EXPRESSION)
			-- Set `equivalent_expression'.
		require
			expression_not_void: exp /= Void
		do
			equivalent_expression := exp
		ensure
			set: equivalent_expression = exp
		end

	set_node_test (a_node_test: XM_XSLT_NODE_TEST)
			-- Set `original_node_test'.
		require
			node_test_not_void: a_node_test /= Void
		do
			original_node_test := a_node_test
		ensure
			node_test_set: original_node_test = a_node_test
		end

feature -- Conversion

	as_location_pattern: XM_XSLT_LOCATION_PATH_PATTERN
			-- `Current' seen as a location-path pattern
		do
			Result := Current
		end

feature {XM_XSLT_LOCATION_PATH_PATTERN} -- Local

	filters: detachable DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Filters applied to `node_test`

	set_first_element_pattern (f: BOOLEAN)
			-- Set `is_first_element_pattern'.
		do
			is_first_element_pattern := f
		ensure
			set: is_first_element_pattern = f
		end

	set_last_element_pattern (l: BOOLEAN)
			-- Set `is_last_element_pattern'.
		do
			is_last_element_pattern := l
		ensure
			set: is_last_element_pattern = l
		end

	make_equivalent_expression: XM_XPATH_PATH_EXPRESSION
			-- Make a nodeset expression equivalent to a positional filter
		local
			axis: INTEGER
			step: XM_XPATH_COMPUTED_EXPRESSION
			parent_node: XM_XPATH_PARENT_NODE_EXPRESSION
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if original_node_test.node_kind = Attribute_node then
				axis := Attribute_axis
			else
				axis := Child_axis
			end
			create {XM_XPATH_AXIS_EXPRESSION} step.make (axis, original_node_test)
			if attached filters as l_filters then
				from
					l_cursor := l_filters.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					create {XM_XPATH_FILTER_EXPRESSION} step.make (step, l_cursor.item)
					l_cursor.forth
				variant
					l_filters.count + 1 - l_cursor.index
				end
			end
			create parent_node.make
			create Result.make (parent_node, step)
		end

	is_positional: BOOLEAN
			-- Does `Current' use positional filters?
		local
			type: INTEGER
			a_filter_expression: XM_XPATH_EXPRESSION
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if attached filters as l_filters then
				from
					l_cursor := l_filters.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					a_filter_expression := l_cursor.item
					type := a_filter_expression.item_type.primitive_type
					if type = type_factory.double_type.fingerprint or type = type_factory.decimal_type.fingerprint
						or  type = type_factory.integer_type.fingerprint
						or (type_factory.float_type /= Void and then type = type_factory.float_type.fingerprint)
						or type = type_factory.any_atomic_type.fingerprint then
						Result := True
					elseif a_filter_expression.depends_upon_position or a_filter_expression.depends_upon_last then
						Result := True
					end
					l_cursor.forth
				variant
					l_filters.count + 1 - l_cursor.index
				end
			end
		end


	equivalent_expression: detachable XM_XPATH_EXPRESSION
			-- A nodeset expression equivalent to a positional filter

	is_first_element_pattern: BOOLEAN
			-- Pattern is element in first position

	is_last_element_pattern: BOOLEAN
			-- Pattern is element in last position

	is_special_filter: BOOLEAN
			-- `Current' is a special filter

feature {XM_XSLT_PATTERN} -- Implementation

	original_node_test: like node_test
			-- Originally supplied node test

	refined_node_test: detachable like node_test
			-- `original_node_test' refined by type checking

	variable_binding: detachable XM_XPATH_EXPRESSION
			-- Bound variable for replacing calls to fn:current()

	internal_match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Does `Current' match `a_node'?
		local
			l_node: detachable XM_XPATH_NODE
			l_is_candidate_match: BOOLEAN
		do
			internal_last_match_result := False
			if node_test.matches_node (a_node.node_type, a_node.fingerprint, a_node.type_annotation) then
				l_is_candidate_match := True
				if attached parent_pattern as l_parent_pattern then
					l_node := a_node.parent
					if l_node /= Void then
						l_parent_pattern.internal_match (l_node, a_context)
						if attached l_parent_pattern.error_value as l_error_value then
							check is_error: l_parent_pattern.is_error end
							set_error_value (l_error_value)
							l_is_candidate_match := False
						else
							l_is_candidate_match := l_parent_pattern.last_match_result
						end
					else
						l_is_candidate_match := False
					end
				elseif attached ancestor_pattern as l_ancestor_pattern then
					l_is_candidate_match := False
					from
						l_node := a_node.parent
					until
						is_error or l_is_candidate_match or l_node = Void
					loop
						l_ancestor_pattern.internal_match (l_node, a_context)
						if attached l_ancestor_pattern.error_value as l_error_value then
							check is_error: l_ancestor_pattern.is_error end
							set_error_value (l_error_value)
							l_is_candidate_match := False
						else
							l_is_candidate_match := l_ancestor_pattern.last_match_result
						end
						l_node := l_node.parent
					end
				end
				if l_is_candidate_match and not is_error then
					confirm_match (a_node, a_context)
				end
			end
		end

feature {NONE} -- Implementation

	confirm_match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Check that `Current' is indeed a match for `a_node'.
		require
			a_node_not_void: a_node /= Void
			a_context_not_void: a_context /= Void
			not_in_error: not is_error
		local
			l_is_result_determined: BOOLEAN
			l_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_singleton_iterator: XM_XPATH_SINGLETON_NODE_ITERATOR
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			if is_special_filter then
				l_is_result_determined := True
				if is_first_element_pattern then
					l_node_iterator := a_node.new_axis_iterator_with_node_test (Preceding_sibling_axis, node_test)
					l_node_iterator.start
					internal_last_match_result := l_node_iterator.after
				elseif is_last_element_pattern then
					l_node_iterator := a_node.new_axis_iterator_with_node_test (Following_sibling_axis, node_test)
					l_node_iterator.start
					internal_last_match_result := l_node_iterator.after
				elseif equivalent_expression /= Void then
					match_equivalent_expression (a_node, a_context)
				else
					l_is_result_determined := False
				end
			end
			if not l_is_result_determined then
				if not attached filters as l_filters then
					internal_last_match_result := True
				else
					l_new_context := a_context.new_minor_context
					create l_singleton_iterator.make (a_node)
					l_singleton_iterator.start
					l_new_context.set_current_iterator (l_singleton_iterator)

					-- as it's a non-positional filter, we can handle each node separately

					from
						l_cursor := l_filters.new_cursor
						l_cursor.start
						internal_last_match_result := True
					until
						internal_last_match_result = False or l_cursor.after
					loop
						l_cursor.item.calculate_effective_boolean_value (l_new_context)
						if attached l_cursor.item.error_value as l_error_value then
							check is_error: l_cursor.item.is_error end
							set_error_value (l_error_value)
						else
							check postcondition_of_calculate_effective_boolean_value: attached l_cursor.item.last_boolean_value as l_last_boolean_value then
								internal_last_match_result := l_last_boolean_value.value
							end
						end
						l_cursor.forth
					variant
						l_filters.count + 1 - l_cursor.index
					end
				end
			end
		end

	match_equivalent_expression (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Does `a_node' matches `equivalent_expression'?
		require
			node_not_void: a_node /= Void
			equivalent_expression_not_void: equivalent_expression /= Void
			context_not_void: a_context /= Void
			not_in_error: not is_error
		local
			l_context: XM_XSLT_EVALUATION_CONTEXT
			l_iterator: XM_XPATH_SINGLETON_NODE_ITERATOR
			l_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			l_context := a_context.new_minor_context
			create l_iterator.make (a_node)
			l_iterator.start
			if l_iterator.is_error then
				-- optional recovery action
				internal_last_match_result := False
			else
				l_context.set_current_iterator (l_iterator)
				check precondition_equivalent_expression_not_void: attached equivalent_expression as l_equivalent_expression then
					l_equivalent_expression.create_node_iterator (l_context)
					check postcondition_of_create_node_iterator: attached l_equivalent_expression.last_node_iterator as l_last_node_iterator then
						l_node_iterator := l_last_node_iterator
					end
				end
				if attached l_node_iterator.error_value as l_error_value then
					check is_error: l_node_iterator.is_error end
					set_error_value (l_error_value)
				else
					from
						l_node_iterator.start
					until
						 internal_last_match_result or (l_node_iterator.is_error or else l_node_iterator.after)
					loop
						if l_node_iterator.item.is_same_node (a_node) then
							internal_last_match_result := True
						else
							l_node_iterator.forth
						end
					end
					if l_node_iterator.is_error then
						-- optional recovery action
						internal_last_match_result := False
					end
				end
			end
		end

invariant

	not_parent_and_ancestor: (parent_pattern /= Void implies ancestor_pattern = Void)
		and then (ancestor_pattern /= Void implies parent_pattern = Void)
	original_node_test_not_void: original_node_test /= Void

end
