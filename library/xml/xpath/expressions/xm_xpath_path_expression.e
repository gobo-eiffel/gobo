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
			simplified_expression, promote, compute_dependencies, compute_special_properties, sub_expressions, same_expression, iterator
		end

	XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_ROLE

	XM_XPATH_AXIS

	XM_XPATH_PROMOTION_ACTIONS

creation

	make

feature {NONE} -- Initialization

	make (a_start: XM_XPATH_EXPRESSION; a_step: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			start_not_void: a_start /= Void
			step_not_void: a_step /= Void
		local
			a_step_path: XM_XPATH_PATH_EXPRESSION
		do
			start := a_start
			step := a_step

			-- If start is a path expression such as a, and step is b/c, then
			--  instead of a/(b/c) we construct (a/b)/c.
			-- This is because it often avoids a sort.

		  -- The "/" operator in XPath 2.0 is not always associative. Problems
		  -- can occur if position() and last() are used on the rhs, or if node-constructors
		  -- appear, e.g. //b/../<d/>. So we only do this rewrite if the step is a path
		  -- expression in which both operands are axis expression optionally with predicates

			a_step_path ?= step
			if a_step_path /= Void then
				if is_filtered_axis_path (a_step_path.start) and then is_filtered_axis_path (a_step_path.start) then
					create {XM_XPATH_PATH_EXPRESSION} start.make (start, a_step_path.start)
					-- TODO - copy location information
					step := a_step_path.step
				end
			end
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		local
			a_step_type: XM_XPATH_ITEM_TYPE
		do
			a_step_type := step.item_type
			if is_node_item_type (a_step_type) then
				Result := a_step_type
			else

				-- rely on dynamic typing to ensure that it always returns nodes
				
				Result := any_node_test
			end
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

	first_step: XM_XPATH_EXPRESSION is
			-- First step of `Current';
			-- A path expression A/B/C is represented as (A/B)/C, but the first step is A
		local
			a_path_expression: XM_XPATH_PATH_EXPRESSION
		do
			a_path_expression ?= start
			if a_path_expression /= Void then
				Result := a_path_expression.first_step
			else
				Result := start
			end
		ensure
			first_step_not_void: Result /= Void
		end

	remaining_steps: XM_XPATH_EXPRESSION is
			-- Remaining steps after `first_step;
			-- This is complicated by the fact that as A/B/C is represented as ((A/B)/C; we are required to return B/C
		local
			a_path_expression: XM_XPATH_PATH_EXPRESSION
		do
			a_path_expression ?= start
			if a_path_expression /= Void then
				create {XM_XPATH_PATH_EXPRESSION} Result.make (a_path_expression.remaining_steps, step)
				-- TODO copy location information
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
			a_path ?= other
			if a_path /= Void then
				Result := start.same_expression (a_path.start) and then step.same_expression (a_path.step)
			end
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "path /")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				start.display (a_level + 1, a_pool)
				step.display (a_level + 1, a_pool)
			end
		end

feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end
			dependencies := clone (start.dependencies)
			if step.depends_upon_xslt_context then
				set_depends_upon_current_item
				set_depends_upon_current_group
			end
			are_dependencies_computed := True
		end
	
feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			an_expression: XM_XPATH_EXPRESSION
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
			a_context_item: XM_XPATH_CONTEXT_ITEM_EXPRESSION
			a_root: XM_XPATH_ROOT_EXPRESSION
			a_parent_step: XM_XPATH_PARENT_NODE_EXPRESSION
			a_result_expression, a_step_path, a_start_path, a_path: XM_XPATH_PATH_EXPRESSION
		do
			a_result_expression := clone (Current)
			an_expression := start.simplified_expression
			if not an_expression.is_error then
				a_result_expression.set_start (an_expression)
				an_expression := step.simplified_expression
				if not an_expression.is_error then
					a_result_expression.set_step (an_expression)
				
					an_empty_sequence ?= a_result_expression.start
					if an_empty_sequence /= Void then
						
						-- if the start expression is an empty node-set, then the whole path-expression is empty
						
						Result := an_empty_sequence
					else
						
						-- Remove a redundant "." from the path.
						-- Note: we are careful not to do this unless the other operand is naturally sorted.
						-- In other cases, ./E (or E/.) is not a no-op, because it forces sorting.
						
						a_context_item ?= a_result_expression.start
						a_step_path ?= a_result_expression.step
						if a_context_item /= Void and then a_step_path /= Void and then a_step_path.ordered_nodeset then
							a_result_expression := a_step_path
						else
							a_context_item ?= a_result_expression.step
							a_start_path ?= a_result_expression.start
							if a_context_item /= Void and then a_start_path /= Void and then a_start_path.ordered_nodeset then
								a_result_expression := a_start_path
							else
								
								-- the expression /.. is sometimes used to represent the empty node-set
								
								a_root ?= a_result_expression.start
								a_parent_step ?= a_result_expression.step
								if a_root /= Void and then a_parent_step /= Void then
									create {XM_XPATH_EMPTY_SEQUENCE} Result.make
								end
							end
						end
						if Result = Void then Result := a_result_expression end
					end
				else
					a_result_expression.set_last_error (an_expression.error_value)
				end
			else
				a_result_expression.set_last_error (an_expression.error_value)
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		local
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_node_sequence: XM_XPATH_SEQUENCE_TYPE
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			mark_unreplaced
			create a_type_checker
			start.analyze (a_context)
			if start.was_expression_replaced then
				set_start (start.replacement_expression)
			end
			if not start.is_error then
				step.analyze (a_context)
				if step.was_expression_replaced then
					set_step (step.replacement_expression)
				end
				if not step.is_error then

					-- We don't need the operands to be sorted;
					--  any sorting that's needed will be done at the top level
					
					start.set_unsorted (False)
					step.set_unsorted (False)

					-- Both operands must be of type node()*

					create a_role.make (Binary_expression_role, "/", 1)
					create a_node_sequence.make_node_sequence
					a_type_checker.static_type_check (a_context, start, a_node_sequence, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
					else
						set_start (a_type_checker.checked_expression)
						create another_role.make (Binary_expression_role, "/", 2)
						a_type_checker.static_type_check (a_context, step, a_node_sequence, False, another_role)
						if a_type_checker.is_static_type_check_error then
							set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
						else
							set_step (a_type_checker.checked_expression)
							optimize (a_context)
						end
					end
				else
					set_last_error (step.error_value)
				end
			else
				set_last_error (start.error_value)
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
				end
			end
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence;
			-- Delivers the result of the path expression in unsorted order,
			--  without removal of duplicates.
			-- If sorting and deduplication are needed,
			--  this is achieved by wrapping the path expression in an XM_XPATH_DOCUMENT_SORTER.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			another_context: XM_XPATH_CONTEXT
		do
			an_iterator := start.iterator (a_context)
			if an_iterator.is_error then
				Result := an_iterator
			else
				another_context := a_context.new_context
				another_context.set_current_iterator (an_iterator)

				create {XM_XPATH_MAPPING_ITERATOR} Result.make (an_iterator, Current, another_context, Void)
			end
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_MAPPED_ITEM is
			-- Map `an_item' to a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_invalid_item: XM_XPATH_INVALID_ITEM
		do
			an_iterator := step.iterator (a_context)
			if an_iterator.is_error then
								
				-- Error occured

				create an_invalid_item.make (step.error_value)
				create Result.make_item (an_invalid_item)
			else
				create Result.make_sequence (an_iterator)
			end
		end
	

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	compute_cardinality is
			-- Compute cardinality.
		local
			c1, c2, c3: INTEGER
			an_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			if not start.are_cardinalities_computed then
				an_expression ?= start
					check
						start_is_computed: an_expression /= Void
						-- as it can't be a value
					end
				an_expression.compute_cardinality
			end
			if not step.are_cardinalities_computed then
				an_expression ?= step
					check
						step_is_computed: an_expression /= Void
						-- as it can't be a value
					end
				an_expression.compute_cardinality
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
			if start.was_expression_replaced then start.mark_unreplaced end
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
			if step.was_expression_replaced then step.mark_unreplaced end
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
			an_axis: XM_XPATH_AXIS_EXPRESSION
			a_filter: XM_XPATH_FILTER_EXPRESSION
			an_expression: XM_XPATH_EXPRESSION
		do
			an_axis ?= exp
			if an_axis /= Void then
				Result := True
			else
				from
					an_expression := exp
					a_filter ?= an_expression
				until
					a_filter = Void
				loop
					an_expression := a_filter.base_expression
					a_filter ?= an_expression
				end
				an_axis ?= an_expression
				Result := an_axis /= Void
			end
		end

	simplified_descendant_path: XM_XPATH_PATH_EXPRESSION is
			-- Simplified descendant path, or `Void' if not possible
		local
			st: XM_XPATH_EXPRESSION
			an_axis: XM_XPATH_AXIS_EXPRESSION
			a_context_item_expression: XM_XPATH_CONTEXT_ITEM_EXPRESSION
			a_path: XM_XPATH_PATH_EXPRESSION
			a_test: XM_XPATH_NODE_TEST
			a_filter: XM_XPATH_FILTER_EXPRESSION
			any_positional_filter: BOOLEAN
		do
			st := start

			-- Detect .//x as a special case; this will appear as descendant-or-self::node()/x

			an_axis ?= st;	if an_axis /= Void and then an_axis.axis /= Descendant_or_self_axis then
				Result := Void
			else
				if an_axis /= Void then
					create a_context_item_expression.make -- TODO copy location information
					create {XM_XPATH_PATH_EXPRESSION} st.make (a_context_item_expression, an_axis)	-- TODO copy location information
				end
				a_path ?= st; if a_path = Void then
					Result := Void
				else
					an_axis ?= a_path.step; if an_axis = Void then
						Result := Void
					elseif an_axis.axis /= Descendant_or_self_axis then
						Result := Void
					else
						a_test := an_axis.node_test
						if a_test = Void or else a_test = any_node_test then
							Result := Void
						else
							from
								any_positional_filter := False
								a_filter ?= step
							until
								any_positional_filter or else a_filter = Void
							loop
								if a_filter.is_positional then
									Result := Void
									any_positional_filter := True
								else
									a_filter ?= a_filter.base_expression
									an_axis ?= a_filter.base_expression
								end
							end
							if not any_positional_filter then
								Result := non_positional_filter_path (an_axis)
							end
						end
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
				create {XM_XPATH_AXIS_EXPRESSION} a_new_step.make (Descendant_axis, an_axis.node_test )	-- TODO copy location information
				from
					a_filter ?= step
				until
					a_filter = Void
				loop
					
					-- Add any filters to the new expression. We know they aren't
					-- positional, so the order of the filters doesn't matter.
					
					create {XM_XPATH_FILTER_EXPRESSION} a_new_step.make (a_new_step, a_filter.filter)	-- TODO copy location information
					a_filter ?= a_filter.base_expression
				end
				create a_path.make (a_path.start, a_new_step)	-- TODO copy location information
				Result := a_path
			elseif an_axis.axis = Attribute_axis then
				
				-- turn the expression a//@b into a/descendant-or-self::*/@b
				
				create a_node_kind_test.make (Element_node)
				create {XM_XPATH_AXIS_EXPRESSION} a_new_step.make (Descendant_or_self_axis, a_node_kind_test )	-- TODO copy location information
				create a_path.make (a_path.start, a_new_step)
				create a_path.make (a_path, step)	-- TODO copy location information
				Result := a_path
			end
		end

	compute_special_properties is
			-- Compute special properties.
		local
			an_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			create special_properties.make (1, 6)
			are_special_properties_computed := True
			-- All `False' by default

			if not are_cardinalities_computed then compute_cardinality end
			if not start.are_special_properties_computed then
				an_expression ?= start
					check
						start_is_computed: an_expression /= Void
						-- as it can't be a value
					end
				an_expression.compute_special_properties
			end
			if not step.are_special_properties_computed then
				an_expression ?= step
					check
						step_is_computed: an_expression /= Void
						-- as it can't be a value
					end
				an_expression.compute_special_properties
			end
			if not start.cardinality_allows_many then
				start.set_ordered_nodeset
				start.set_peer_nodeset
			end
			if not step.cardinality_allows_many then
				step.set_ordered_nodeset
				step.set_peer_nodeset
			end

			if start.context_document_nodeset and then step.context_document_nodeset then
				set_context_document_nodeset
			end
			if start.peer_nodeset and then step.peer_nodeset then
				set_peer_nodeset
			end
			if start.subtree_nodeset and then step.subtree_nodeset then
				set_subtree_nodeset
			end

			if is_naturally_sorted then
				set_ordered_nodeset
			end

			if is_naturally_reverse_sorted then
				set_reverse_document_order
			end

		end

	is_naturally_sorted: BOOLEAN is
			-- Are nodes guarenteed to be delivered in document order?

			-- This is true if the start nodes are sorted peer nodes
			--  and the step is based on an Axis within the subtree rooted at each node.
			-- It is also true if the start is a singleton node and the axis is sorted.
		require
			start_special_properties_computed: start.are_special_properties_computed
			step_special_properties_computed: step.are_special_properties_computed
		do
			if start.ordered_nodeset and then step.ordered_nodeset then

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

					if start.peer_nodeset and then step.subtree_nodeset then
						Result := True
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
		local
			an_axis: XM_XPATH_AXIS_EXPRESSION
			an_attribute_reference: XM_XPATH_ATTRIBUTE_REFERENCE_EXPRESSION
		do
			an_axis ?= step
			if not start.cardinality_allows_many and then an_axis /= Void then
				Result := not is_forward_axis (an_axis.axis)
			else
				an_axis ?= start
				if an_axis /= Void then
					if is_forward_axis (an_axis.axis) then
						Result := False
					else
						an_attribute_reference ?= step
						Result := an_attribute_reference /= Void
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform context-dependent optimizations
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
				
				an_expression := a_path.simplified_expression
				if not an_expression.is_error then
					a_path ?= an_expression
						check
							path_not_void: a_path /= Void
						end
					a_path.analyze (a_context)
					if a_path.was_expression_replaced then
						set_replacement (a_path.replacement_expression)
					else
						set_replacement (a_path)
					end
				else
					promote_sub_expressions (a_context) -- do_nothing -- TODO See bottom of file for code which needs debugging and reinstating
				end
			end
		end
	
	promote_sub_expressions (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Promote any subexpressions within the step are not dependent on the focus.
			-- This causes them to be evaluated once, outside the path  expression.
		local
			an_expression: XM_XPATH_EXPRESSION
			an_offer: XM_XPATH_PROMOTION_OFFER
			a_let_expression: XM_XPATH_LET_EXPRESSION
			a_path: XM_XPATH_PATH_EXPRESSION
		do
			create an_offer.make (Focus_independent, Void, Current, False, start.context_document_nodeset)
			step.promote (an_offer)
			if step.was_expression_replaced then
				set_step (step.replacement_expression)
			end
			if step.is_error then
				set_last_error (step.error_value)
			end
			if not is_error then
				a_let_expression ?= an_offer.containing_expression; if a_let_expression /= Void then
				a_let_expression.analyze (a_context)
					if a_let_expression.is_error then
						set_last_error (a_let_expression.error_value)
					elseif a_let_expression.was_expression_replaced then
					an_offer.set_containing_expression (a_let_expression.replacement_expression)
					end
				end
			end
			if not is_error then

				-- Decide whether the result needs to be wrapped in a sorting
				-- expression to deliver the results in document order

				a_path ?= an_offer.containing_expression;	if a_path /= Void then
					if a_path.ordered_nodeset then
						set_replacement (a_path)
					elseif a_path.reverse_document_order then
						create {XM_XPATH_REVERSER} an_expression.make (a_path)
						set_replacement (an_expression)
					else
						create {XM_XPATH_DOCUMENT_SORTER} an_expression.make (a_path)
						set_replacement (an_expression)
					end
				else
					set_replacement (an_offer.containing_expression)
				end
			end
		end

invariant

	start_not_void: start /= Void
	step_not_void: step /= Void

end



