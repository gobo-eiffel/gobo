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
			simplify, promote, compute_dependencies, compute_special_properties, sub_expressions, same_expression
		end

	-- TODO: XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_ROLE

	XM_XPATH_AXIS

	XM_XPATH_TYPE_CHECKER

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
			step_path: XM_XPATH_PATH_EXPRESSION
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

			step_path ?= step
			if step_path /= Void then
				if is_filtered_axis_path (step_path.start) and then is_filtered_axis_path (step_path.start) then
					create {XM_XPATH_PATH_EXPRESSION} start.make (start, step_path.start)
					-- TODO - copy location information
					step := step_path.step
				end
			end
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		local
			step_type: INTEGER
		do
			step_type := step.item_type
			if is_node_type (step_type) then
				Result := step_type
			else

				-- rely on dynamic typing to ensure that it always returns nodes
				
				Result := Any_node
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

feature -- Status report

	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (level), "path /")
			std.error.put_string (a_string)
			std.error.put_new_line
			start.display (level + 1, pool)
			step.display (level + 1, pool)
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

feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		local
			sub: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			an_index: INTEGER
			value: BOOLEAN
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end
			create dependencies.make (1, 6)

			dependencies := start.dependencies
			if step.Depends_upon_xslt_context then
				dependencies.put (True, 1)
				dependencies.put (True, 6)
			end
			are_dependencies_computed := True
		end
	
