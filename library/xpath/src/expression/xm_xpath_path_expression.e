note

	description:

		"XPath Path Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_PATH_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, promote, compute_dependencies, compute_special_properties, sub_expressions,
			same_expression, create_iterator, is_repeated_sub_expression, is_path_expression,
			as_path_expression, is_error, is_node_sequence, create_node_iterator
		end

	XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_NODE_MAPPING_FUNCTION

	XM_XPATH_ROLE

	XM_XPATH_AXIS

	XM_XPATH_PROMOTION_ACTIONS

create

	make

feature {NONE} -- Initialization

	make (a_start: XM_XPATH_EXPRESSION; a_step: XM_XPATH_EXPRESSION)
			-- Establish invariant.
		require
			start_not_void: a_start /= Void
			step_not_void: a_step /= Void
		local
			a_step_path, a_start_path: XM_XPATH_PATH_EXPRESSION
		do
			start := a_start
			step := a_step
			adopt_child_expression (start)
			adopt_child_expression (step)

			-- If start is a path expression such as a, and step is b/c, then
			--  instead of a/(b/c) we construct (a/b)/c.
			-- This is because it often avoids a sort.

		  -- The "/" operator in XPath 2.0 is not always associative. Problems
		  -- can occur if position() and last() are used on the rhs, or if node-constructors
		  -- appear, e.g. //b/../<d/>. So we only do this rewrite if the step is a path
		  -- expression in which both operands are axis expression optionally with predicates

			if step.is_path_expression then
				a_step_path := step.as_path_expression
				if is_filtered_axis_path (a_step_path.start) and then is_filtered_axis_path (a_step_path.start) then
					create a_start_path.make (start, a_step_path.start)
					set_start (a_start_path)
					set_step (a_step_path.step)
				end
			end
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	is_path_expression: BOOLEAN
			-- Is `Current' a path expression?
		do
			Result := True
		end

	as_path_expression: XM_XPATH_PATH_EXPRESSION
			-- `Current' seen as a path expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			--Determine the data type of the expression, if possible
		do
			Result := step.item_type
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (start, 1)
			Result.put (step, 2)
		end

	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		do
			Result := a_child = step
		end

	first_step: XM_XPATH_EXPRESSION
			-- First step of `Current';
			-- A path expression A/B/C is represented as (A/B)/C, but the first step is A
		do
			if start.is_path_expression then
				Result := start.as_path_expression.first_step
			else
				Result := start
			end
		ensure
			first_step_not_void: Result /= Void
		end

	remaining_steps: XM_XPATH_EXPRESSION
			-- Remaining steps after `first_step;
			-- This is complicated by the fact that as A/B/C is represented as ((A/B)/C; we are required to return B/C
		do
			if start.is_path_expression then
				create {XM_XPATH_PATH_EXPRESSION} Result.make (start.as_path_expression.remaining_steps, step)
				copy_location_identifier (Result)
			else
				Result := step
			end
		ensure
			remaining_steps_not_void: Result /= Void
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		local
			a_path: XM_XPATH_PATH_EXPRESSION
		do
			if other.is_path_expression then
				a_path := other.as_path_expression
				Result := start.same_expression (a_path.start) and then step.same_expression (a_path.step)
			end
		end

feature -- Status report

	is_error: BOOLEAN
			-- Is `Current' in error?
			-- Note: this is exactly the same implementation as in
			-- XM_XPATH_EXPRESSION but it works around a bug in
			-- the optimizer of SE 1.0/1.2 which was binding
			-- XM_XPATH_EXPRESSION.is_error statically in
			-- XM_XPATH_EXPRESSION_FACTORY.make_expression whereas
			-- it should have been dynamically bound.
		do
			Result := error_value /= Void
		end

	is_node_sequence: BOOLEAN
			-- Is `Current' a sequence of zero or more nodes?
		do
			Result := is_node_item_type (step.item_type)
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "path /")
			std.error.put_string (a_string)
			std.error.put_new_line
			start.display (a_level + 1)
			step.display (a_level + 1)
		end

