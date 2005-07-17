indexing

	description:

		"XPath Path Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PATH_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, promote, compute_dependencies, compute_special_properties, sub_expressions,
			same_expression, create_iterator, is_repeated_sub_expression, is_path_expression,
			as_path_expression, is_error
		end

	XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_NODE_MAPPING_FUNCTION

	XM_XPATH_ROLE

	XM_XPATH_AXIS

	XM_XPATH_PROMOTION_ACTIONS

create

	make

feature {NONE} -- Initialization

	make (a_start: XM_XPATH_EXPRESSION; a_step: XM_XPATH_EXPRESSION) is
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
		
	is_path_expression: BOOLEAN is
			-- Is `Current' a path expression?
		do
			Result := True
		end

	as_path_expression: XM_XPATH_PATH_EXPRESSION is
			-- `Current' seen as a path expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := step.item_type
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
			Result.put (start, 1)
			Result.put (step, 2)
		end

	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		do
			Result := a_child = step
		end

	first_step: XM_XPATH_EXPRESSION is
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

	remaining_steps: XM_XPATH_EXPRESSION is
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

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
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

	is_error: BOOLEAN is
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

	display (a_level: INTEGER) is
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

	compute_dependencies is
			-- Compute dependencies on context.
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end
			dependencies := BOOLEAN_ARRAY_.cloned_array (start.dependencies)
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

	simplify is
			-- Perform context-independent static optimizations.
		local
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			start.simplify
			if not start.is_error then
				if start.was_expression_replaced then
					set_start (start.replacement_expression)
				end
				step.simplify
				if not step.is_error then
					if step.was_expression_replaced then
						set_step (step.replacement_expression)
					end
					reset_static_properties
					if start.is_empty_sequence then
						
						-- if the start expression is an empty node-set, then the whole path-expression is empty
						
						set_replacement (start.as_empty_sequence)
					else
						
						-- Remove a redundant "." from the path.
						-- Note: we are careful not to do this unless the other operand is naturally sorted.
						-- In other cases, ./E (or E/.) is not a no-op, because it forces sorting.
						
						if start.is_context_item and then step.is_path_expression and then step.as_path_expression.ordered_nodeset then
							set_replacement (step.as_path_expression)
						elseif step.is_context_item and then start.is_path_expression and then start.as_path_expression.ordered_nodeset then
							set_replacement (start.as_path_expression)
						else
								
							-- the expression /.. is sometimes used to represent the empty node-set
							
							if start.is_root_expression and then step.is_parent_node_expression then
								create an_empty_sequence.make
								set_replacement (an_empty_sequence)
							end
						end
					end
				else
					set_last_error (step.error_value)
				end
			else
				set_last_error (start.error_value)
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		local
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_node_sequence: XM_XPATH_SEQUENCE_TYPE
			an_atomic_sequence: XM_XPATH_SEQUENCE_TYPE
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_homogeneous_checker: XM_XPATH_HOMOGENEOUS_ITEM_CHECKER
			an_offer: XM_XPATH_PROMOTION_OFFER
		do
			mark_unreplaced
			create a_type_checker
			start.analyze (a_context)
			if start.was_expression_replaced then
				set_start (start.replacement_expression)
			end
			if start.is_error then
				set_last_error (start.error_value)
			else
				step.analyze (a_context)
				if step.was_expression_replaced then
					set_step (step.replacement_expression)
				end
				if step.is_error then
					set_last_error (step.error_value)
				else

					-- Start must be of type node()*
					
					create a_role.make (Binary_expression_role, "/", 1, Xpath_errors_uri, "XPTY0019")
					create a_node_sequence.make_node_sequence
					a_type_checker.static_type_check (a_context, start, a_node_sequence, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error (a_type_checker.static_type_check_error)
					else
						set_start (a_type_checker.checked_expression)
						create an_offer.make (Focus_independent, Void, Current, False, start.context_document_nodeset)
						promote_sub_expressions (a_context, an_offer)
						if not is_error and then not was_expression_replaced then
							
							-- We distinguish three cases for the step:
							--  either it is known statically to deliver nodes only (a 1.0 path expression),
							--  or it is known statically to deliver atomic values
							--  only, or we don't yet know.
							
							if is_node_item_type (step.item_type) then
								if step.non_creating then
									
									-- We don't need the operands to be sorted;
									--  any sorting that's needed will be done at the top level
									
									start.set_unsorted (False)
									if start.was_expression_replaced then set_start (start.replacement_expression) end
									step.set_unsorted (False)
									if step.was_expression_replaced then set_step (step.replacement_expression) end
									optimize (a_context, an_offer)
								end
							elseif is_atomic_item_type (step.item_type) then
								create another_role.make (Binary_expression_role, "/", 2, Xpath_errors_uri, "XPTY0018")
								create an_atomic_sequence.make_atomic_sequence
								a_type_checker.static_type_check (a_context, step, an_atomic_sequence, False, another_role)
								if a_type_checker.is_static_type_check_error then
									set_last_error (a_type_checker.static_type_check_error)
								else
									set_step (a_type_checker.checked_expression)
								end
							else
								create another_role.make (Binary_expression_role, "/", 2, Xpath_errors_uri, "XPTY0018")
								create a_homogeneous_checker.make (step, another_role)
								set_step (a_homogeneous_checker)
							end
						end
					end
				end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			a_promotion: XM_XPATH_EXPRESSION
		do
			an_offer.accept (Current)
			a_promotion := an_offer.accepted_expression
			if a_promotion /= Void then
				set_replacement (a_promotion)
			else
				start.promote (an_offer)
				if start.was_expression_replaced then set_start (start.replacement_expression) end
				
				if an_offer.action = Inline_variable_references then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					--  them to say we are interested in subexpressions that don't depend on either the
					--  outer context or the inner context.

					step.promote (an_offer)
					if step.was_expression_replaced then set_step (step.replacement_expression) end
					reset_static_properties
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
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
			an_iterator := start.last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			else
				another_context := a_context.new_context
				another_context.set_current_iterator (an_iterator)

				if is_node_item_type (step.item_type) then
					create {XM_XPATH_NODE_MAPPING_ITERATOR} last_iterator.make (an_iterator, Current, another_context)
				else
					create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (an_iterator, Current, another_context)
				end
			end
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_invalid_item: XM_XPATH_INVALID_ITEM
		do
			step.create_iterator (a_context)
			an_iterator := step.last_iterator
			if an_iterator.is_error then
								
				-- Error occured

				create an_invalid_item.make (an_iterator.error_value)
				create last_mapped_item.make_item (an_invalid_item)
			else
				create last_mapped_item.make_sequence (an_iterator)
			end
		end

	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
		do
			step.create_iterator (a_context)
			if step.last_iterator.is_singleton_iterator then
				a_singleton_iterator := step.last_iterator.as_singleton_iterator
				a_singleton_iterator.start
				if a_singleton_iterator.after then
					create {XM_XPATH_EMPTY_ITERATOR} last_node_iterator.make
				else
					check
						single_node: a_singleton_iterator.item.is_node
					end
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (a_singleton_iterator.item.as_node)
				end
			else
				if step.last_iterator.is_error then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (Void)
					last_node_iterator.set_last_error (step.last_iterator.error_value)
				else
					check
						node_iterator: step.last_iterator.is_node_iterator
						-- from `create_iterator'
					end
					last_node_iterator := step.last_iterator.as_node_iterator
				end
			end
			check
				result_is_node_iterator: last_node_iterator /= Void
				-- from `create_iterator'
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	compute_cardinality is
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

	start: XM_XPATH_EXPRESSION
			-- Starting node-set
	
	step: XM_XPATH_EXPRESSION
			-- Step from each node in starting node-set

	set_start (a_start: XM_XPATH_EXPRESSION) is
			-- Set `start'.
		require
			start_not_void: a_start /= Void
		do
			start := a_start
			start.mark_unreplaced
			adopt_child_expression (start)
		ensure
			start_set: start = a_start
			start_not_marked_for_replacement: not start.was_expression_replaced
		end

	set_step (a_step: XM_XPATH_EXPRESSION) is
			-- Set `start'.
		require
			step_not_void: a_step /= Void
		do
			step := a_step
			step.mark_unreplaced
			adopt_child_expression (step)
		ensure
			step_set: step = a_step
			step_not_marked_for_replacement: not step.was_expression_replaced
		end
	
feature {NONE} -- Implementation

	is_filtered_axis_path (exp: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `exp' an axis step with optional filter predicates?
		require
			expression_not_void: exp /= Void
		local
			a_filter: XM_XPATH_FILTER_EXPRESSION
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

	simplified_descendant_path: XM_XPATH_PATH_EXPRESSION is
			-- Simplified descendant path, or `Void' if not possible
		local
			a_context_item_expression: XM_XPATH_CONTEXT_ITEM_EXPRESSION
			a_filter: XM_XPATH_FILTER_EXPRESSION
			any_positional_filter: BOOLEAN
			an_axis: XM_XPATH_AXIS_EXPRESSION
		do

			-- Detect .//x as a special case; this will appear as descendant-or-self::node()/x

			if start.is_axis_expression and then start.as_axis_expression.axis /= Descendant_or_self_axis then
				Result := Void
			else
				if start.is_axis_expression then
					create a_context_item_expression.make
					copy_location_identifier (a_context_item_expression)
					create {XM_XPATH_PATH_EXPRESSION} start.make (a_context_item_expression, start.as_axis_expression)
					copy_location_identifier (start)
				end
				if not start.is_path_expression then
					Result := Void
				elseif not start.as_path_expression.step.is_axis_expression then
					Result := Void
				elseif start.as_path_expression.step.as_axis_expression.axis /= Descendant_or_self_axis then
					Result := Void
				elseif start.as_path_expression.step.as_axis_expression.node_test = Void or else start.as_path_expression.step.as_axis_expression.node_test = any_node_test then
					Result := Void
				else
					from
						an_axis := start.as_path_expression.step.as_axis_expression
						any_positional_filter := False
						if step.is_filter_expression then a_filter := step.as_filter_expression end
					until
						any_positional_filter or else a_filter = Void
					loop
						if a_filter.is_positional then
							Result := Void
							any_positional_filter := True
						else
							if a_filter.base_expression.is_filter_expression then
								a_filter := a_filter.base_expression.as_filter_expression
							else
								a_filter := Void
							end
							if a_filter /= Void and then a_filter.base_expression.is_axis_expression then
								an_axis := a_filter.base_expression.as_axis_expression
							else
								an_axis := Void
							end
						end
					end
					if not any_positional_filter then
						Result := non_positional_filter_path (an_axis)
					end
				end
			end
		ensure
			result_may_be_void: True
		end

	non_positional_filter_path (an_axis: XM_XPATH_AXIS_EXPRESSION): XM_XPATH_PATH_EXPRESSION is
			-- Simplified descendat path without any positional filters
		local
			a_new_step: XM_XPATH_COMPUTED_EXPRESSION
			a_filter: XM_XPATH_FILTER_EXPRESSION
			a_path: XM_XPATH_PATH_EXPRESSION
			a_node_kind_test: XM_XPATH_NODE_KIND_TEST
		do
			if an_axis = Void then
				Result := Void
			elseif an_axis.axis = Child_axis then
				create {XM_XPATH_AXIS_EXPRESSION} a_new_step.make (Descendant_axis, an_axis.node_test)
				copy_location_identifier (a_new_step)
				from
					if step.is_filter_expression then a_filter := step.as_filter_expression end
				until
					a_filter = Void
				loop
					
					-- Add any filters to the new expression. We know they aren't
					-- positional, so the order of the filters doesn't matter.
					
					create {XM_XPATH_FILTER_EXPRESSION} a_new_step.make (a_new_step, a_filter.filter)
					a_filter.copy_location_identifier (a_new_step)
					if a_filter.base_expression.is_filter_expression then
						a_filter := a_filter.base_expression.as_filter_expression
					else
						a_filter := Void
					end
				end
				create a_path.make (a_path.start, a_new_step)
				copy_location_identifier (a_path)
				Result := a_path
			elseif an_axis.axis = Attribute_axis then
				
				-- turn the expression a//@b into a/descendant-or-self::*/@b
				
				create a_node_kind_test.make (Element_node)
				create {XM_XPATH_AXIS_EXPRESSION} a_new_step.make (Descendant_or_self_axis, a_node_kind_test)
				copy_location_identifier (a_new_step)
				create a_path.make (a_path.start, a_new_step)
				create a_path.make (a_path, step)
				copy_location_identifier (a_path)
				Result := a_path
			end
		end

	compute_special_properties is
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
			is_start_peer := start.peer_nodeset; is_start_ordered := start.ordered_nodeset
			if not start.cardinality_allows_many then
				is_start_peer := True; is_start_ordered := True
			end
			is_step_peer := step.peer_nodeset; is_step_ordered := step.ordered_nodeset
			if not step.cardinality_allows_many then
				is_step_peer := True; is_step_ordered := True
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

	is_naturally_sorted (is_start_ordered, is_step_ordered, is_start_peer: BOOLEAN): BOOLEAN is
			-- Are nodes guarenteed to be delivered in document order?

			-- This is true if the start nodes are sorted peer nodes
			--  and the step is based on an Axis within the subtree rooted at each node.
			-- It is also true if the start is a singleton node and the axis is sorted.
		require
			start_special_properties_computed: start.are_special_properties_computed
			step_special_properties_computed: step.are_special_properties_computed
		do
			if is_step_ordered then
				if not start.cardinality_allows_many or else is_start_ordered then
					
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
						
						if is_start_peer and then step.subtree_nodeset then
							Result := True
						end
					end
				end
			end
		end

	is_naturally_reverse_sorted: BOOLEAN is
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

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Perform context-dependent optimizations
		require
			context_not_void: a_context /= Void
			offer_not_void: an_offer /= Void
		local
			a_path: XM_XPATH_PATH_EXPRESSION
			an_expression: XM_XPATH_EXPRESSION
			path_not_void: BOOLEAN
		do
			
			-- Try to simplify descendant expressions such as a//b
			
			a_path := simplified_descendant_path
			path_not_void := a_path /= Void
			if path_not_void then
				
				-- Descendant expressions such as a//b were simplified
				
				a_path.simplify
				if a_path.was_expression_replaced then
					an_expression := a_path.replacement_expression
				else
					an_expression := a_path
				end
				if not an_expression.is_error then
					check
						path_expression: a_path.is_path_expression
					end
					a_path := an_expression.as_path_expression
					a_path.analyze (a_context)
					if a_path.was_expression_replaced then
						set_replacement (a_path.replacement_expression)
					else
						set_replacement (a_path)
					end
				end
			else
				
				-- Decide whether the result needs to be wrapped in a sorting
				-- expression to deliver the results in document order
				
				if an_offer.containing_expression.is_path_expression then
					a_path := an_offer.containing_expression.as_path_expression
					if a_path.was_expression_replaced then
						an_expression := a_path.replacement_expression
					else
						an_expression := a_path
					end
					if a_path.ordered_nodeset and then a_path /= Current then
						set_replacement (an_expression)
					elseif a_path.reverse_document_order then
						create {XM_XPATH_REVERSER} an_expression.make (an_expression)
						set_replacement (an_expression)
					else
						create {XM_XPATH_DOCUMENT_SORTER} an_expression.make (an_expression)
						set_replacement (an_expression)
					end
				elseif an_offer.containing_expression.was_expression_replaced then
					set_replacement (an_offer.containing_expression.replacement_expression)
				else
					set_replacement (an_offer.containing_expression)
				end
			end
		end
	
	promote_sub_expressions (a_context: XM_XPATH_STATIC_CONTEXT; an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote any subexpressions within the step are not dependent on the focus.
			-- This causes them to be evaluated once, outside the path  expression.
		require
			promotion_offer_not_void: an_offer /= Void
		do
			step.promote (an_offer)
			if step.was_expression_replaced then
				set_step (step.replacement_expression)
			end
			if step.is_error then
				set_last_error (step.error_value)
			end
			if not is_error then
				reset_static_properties
				if an_offer.containing_expression /= Current then
					an_offer.containing_expression.analyze (a_context)
					if an_offer.containing_expression.is_error then
						set_last_error (an_offer.containing_expression.error_value)
					elseif an_offer.containing_expression.was_expression_replaced then
						set_replacement (an_offer.containing_expression.replacement_expression)
					else
						set_replacement (an_offer.containing_expression)
					end
				end
			end
		end

invariant

	start_not_void: start /= Void
	step_not_void: step /= Void

end