feature -- Optimization

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression
		local
			expr1: XM_XPATH_EXPRESSION
			empty_seq: XM_XPATH_EMPTY_SEQUENCE
			context_item: XM_XPATH_CONTEXT_ITEM_EXPRESSION
			root: XM_XPATH_ROOT_EXPRESSION
			parent_step: XM_XPATH_PARENT_NODE_EXPRESSION
			result_expression, step_path, start_path, a_path: XM_XPATH_PATH_EXPRESSION
		do
			result_expression := clone (Current)
			expr1 := start.simplify
			if not start.is_static_type_error then
				result_expression.set_start (expr1)
				expr1 := step.simplify
				if not step.is_static_type_error then
					result_expression.set_step (expr1)
				
					empty_seq ?= result_expression.start
					if empty_seq /= Void then
						
						-- if the start expression is an empty node-set, then the whole path-expression is empty
						
						Result := empty_seq
					else
						
						-- Remove a redundant "." from the path.
						-- Note: we are careful not to do this unless the other operand is naturally sorted.
						-- In other cases, ./E (or E/.) is not a no-op, because it forces sorting.
						
						context_item ?= result_expression.start
						step_path ?= result_expression.step
						if context_item /= Void and then step_path /= Void and then step_path.Ordered_nodeset then
							result_expression := step_path
						else
							context_item ?= result_expression.step
							start_path ?= result_expression.start
							if context_item /= Void and then start_path /= Void and then start_path.Ordered_nodeset then
								result_expression := start_path
							else
								
								-- the expression /.. is sometimes used to represent the empty node-set
								
								root ?= result_expression.start
								parent_step ?= result_expression.step
								if root /= Void and then parent_step /= Void then
									create {XM_XPATH_EMPTY_SEQUENCE} Result.make
								end
							end
						end
						if Result = Void then Result := result_expression end
					end
				else
					is_static_type_error := True
					set_last_static_type_error (step.last_static_type_error)
				end
			else
				is_static_type_error := True
				set_last_static_type_error (start.last_static_type_error)
			end
		end

	analyze (env: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions
		local
			expr1, expr2: XM_XPATH_EXPRESSION
			result_expression, a_path: XM_XPATH_PATH_EXPRESSION
			role0, role1: XM_XPATH_ROLE_LOCATOR
			any_node_sequence: XM_XPATH_SEQUENCE_TYPE
			offer: XM_XPATH_PROMOTION_OFFER
			let: XM_XPATH_LET_EXPRESSION
			path_not_void: BOOLEAN
		do
			result_expression := clone (Current)
			expr1 := start.analyze (env)
			if not start.is_static_type_error then
				result_expression.set_start (expr1)
				expr1 := step.analyze (env)
				if not expr1.is_static_type_error then
					result_expression.set_step (expr1)
					
					-- We don't need the operands to be sorted;
					--  any sorting that's needed will be done at the top level
					
					result_expression.set_start (result_expression.start.unsorted (False))
					result_expression.set_step (result_expression.step.unsorted (False))
					
					-- Both operands must be of type node()*
					
					create role0.make (Binary_expression_role, "/", 0)
					create any_node_sequence.make_node_sequence
					result_expression.set_start (static_type_check(result_expression.start, any_node_sequence, False, role0))
					if not is_static_type_check_error then
						create role1.make (Binary_expression_role, "/", 1)
						result_expression.set_step (static_type_check (result_expression.step, any_node_sequence, False, role1))
						if not is_static_type_check_error then
							
							-- Try to simplify expressions such as a//b

							a_path := simplify_descendant_path (result_expression)
							path_not_void := a_path /= Void
							if path_not_void then
								a_path ?= a_path.simplify
								path_not_void := a_path /= Void
								if is_static_type_check_error then
									is_static_type_error := True
									set_last_static_type_error (static_type_check_error_message)
								else
										check
											path_not_void: a_path /= Void
										end
									a_path ?= a_path.analyze (env)
									if is_static_type_check_error then
										is_static_type_error := True
										set_last_static_type_error (static_type_check_error_message)
									else
											check
												path_not_void: a_path /= Void
											end
										Result := a_path
									end
								end
								if path_not_void then

									-- If any subexpressions within the step are not dependent on the focus, promote them:
									-- this causes them to be evaluated once, outside the path  expression.

									create offer.make (Focus_independent, Void, result_expression, False, result_expression.start.Context_document_nodeset)
									expr1 := result_expression.step.promote (offer)
									result_expression.set_step (expr1)
									let ?= offer.containing_expression
									if let /= Void then
										expr2 := let.analyze (env)
										if let.is_static_type_error then
											is_static_type_error := True
											set_last_static_type_error (let.last_static_type_error)
										else
											offer.set_containing_expression (expr2)
										end
										
										-- Decide whether the result needs to be wrapped in a sorting
										-- expression to deliver the results in document order
										
										if not is_static_type_error then
											a_path ?= offer.containing_expression
											if a_path = Void then
												if a_path.Ordered_nodeset then
													Result := a_path
												elseif a_path.Reverse_document_order then
													create {XM_XPATH_REVERSER} Result.make (a_path)
												else
													create {XM_XPATH_DOCUMENT_SORTER} Result.make (a_path)
												end
											else
												Result := offer.containing_expression
											end
										end
									end
								end
							else
								is_static_type_error := True
								set_last_static_type_error (static_type_check_error_message)
							end
						else
							is_static_type_error := True
							set_last_static_type_error (static_type_check_error_message)
						end
					else
						is_static_type_error := True
						set_last_static_type_error (step.last_static_type_error)
					end
				else
					is_static_type_error := True
					set_last_static_type_error (start.last_static_type_error)
				end
			end
		end

	promote (offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
		local
			result_expression: XM_XPATH_PATH_EXPRESSION
		do
			result_expression ?= offer.accept (Current)
			if result_expression = Void then
				result_expression := clone (Current)
				result_expression.set_start (start.promote (offer))
				if offer.action = Inline_variable_references then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					--  them to say we are interested in subexpressions that don't depend on either the
					--  outer context or the inner context.

					result_expression.set_step (step.promote (offer))
				end
			end
			Result := result_expression
		end

feature {XM_XPATH_PATH_EXPRESSION} -- Implementation

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
		ensure
			start_set: start = a_start
		end

	set_step (a_step: XM_XPATH_EXPRESSION) is
			-- Set `start'.
		require
			step_not_void: a_step /= Void
		do
			step := a_step
		ensure
			step_set: step = a_step
		end

feature {XM_XPATH_EXPRESSION} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		local
			c1, c2, c3: INTEGER
			an_expr: XM_XPATH_COMPUTED_EXPRESSION
		do
			if not start.are_cardinalities_computed then
				an_expr ?= start
					check
						start_is_computed: an_expr /= Void
						-- as it can't be a value
					end
				an_expr.compute_cardinality
			end
			if not step.are_cardinalities_computed then
				an_expr ?= step
					check
						step_is_computed: an_expr /= Void
						-- as it can't be a value
					end
				an_expr.compute_cardinality
			end
			c1 := start.cardinality
			c2 := step.cardinality
			c3 := multiply_cardinality (c1, c2)
			set_cardinality (c3)
			are_cardinalities_computed := True
		end
	
feature {NONE} -- Implementation

	is_filtered_axis_path (exp: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `exp' an axis step with optional filter predicates?
		require
			expression_not_void: exp /= Void
		local
			axis: XM_XPATH_AXIS_EXPRESSION
			filter: XM_XPATH_FILTER_EXPRESSION
			expr1: XM_XPATH_EXPRESSION
		do
			axis ?= exp
			if axis /= Void then
				Result := True
			else
				from
					expr1 := exp
					filter ?= expr1
				until
					filter = Void
				loop
					expr1 := filter.base_expression
					filter ?= expr1
				end
				axis ?= expr1
				Result := axis /= Void
			end
		end

	simplify_descendant_path (expr1: XM_XPATH_PATH_EXPRESSION): XM_XPATH_PATH_EXPRESSION is
		local
			st: XM_XPATH_EXPRESSION
			axis: XM_XPATH_AXIS_EXPRESSION
			cie: XM_XPATH_CONTEXT_ITEM_EXPRESSION
			path: XM_XPATH_PATH_EXPRESSION
			test: XM_XPATH_NODE_TEST
			any_node_test: XM_XPATH_ANY_NODE_TEST
			filter: XM_XPATH_FILTER_EXPRESSION
			any_positional_filter: BOOLEAN
			new_step: XM_XPATH_COMPUTED_EXPRESSION
			node_kind_test: XM_XPATH_NODE_KIND_TEST
		do
			st := expr1.start

			-- Detect .//x as a special case; this will appear as descendant-or-self::node()/x

			axis ?= st
			if axis /= Void and then axis.axis /= Descendant_or_self_axis then
			else
				if axis /= Void then
					create cie.make -- TODO copy location information
					create {XM_XPATH_PATH_EXPRESSION} st.make (cie, axis)	-- TODO copy location information
				end
				path ?= st
				if path = Void then
					Result := Void
				else
					axis ?= path.step
					if axis = Void then
						Result := Void
					elseif axis.axis /= Descendant_or_self_axis then
						Result := Void
					else
						test ?= axis
						any_node_test ?= axis
						if test = Void or else any_node_test /= Void then
							Result := Void
						else
							from
								any_positional_filter := False
								filter ?= expr1.step
							until
								any_positional_filter or else filter = Void
							loop
								if filter.is_positional then
									Result := Void
									any_positional_filter := True
								else
									filter ?= filter.base_expression
									axis ?= filter.base_expression
								end
							end
							if not any_positional_filter then
								if axis = Void then
									Result := Void
								else
									if axis.axis = Child_axis then
										create {XM_XPATH_AXIS_EXPRESSION} new_step.make (Descendant_axis, axis.node_test )	-- TODO copy location information
										from
											filter ?= expr1.step
										until
											filter = Void
										loop

											-- Add any filters to the new expression. We know they aren't
											-- positional, so the order of the filters doesn't matter.

											create {XM_XPATH_FILTER_EXPRESSION} new_step.make (new_step, filter.filter)	-- TODO copy location information
											filter ?= filter.base_expression
										end
										create path.make (path.start, new_step)	-- TODO copy location information
										Result := path
									elseif axis.axis = Attribute_axis then

										-- turn the expression a//@b into a/descendant-or-self::*/@b

										create node_kind_test.make (Element_node)
										create {XM_XPATH_AXIS_EXPRESSION} new_step.make (Descendant_or_self_axis, node_kind_test )	-- TODO copy location information
										create path.make (path.start, new_step)
										create path.make (path, expr1.step)	-- TODO copy location information
										Result := path
									end
								end
							end
						end
					end
				end
			end
		end

	compute_special_properties is
			-- Compute special properties.
		local
			an_expr: XM_XPATH_COMPUTED_EXPRESSION
		do
			create special_properties.make (1, 6)

			-- All `False' by default

			if not are_cardinalities_computed then compute_cardinality end
			if not start.are_special_properties_computed then
				an_expr ?= start
					check
						start_is_computed: an_expr /= Void
						-- as it can't be a value
					end
				an_expr.compute_special_properties
			end
			if not step.are_special_properties_computed then
				an_expr ?= step
					check
						step_is_computed: an_expr /= Void
						-- as it can't be a value
					end
				an_expr.compute_special_properties
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

			are_special_properties_computed := True
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
			if start.Ordered_nodeset and then step.Ordered_nodeset then

				-- We know now that both the start and the step are sorted. But this does
				-- not necessarily mean that the combination is sorted

				-- The result is sorted if the start is sorted and the step selects attributes
				-- or namespaces
					
				if step.Attribute_ns_nodeset then
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
				if start /= void then
					if is_forward_axis (an_axis.axis) then
						Result := False
					else
						an_attribute_reference ?= step
						Result := an_attribute_reference /= Void
					end
				end
			end
		end

invariant

	start_not_void: start /= Void
	step_not_void: step /= Void

end
