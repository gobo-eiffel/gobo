note

	description:

		"XPath Path Expressions consisting of a node set followed by atomic-valued step"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_MAPPED_PATH_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			is_mapped_path_expression, as_mapped_path_expression, compute_special_properties,
			create_iterator, create_node_iterator, promote, compute_dependencies,
			same_expression, sub_expressions
		end

	XM_XPATH_CONTEXT_MAPPING_FUNCTION

	XM_XPATH_NODE_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make (a_start, a_step: like start; a_is_hybrid: BOOLEAN)
			-- Initialize `Current'.
		require
			a_start_not_void: a_start /= Void
			a_step_not_void: a_step /= Void
		do
			step := a_step -- to honour invariant
			set_start (a_start)
			set_step (a_step)
			is_hybrid := a_is_hybrid
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			start_set: start = a_start
			step_set: step = a_step
			is_hybrid_set: is_hybrid = a_is_hybrid
		end

feature -- Access

	start: XM_XPATH_EXPRESSION
			-- Starting node-set

	step: XM_XPATH_EXPRESSION
			-- Step from each node in starting node-set

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

feature -- Comparison

	same_expression (a_other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `a_other' the same expression?
		do
			if a_other.is_mapped_path_expression then
				Result := start.same_expression (a_other.as_mapped_path_expression.start) and then step.same_expression (a_other.as_mapped_path_expression.step)
			end
		end

feature -- Status report

	is_hybrid: BOOLEAN
			-- Is `Current' a potential hybrid of nodes and atomic values?

	is_mapped_path_expression: BOOLEAN
			-- Is `Current' a mapped path expression?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			l_string: STRING
		do
			l_string := STRING_.appended_string (indentation (a_level), "map /")
			std.error.put_string (l_string)
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
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			-- Original path expression has been checked already
			a_replacement.put (Current)
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_offer: XM_XPATH_PROMOTION_OFFER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
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
					--	If any subexpressions within the step are not dependent on the focus,
					--  and if they cannot create new nodes, then promote them:
					-- This causes them to be evaluated once, outside the path expression
					create l_offer.make (Focus_independent, Void, Current, False, start.context_document_nodeset)
					promote_sub_expressions (a_replacement, a_context, a_context_item_type, l_offer)
				end
			end
		end

	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
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

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create iterator over the values of a sequence.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_other_context: XM_XPATH_CONTEXT
			l_last_iterator: like last_iterator
		do
			start.create_iterator (a_context)
			check postcondition_of_create_iterator: attached start.last_iterator as l_start_last_iterator then
				l_iterator := l_start_last_iterator
				if l_iterator.is_error then
					last_iterator := l_iterator
				else
					if a_context.has_push_processing then
						l_other_context := a_context.new_minor_context
					else
						l_other_context := a_context.new_context
					end
					l_other_context.set_current_iterator (l_iterator)

					if is_node_sequence then
						create {XM_XPATH_NODE_MAPPING_ITERATOR} last_iterator.make (l_iterator.as_node_iterator, Current, l_other_context)
					else
						create {XM_XPATH_CONTEXT_MAPPING_ITERATOR} l_last_iterator.make (Current, l_other_context)
						last_iterator := l_last_iterator
						if is_hybrid then
							l_iterator := l_last_iterator.another
							l_iterator.start
							if l_iterator.is_error then
								last_iterator := l_iterator
							elseif l_iterator.after then
								create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
							elseif l_iterator.item.is_atomic_value then
								create {XM_XPATH_ITEM_MAPPING_ITERATOR} last_iterator.make (l_last_iterator, create {XM_XPATH_HOMOGENEOUS_ITEM_CHECKER}.make)
							else
								create {XM_XPATH_NODE_MAPPING_ITERATOR} l_last_iterator.make (l_last_iterator, create {XM_XPATH_HOMOGENEOUS_NODE_CHECKER}.make, l_other_context)
								create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} last_iterator.make (l_last_iterator.as_node_iterator, create {XM_XPATH_GLOBAL_ORDER_COMPARER})
							end
						end
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_other_context: XM_XPATH_CONTEXT
		do
			start.create_node_iterator (a_context)
			check postcondition_of_create_node_iterator: attached start.last_node_iterator as l_last_node_iterator then
				l_iterator := l_last_node_iterator
				if l_iterator.is_error then
					last_node_iterator := l_iterator
				else
					if a_context.has_push_processing then
						l_other_context := a_context.new_minor_context
					else
						l_other_context := a_context.new_context
					end
					l_other_context.set_current_iterator (l_iterator)
					create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (l_iterator, Current, l_other_context)
				end
			end
		end

	map (a_context: XM_XPATH_CONTEXT)
			-- Map `a_context.context_item' to a sequence
		do
			step.create_iterator (a_context)
			last_mapped_sequence := step.last_iterator
		end

	map_nodes (a_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Map `a_item' to a sequence
		do
			step.create_node_iterator (a_context)
			last_node_iterator := step.last_node_iterator
		end

feature {XM_XPATH_PATH_EXPRESSION} -- Local

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

feature -- Conversion

	as_mapped_path_expression: XM_XPATH_MAPPED_PATH_EXPRESSION
			-- `Current' seen as a mapped path expression
		do
			Result := Current
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		local
			c1, c2: INTEGER
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
			set_cardinality (multiply_cardinality (c1, c2))
			are_cardinalities_computed := True
		end

feature {NONE} -- Implementation

	promote_sub_expressions (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE; a_offer: XM_XPATH_PROMOTION_OFFER)
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
					reset_static_properties
				end
			end
			if step.is_error then
				set_replacement (a_replacement, step)
			else
				reset_static_properties
				if a_offer.containing_expression /= Current then
					l_replacement.put (Void)
					check attached a_offer.containing_expression as l_containing_expression then
						l_containing_expression.check_static_type (l_replacement, a_context, a_context_item_type)
						check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
							l_expression := l_replacement_item
							l_replacement.put (Void)
							l_expression.optimize (l_replacement, a_context, a_context_item_type)
							check postcondition_of_optimize: attached l_replacement.item as l_replacement_item2 then
								set_replacement (a_replacement, l_replacement_item2)
							end
						end
					end
				else
					a_replacement.put (Current)
				end
			end
		end

	compute_special_properties
			-- Compute special properties.
		local
			l_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			Precursor

			if not are_cardinalities_computed then compute_cardinality end
			if not start.are_special_properties_computed then
				l_expression := start.as_computed_expression
				l_expression.compute_special_properties
			end
			if not step.are_special_properties_computed then
				l_expression := step.as_computed_expression
				l_expression.compute_special_properties
			end

			if start.non_creating and then step.non_creating then
				set_non_creating
			end
		end

invariant

	start_not_void: start /= Void
	step_not_void: step /= Void

end
