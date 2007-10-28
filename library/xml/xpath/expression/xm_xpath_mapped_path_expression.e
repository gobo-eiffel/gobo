indexing

	description:

		"XPath Path Expressions consisting of a node set followed by atomic-valued step"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_MAPPED_PATH_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			is_mapped_path_expression, as_mapped_path_expression, is_node_sequence,
			compute_dependencies, compute_special_properties, create_iterator,
			promote, sub_expressions, same_expression
		end

	XM_XPATH_CONTEXT_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make (a_start, a_step: like start; a_hybrid: BOOLEAN) is
			-- Initialize `Current'.
		require
			a_start_not_void: a_start /= Void
			a_start_is_node_sequence: a_start.is_node_sequence
			a_step_not_void: a_step /= Void
		do
			step := a_step -- to avoid breaking invariant
			set_start (a_start)
			set_step (a_step)
			is_hybrid := a_hybrid
			compute_static_properties
		ensure
			start_set: start = a_start
			step_set: step = a_step
			is_hybrid_set: is_hybrid = a_hybrid
		end

feature -- Access

	start: XM_XPATH_EXPRESSION
			-- Initial node-sequence

	step: XM_XPATH_EXPRESSION
			-- Atomic-valued step sequence

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := step.item_type
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (start, 1)
			Result.put (step, 2)
		end

feature -- Comparison

	same_expression (a_other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `a_other' the same expression?
		local
			l_other: like Current
		do
			if a_other.is_mapped_path_expression then
				l_other := a_other.as_mapped_path_expression
				Result := start.same_expression (l_other.start)  and step.same_expression (l_other.step)
			end
		end

feature -- Status report

	is_mapped_path_expression: BOOLEAN is
			-- Is `Current' a mapped path expression?
		do
			Result := True
		end

	is_node_sequence: BOOLEAN is
			-- Is `Current' a sequence of zero or more nodes?
		do
			Result := is_node_item_type (step.item_type)
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			l_string: STRING
		do
			l_string := STRING_.appended_string (indentation (a_level), "map /")
			std.error.put_string (l_string);
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
			are_dependencies_computed := True
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			-- We are relying on `start' and `step' having already been checked
			mark_unreplaced
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_offer: XM_XPATH_PROMOTION_OFFER
		do
			mark_unreplaced
			start.optimize (a_context, a_context_item_type)
			if start.is_error then
				set_last_error (start.error_value)
			elseif start.was_expression_replaced then
				set_start (start.replacement_expression)
			end
			if not is_error then

			end
			step.optimize (a_context, a_context_item_type)
			if step.is_error then
				set_last_error (step.error_value)
			elseif step.was_expression_replaced then
				set_step (step.replacement_expression)
			end
			if not is_error then
				--	If any subexpressions within the step are not dependent on the focus,
				--  and if they cannot create new nodes, then promote them:
				-- This causes them to be evaluated once, outside the path expression
				
				create l_offer.make (Focus_independent, Void, Current, False, start.context_document_nodeset)
				promote_sub_expressions (a_context, a_context_item_type, l_offer)
			end
		end

	promote (l_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			l_promotion: XM_XPATH_EXPRESSION
		do
			l_offer.accept (Current)
			l_promotion := l_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (l_promotion)
			else
				start.promote (l_offer)
				if start.was_expression_replaced then
					set_start (start.replacement_expression)
					reset_static_properties
				end
				
				if l_offer.action = Inline_variable_references
					or l_offer.action = Replace_current then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					--  them to say we are interested in subexpressions that don't depend on either the
					--  outer context or the inner context.

					step.promote (l_offer)
					if step.was_expression_replaced then
						set_step (step.replacement_expression)
						reset_static_properties
					end
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterate over the values of a sequence.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_node_iterator: XM_XPATH_NODE_MAPPING_ITERATOR
			l_context: XM_XPATH_CONTEXT
		do
			start.create_iterator (a_context)
			l_iterator := start.last_iterator
			if l_iterator.is_error then
				last_iterator := l_iterator
			else
				if a_context.has_push_processing then
					l_context := a_context.new_minor_context
				else
					l_context := a_context.new_context
				end
				l_context.set_current_iterator (l_iterator.another)
				create {XM_XPATH_CONTEXT_MAPPING_ITERATOR} l_iterator.make (Current, l_context)
				if is_hybrid then
					l_iterator.start
					if l_iterator.is_error then
						last_iterator := l_iterator
					elseif l_iterator.after then
						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
					elseif l_iterator.item.is_atomic_value then
						create {XM_XPATH_ITEM_MAPPING_ITERATOR} last_iterator.make (l_iterator.another, create {XM_XPATH_HOMOGENEOUS_ITEM_CHECKER}.make)
					else
						create l_node_iterator.make (l_iterator.another, create {XM_XPATH_HOMOGENEOUS_NODE_CHECKER}.make, l_context)
						create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} last_iterator.make (l_node_iterator, create {XM_XPATH_GLOBAL_ORDER_COMPARER})
					end
				else
					last_iterator := l_iterator
				end
			end
		end

	map (a_context: XM_XPATH_CONTEXT) is
			-- Map `a_context.context_item' to a sequence
		do
			step.create_iterator (a_context)
			last_mapped_sequence := step.last_iterator
		end

feature -- Conversion

	as_mapped_path_expression: XM_XPATH_MAPPED_PATH_EXPRESSION is
			-- `Current' seen as a mapped path expression
		do
			Result := Current
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

feature {NONE} -- Implementation

	is_hybrid: BOOLEAN
			-- Is step not known to be free of nodes?

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

	promote_sub_expressions (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE; a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote any subexpressions within the step are not dependent on the focus.
			-- This causes them to be evaluated once, outside the path  expression.
		require
			promotion_offer_not_void: a_offer /= Void
		local
			l_expression: XM_XPATH_EXPRESSION
		do
			step.promote (a_offer)
			if step.was_expression_replaced then
				set_step (step.replacement_expression)
				reset_static_properties
			end
			if step.is_error then
				set_last_error (step.error_value)
			end
			if not is_error then
				reset_static_properties
				if a_offer.containing_expression /= Current then
					a_offer.containing_expression.check_static_type (a_context, a_context_item_type)
					if a_offer.containing_expression.was_expression_replaced then
						l_expression := a_offer.containing_expression.replacement_expression
					else
						l_expression := a_offer.containing_expression
					end
					l_expression.optimize (a_context, a_context_item_type)
					if l_expression.is_error then
						set_last_error (l_expression.error_value)
					else
						if l_expression.was_expression_replaced then
							l_expression := l_expression.replacement_expression
						end
						if l_expression /= Current then set_replacement (l_expression) end
					end
				end
			end
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor

			if start.non_creating and step.non_creating then
				set_non_creating
			end
		end

invariant

	start_not_void: start /= Void
	start_is_node_sequence: start.is_node_sequence
	step_not_void: step /= Void

end