feature -- Status setting

	compute_dependencies
			-- Compute dependencies on context.
		do
			if not are_intrinsic_dependencies_computed then
				compute_intrinsic_dependencies
			end
			set_dependencies (start)
			if step.depends_upon_xslt_context then
				set_depends_upon_xslt_context
			end
			if step.depends_upon_user_functions then
				set_depends_upon_user_functions
			end
			if step.depends_upon_local_variables then
				set_depends_upon_local_variables
			end
			are_dependencies_computed := True
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if analysis_state < Simplified_state then
				analysis_state := Simplified_state
				create l_replacement.make (Void)
				start.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					if start /= l_replacement_item then
						set_start (l_replacement_item)
					end
				end
				if start.is_error then
					set_replacement (a_replacement, start)
				else
					l_replacement.put (Void)
					step.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
						if step /= l_replacement_item then
							set_step (l_replacement_item)
						end
					end
					if step.is_error then
						set_replacement (a_replacement, step)
					else
						reset_static_properties
						if start.is_empty_sequence then
							-- if the start expression is an empty node-set, then the whole path-expression is empty
							set_replacement (a_replacement, start)
						else
							-- Remove a redundant "." from the path.
							-- Note: we are careful not to do this unless the other operand is naturally sorted.
							-- In other cases, ./E (or E/.) is not a no-op, because it forces sorting.
							if start.is_context_item and then step.is_path_expression and then step.as_path_expression.ordered_nodeset then
								set_replacement (a_replacement, step.as_path_expression)
							elseif step.is_context_item and then start.is_path_expression and then start.as_path_expression.ordered_nodeset then
								set_replacement (a_replacement, start.as_path_expression)
							else
								-- the expression /.. is sometimes used to represent the empty node-set
								if start.is_root_expression and then step.is_parent_node_expression then
									set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
								end
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_role: XM_XPATH_ROLE_LOCATOR
			l_node_sequence: XM_XPATH_SEQUENCE_TYPE
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_mapped: XM_XPATH_MAPPED_PATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if analysis_state < Type_checked_state then
				analysis_state := Type_checked_state
				create l_type_checker
				create l_replacement.make (Void)
				start.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					if start /= l_replacement_item then
						set_start (l_replacement_item)
					end
				end
				if start.is_error then
					set_replacement (a_replacement, start)
				else
					l_replacement.put (Void)
					step.check_static_type (l_replacement, a_context, start.item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
						if step /= l_replacement_item then
							set_step (l_replacement_item)
						end
					end
					if step.is_error then
						set_replacement (a_replacement, step)
					else
						reset_static_properties
						-- Start must be of type node()*
						create l_role.make (Binary_expression_role, "/", 1, Xpath_errors_uri, "XPTY0019")
						create l_node_sequence.make_node_sequence
						l_type_checker.static_type_check (a_context, start, l_node_sequence, False, l_role)
						if l_type_checker.is_static_type_check_error then
							check invariant_of_XM_XPATH_TYPE_CHECKER: attached l_type_checker.static_type_check_error as l_static_type_check_error then
								set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_static_type_check_error))
							end
						else
							check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
								set_start (l_checked_expression)
								-- We distinguish three cases for the step:
								--  either it is known statically to deliver nodes only (a 1.0 path expression),
								--  or it is known statically to deliver atomic values only, or we don't yet know.
								if is_node_sequence then
									simplify_sorting (a_replacement, a_context, a_context_item_type)
								elseif is_atomic_item_type (step.item_type) then
									create l_mapped.make (start, step, False)
									l_mapped.set_parent (parent)
									set_replacement (a_replacement, l_mapped)
								else
									create l_mapped.make (start, step, True)
									l_mapped.set_parent (parent)
									set_replacement (a_replacement, l_mapped)
								end
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_offer: XM_XPATH_PROMOTION_OFFER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if analysis_state < Optimized_state then
				analysis_state := Optimized_state
				create l_replacement.make (Void)
				start.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
					if start /= l_replacement_item then
						set_start (l_replacement_item)
					end
				end
				if start.is_error then
					set_replacement (a_replacement, start)
				else
					l_replacement.put (Void)
					step.optimize (l_replacement, a_context, start.item_type)
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
						if step /= l_replacement_item then
							set_step (l_replacement_item)
						end
					end
					if step.is_error then
						set_replacement (a_replacement, step)
					else
						reset_static_properties
						--	If any subexpressions within the step are not dependent on the focus,
						--  and if they cannot create new nodes, then promote them:
						-- This causes them to be evaluated once, outside the path expression
						create l_offer.make (Focus_independent, Void, Current, False, start.context_document_nodeset)
						promote_sub_expressions (a_replacement, a_context, a_context_item_type, l_offer)
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION];a_offer: XM_XPATH_PROMOTION_OFFER)
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
				create l_replacement.make (Void)
				start.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					if start /= l_replacement_item then
						set_start (l_replacement_item)
						reset_static_properties
					end
				end
				if start.is_error then
					set_replacement (a_replacement, start)
				else
					if a_offer.action = Inline_variable_references or a_offer.action = Replace_current then
						-- Don't pass on other requests. We could pass them on, but only after augmenting
						--  them to say we are interested in subexpressions that don't depend on either the
						--  outer context or the inner context.
						l_replacement.put (Void)
						step.promote (l_replacement, a_offer)
						check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
							if step /= l_replacement_item then
								set_step (l_replacement_item)
								reset_static_properties
							end
						end
					end
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence;
			-- Delivers the result of the path expression in unsorted order,
			--  without removal of duplicates.
			-- If sorting and deduplication are needed,
			--  this is achieved by wrapping the path expression in an XM_XPATH_DOCUMENT_SORTER.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			another_context: XM_XPATH_CONTEXT
		do
			start.create_iterator (a_context)
			check postcondition_of_create_iterator: attached start.last_iterator as l_last_iterator then
				an_iterator := l_last_iterator
				if an_iterator.is_error then
					last_iterator := an_iterator
				else
					if a_context.has_push_processing then
						another_context := a_context.new_minor_context
					else
						another_context := a_context.new_context
					end
					another_context.set_current_iterator (an_iterator)

					if is_node_sequence then
						create {XM_XPATH_NODE_MAPPING_ITERATOR} last_iterator.make (an_iterator, Current, another_context)
					else
						create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (an_iterator, Current, another_context)
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			another_context: XM_XPATH_CONTEXT
		do
			start.create_node_iterator (a_context)
			check postcondition_of_create_node_iterator: attached start.last_node_iterator as l_last_node_iterator then
				an_iterator := l_last_node_iterator
				if an_iterator.is_error then
					last_node_iterator := an_iterator
				else
					if a_context.has_push_processing then
						another_context := a_context.new_minor_context
					else
						another_context := a_context.new_context
					end
					another_context.set_current_iterator (an_iterator)
					create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (an_iterator, Current, another_context)
				end
			end
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Map `an_item' to a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_invalid_item: XM_XPATH_INVALID_ITEM
		do
			step.create_iterator (a_context)
			check postcondition_of_create_iterator: attached step.last_iterator as l_last_iterator then
				an_iterator := l_last_iterator
				if attached an_iterator.error_value as l_error_value then

					-- Error occurred
					check is_error: an_iterator.is_error end
					create an_invalid_item.make (l_error_value)
					create last_mapped_item.make_item (an_invalid_item)
				else
					create last_mapped_item.make_sequence (an_iterator)
				end
			end
		end

	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Map `an_item' to a sequence
		local
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
			l_last_node_iterator: like last_node_iterator
		do
			step.create_iterator (a_context)
			check postcondition_of_create_iterator: attached step.last_iterator as l_last_iterator then
				if l_last_iterator.is_singleton_iterator then
					a_singleton_iterator := l_last_iterator.as_singleton_iterator
					a_singleton_iterator.start
					if a_singleton_iterator.after then
						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
					else
						check
							single_node: a_singleton_iterator.item.is_node
						end
						create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (a_singleton_iterator.item.as_node)
					end
				else
					if attached l_last_iterator.error_value as l_error_value then
						check is_error: l_last_iterator.is_error end
						create {XM_XPATH_SINGLETON_NODE_ITERATOR} l_last_node_iterator.make (Void)
						l_last_node_iterator.set_last_error (l_error_value)
						last_node_iterator := l_last_node_iterator
					else
						check
							node_iterator: l_last_iterator.is_node_iterator
							-- from `create_iterator'
						end
						last_node_iterator := l_last_iterator.as_node_iterator
					end
				end
			end
			check
				result_is_node_iterator: last_node_iterator /= Void
				-- from `create_iterator'
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		local
			c1, c2, c3: INTEGER
		do
			if not start.are_cardinalities_computed then
				check
					start_is_computed: start.is_computed_expression
					-- as it can't be a value
				end
				start.as_computed_expression.compute_cardinality
			end
			if not step.are_cardinalities_computed then
				check
					step_is_computed: step.is_computed_expression
					-- as it can't be a value
				end
				step.as_computed_expression.compute_cardinality
			end
			c1 := start.cardinality
			c2 := step.cardinality
			c3 := multiply_cardinality (c1, c2)
			set_cardinality (c3)
			are_cardinalities_computed := True
		end

feature {XM_XPATH_PATH_EXPRESSION} -- Local

	analysis_state: INTEGER
			-- State of analysis

	Raw_state: INTEGER = 0
	Simplified_state: INTEGER = 1
	Type_checked_state: INTEGER = 2
	Optimized_state: INTEGER = 3

	start: XM_XPATH_EXPRESSION
			-- Starting node-set

	step: XM_XPATH_EXPRESSION
			-- Step from each node in starting node-set

	set_start (a_start: XM_XPATH_EXPRESSION)
			-- Set `start'.
		require
			start_not_void: a_start /= Void
		do
			start := a_start
			adopt_child_expression (start)
		ensure
			start_set: start = a_start
		end

	set_step (a_step: XM_XPATH_EXPRESSION)
			-- Set `start'.
		require
			step_not_void: a_step /= Void
		do
			step := a_step
			adopt_child_expression (step)
		ensure
			step_set: step = a_step
		end

feature {NONE} -- Implementation

	is_filtered_axis_path (exp: XM_XPATH_EXPRESSION): BOOLEAN
			-- Is `exp' an axis step with optional filter predicates?
		require
			expression_not_void: exp /= Void
		local
			a_filter: detachable XM_XPATH_FILTER_EXPRESSION
			an_expression: XM_XPATH_EXPRESSION
		do
			if exp.is_axis_expression then
				Result := True
			else
				from
					an_expression := exp
					if an_expression.is_filter_expression then a_filter := an_expression.as_filter_expression end
				until
					a_filter = Void
				loop
					an_expression := a_filter.base_expression
					if an_expression.is_filter_expression then
						a_filter := an_expression.as_filter_expression
					else
						a_filter := Void
					end
				end
				Result := an_expression.is_axis_expression
			end
		end

	simplify_descendant_path (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Simplify descendant path if possible.
		require
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_start, l_underlying_step: XM_XPATH_EXPRESSION
			l_start_path: XM_XPATH_PATH_EXPRESSION
			l_context_item_expression: XM_XPATH_CONTEXT_ITEM_EXPRESSION
			l_positional_filter: BOOLEAN
			l_mid_axis: XM_XPATH_AXIS_EXPRESSION
		do
			l_start := start
			-- Detect .//x as a special case; this will appear as descendant-or-self::node()/x
			if start.is_axis_expression and then start.as_axis_expression.axis /= Descendant_or_self_axis then
				a_replacement.put (Current)
			else
				if start.is_axis_expression then
					create l_context_item_expression.make
					copy_location_identifier (l_context_item_expression)
					create {XM_XPATH_PATH_EXPRESSION} l_start.make (l_context_item_expression, start.as_axis_expression)
					copy_location_identifier (l_start)
				end
				if not l_start.is_path_expression then
					a_replacement.put (Current)
				else
					l_start_path := l_start.as_path_expression
					if not l_start_path.step.is_axis_expression then
						a_replacement.put (Current)
					else
						l_mid_axis := l_start_path.step.as_axis_expression
						if l_mid_axis.axis /= Descendant_or_self_axis then
							a_replacement.put (Current)
						elseif not (l_mid_axis.node_test = Void or else l_mid_axis.node_test = any_node_test) then
							a_replacement.put (Current)
						else
							from
								l_underlying_step := step
								l_positional_filter := False
							until
								l_positional_filter or not l_underlying_step.is_filter_expression
							loop
								l_positional_filter := l_underlying_step.as_filter_expression.is_positional
								if not l_positional_filter then
									l_underlying_step := l_underlying_step.as_filter_expression.base_expression
								end
							end
							if not l_positional_filter and l_underlying_step.is_axis_expression then
								simplify_non_positional_filter_path (a_replacement, l_underlying_step.as_axis_expression, l_start_path)
							else
								a_replacement.put (Current)
							end
						end
					end
				end
			end
		ensure
			replaced: attached a_replacement.item as l_replacement_item
			possible_path_expression_replacement: l_replacement_item.is_path_expression
		end

	simplify_non_positional_filter_path (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION];
		a_axis: XM_XPATH_AXIS_EXPRESSION; a_path: XM_XPATH_PATH_EXPRESSION)
			-- Simplify descendant path without any positional filters.
		require
			a_axis_not_void: a_axis /= Void
			a_path_not_void: a_path /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
			no_positional_filters: True -- could add a routine for this
		local
			l_new_step: XM_XPATH_COMPUTED_EXPRESSION
			l_filter: detachable XM_XPATH_FILTER_EXPRESSION
			l_path: XM_XPATH_PATH_EXPRESSION
			l_node_kind_test: XM_XPATH_NODE_KIND_TEST
		do
			if a_axis.axis = Child_axis then
				create {XM_XPATH_AXIS_EXPRESSION} l_new_step.make (Descendant_axis, a_axis.node_test)
				copy_location_identifier (l_new_step)
				from
					if step.is_filter_expression then
						l_filter := step.as_filter_expression
					end
				until
					l_filter = Void
				loop
					-- Add any filters to the new expression. We know they aren't
					-- positional, so the order of the filters doesn't matter.
					create {XM_XPATH_FILTER_EXPRESSION} l_new_step.make (l_new_step, l_filter.filter)
					l_filter.copy_location_identifier (l_new_step)
					if l_filter.base_expression.is_filter_expression then
						l_filter := l_filter.base_expression.as_filter_expression
					else
						l_filter := Void
					end
				end
				create l_path.make (a_path.start, l_new_step)
				copy_location_identifier (l_path)
				set_replacement (a_replacement, l_path)
			elseif a_axis.axis = Attribute_axis then
				-- turn the expression a//@b into a/descendant-or-self::*/@b
				create l_node_kind_test.make (Element_node)
				create {XM_XPATH_AXIS_EXPRESSION} l_new_step.make (Descendant_or_self_axis, l_node_kind_test)
				copy_location_identifier (l_new_step)
				create l_path.make (a_path.start, l_new_step)
				create l_path.make (l_path, step)
				copy_location_identifier (l_path)
				set_replacement (a_replacement, l_path)
			else
				a_replacement.put (Current)
			end
		ensure
			replaced: attached a_replacement.item as l_replacement_item
			possible_path_expression_replacement: l_replacement_item.is_path_expression
		end

	compute_special_properties
			-- Compute special properties.
		local
			an_expression: XM_XPATH_COMPUTED_EXPRESSION
			is_start_ordered, is_start_peer: BOOLEAN
			is_step_ordered, is_step_peer: BOOLEAN
		do
			initialize_special_properties

			if not are_cardinalities_computed then compute_cardinality end
			if not start.are_special_properties_computed then
				an_expression := start.as_computed_expression
				an_expression.compute_special_properties
			end
			if not step.are_special_properties_computed then
				an_expression := step.as_computed_expression
				an_expression.compute_special_properties
			end
			is_start_peer := start.peer_nodeset
			is_start_ordered := start.ordered_nodeset
			if not start.cardinality_allows_many then
				is_start_peer := True
				is_start_ordered := True
			end
			is_step_peer := step.peer_nodeset
			is_step_ordered := step.ordered_nodeset
			if not step.cardinality_allows_many then
				is_step_peer := True
				is_step_ordered := True
			end

			if start.context_document_nodeset and then step.context_document_nodeset then
				set_context_document_nodeset
			end
			if start.single_document_nodeset and then step.context_document_nodeset then
				set_single_document_nodeset
			end
			if is_start_peer and then is_step_peer then
				set_peer_nodeset
			end
			if start.subtree_nodeset and then step.subtree_nodeset then
				set_subtree_nodeset
			end

			if is_naturally_sorted (is_start_ordered, is_step_ordered, is_start_peer) then
				set_ordered_nodeset
			end

			if is_naturally_reverse_sorted then
				set_reverse_document_order
			end

			if start.non_creating and then step.non_creating then
				set_non_creating
			end
		end

	is_naturally_sorted (is_start_ordered, is_step_ordered, is_start_peer: BOOLEAN): BOOLEAN
			-- Are nodes guarenteed to be delivered in document order?

			-- This is true if the start nodes are sorted peer nodes
			--  and the step is based on an Axis within the subtree rooted at each node.
			-- It is also true if the start is a singleton node and the axis is sorted.
		require
			start_special_properties_computed: start.are_special_properties_computed
			step_special_properties_computed: step.are_special_properties_computed
		do
			if is_step_ordered then
				if not start.cardinality_allows_many or is_start_ordered then

					-- We know now that both the start and the step are sorted. But this does
					-- not necessarily mean that the combination is sorted

					-- The result is sorted if the start is sorted and the step selects attributes
					-- or namespaces

					if step.attribute_ns_nodeset then
						Result := True
					else

						-- The result is sorted if the start selects "peer nodes" (that is, a node-set in which
						-- no node is an ancestor of another) and the step selects within the subtree rooted
						-- at the context node

						if is_start_peer and step.subtree_nodeset then
							Result := True
						end
					end
				end
			end
		end

	is_naturally_reverse_sorted: BOOLEAN
			-- Are nodes guarenteed to be delivered in reverse document order?

			--  Some examples of expressions that are naturally reverse sorted:
			--     ../@x
			--     ancestor::*[@lang]
			--     ../preceding-sibling::x
			--     $x[1]/preceding-sibling::node()

			-- This information is used to do a simple reversal of the nodes
			-- instead of a full sort, which is significantly cheaper, especially
			-- when using tree models in which comparing
			-- nodes in document order is an expensive operation.
		require
			start_special_properties_computed: start.are_special_properties_computed
			step_special_properties_computed: step.are_special_properties_computed
		do
			if not start.cardinality_allows_many and then step.is_axis_expression then
				Result := not is_forward_axis (step.as_axis_expression.axis)
			end
		end


	simplify_sorting (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Simplify descendant path and sorting.
		require
			context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_path: XM_XPATH_PATH_EXPRESSION
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if step.non_creating then
				-- We don't need the operands to be sorted;
				--  any sorting that's needed will be done at the top level
				create l_replacement.make (Void)
				start.set_unsorted (l_replacement, False)
				check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item then
					if start /= l_replacement_item then
						set_start (l_replacement_item)
					end
				end
				l_replacement.put (Void)
				step.set_unsorted (l_replacement, False)
				check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item then
					if step /= l_replacement_item then
						set_step (l_replacement_item)
					end
				end
				-- Try to simplify descendant expressions such as a//b
				l_replacement.put (Void)
				simplify_descendant_path (l_replacement)
				check postcondition_of_simplify_descendant_path: attached l_replacement.item as l_replacement_item then
					if l_replacement_item /= Current then
						-- Descendant expressions such as a//b were simplified
						l_expression := l_replacement_item
						if not l_expression.is_error then
							check
								path_expression: l_expression.is_path_expression
							end
							l_path := l_expression.as_path_expression
							l_path.check_static_type (a_replacement, a_context, a_context_item_type)
						else
							set_replacement (a_replacement, l_expression)
						end
					end
				end
			end
			if a_replacement.item = Void then
				-- Decide whether the result needs to be wrapped in a sorting
				-- expression to deliver the results in document order
				if not ordered_nodeset then
					if reverse_document_order then
						set_replacement (a_replacement, create {XM_XPATH_REVERSER}.make (Current))
					else
						set_replacement (a_replacement, create {XM_XPATH_DOCUMENT_SORTER}.make (Current))
					end
				else
					a_replacement.put (Current)
				end
			end
		ensure
			simplified_sorted_expression_not_void: a_replacement.item /= Void
		end

	promote_sub_expressions (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote any subexpressions within the step are not dependent on the focus.
			-- This causes them to be evaluated once, outside the path  expression.
		require
			promotion_offer_not_void: a_offer /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			step.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				if step /= l_replacement_item then
					set_step (l_replacement_item)
				end
			end
			reset_static_properties
			if attached a_offer.containing_expression as l_containing_expression and then l_containing_expression /= Current then
				analysis_state := Raw_state -- allow re-analysis
				l_replacement.put (Void)
				l_containing_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					l_expression := l_replacement_item
					l_expression.optimize (a_replacement, a_context, a_context_item_type)
				end
			else
				a_replacement.put (Current)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

invariant

	start_not_void: start /= Void
	step_not_void: step /= Void
	analysis_state: analysis_state >= Raw_state and then analysis_state <= Optimized_state

end



