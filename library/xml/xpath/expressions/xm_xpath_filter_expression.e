indexing

	description:

		"XPath Filter Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FILTER_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			compute_dependencies, compute_special_properties, simplify, promote, sub_expressions, same_expression, iterator
		end

	XM_XPATH_TOKENS
	
	XM_XPATH_EXPRESSION_FACTORY

creation

	make

feature {NONE} -- Initialization

	make (a_start: XM_XPATH_EXPRESSION; a_filter: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			start_not_void: a_start /= Void
			filter_not_void: a_filter /= Void
		local
			a_simplified_filter: XM_XPATH_EXPRESSION
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			are_void: BOOLEAN
		do
			base_expression := a_start
			filter := a_filter

			-- the reason we simplify the filter 
			-- is to ensure that functions like name() are expanded to use the
			-- context node as an implicit argument, before checking its dependencies.

			a_simplified_filter := a_filter.simplify
			if a_filter.is_static_type_error then
				if not a_filter.are_dependencies_computed then
					a_computed_expression ?= a_filter
						check
							computed_expression_not_void: a_computed_expression /= Void
						end
					a_computed_expression.compute_dependencies
				end
				filter_dependencies := a_filter.dependencies
				debug ("XPath expressions")
					std.error.put_string ("Filter failed to simplify. Are dependencies Void? ")
					are_void := filter_dependencies = Void
					std.error.put_string (are_void.out)
					std.error.put_new_line
				end
			else
				if not a_simplified_filter.are_dependencies_computed then
					a_computed_expression ?= a_simplified_filter
						check
							computed_expression_not_void: a_computed_expression /= Void
						end
					a_computed_expression.compute_dependencies
				end
				filter_dependencies := a_simplified_filter.dependencies
				debug ("XPath expressions")
					std.error.put_string ("Filter simplified. Are dependencies Void? ")
					are_void := filter_dependencies = Void
					std.error.put_string (are_void.out)
					std.error.put_new_line
				end
			end
		ensure
			base_expression_set: base_expression = a_start
			filter_set: filter = a_filter
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := base_expression.item_type
		end

	filter: XM_XPATH_EXPRESSION
			-- Filter

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (base_expression, 1)
			Result.put (filter, 2)
		end

feature -- Status report

	is_positional: BOOLEAN is
			-- Is `Current' a positional filter?
		do
			Result := is_positional_filter (filter)
		end

	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (level), "filter []")
			std.error.put_string (a_string)
			std.error.put_new_line
			base_expression.display (level + 1, pool)
			filter.display (level + 1, pool)
		end

	iterator (context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Yields an iterator to iterate over the values of a sequence
		local
			an_item: XM_XPATH_ITEM
			a_value: XM_XPATH_VALUE
			a_number: XM_XPATH_NUMERIC_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_sequence_value: XM_XPATH_SEQUENCE_VALUE
			a_position: INTEGER -- TODO
			finished: BOOLEAN
			a_position_range: XM_XPATH_POSITION_RANGE
			base_iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do

			-- Fast path where both operands are constants

			a_sequence_value ?= base_expression
			an_integer_value ?= filter

			if a_sequence_value /= Void and then an_integer_value /= Void then
				a_position := an_integer_value.value
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} Result.make (a_sequence_value.item (a_position))
			else
				
				-- Get an iterator over the base nodes

				base_iter := base_expression.iterator (context)

				-- Quick exit for an empty sequence

				if base_iter.after then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
				else

					-- Test whether the filter is a constant value

					a_value ?= filter

					if a_value /= Void then
						finished := True
						a_number ?= a_value
						if a_number /= Void then
							if a_number.is_whole_number then
								a_position := a_number.as_integer
								if a_position >= 1 then
									Result := make_item_position_iterator (base_iter, a_position, a_position)
								else

									-- Index is less than one, no items will be selected

									create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
								end
							else

								-- A non-integer value will never be equal to position()
								
								create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
							end
						else

							-- Filter is a constant that we can treat as boolean

							if filter.effective_boolean_value (context) then
								Result := base_iter
							else
								create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
							end
						end
					end
					
					-- Construct the FilterIterator to do the actual filtering

					if not finished then

						-- Test whether the filter is a position range, e.g. [position()>$x]
						-- TODO: handle all such cases with a TailExpression

						a_position_range ?= filter
						if a_position_range /= Void then
							Result := make_item_position_iterator (base_iter, a_position_range.minimum_position, a_position_range.maximum_position)
						elseif filter_is_positional then
							create {XM_XPATH_FILTER_ITERATOR [XM_XPATH_ITEM]} Result.make (base_iter, filter, context)
						else
							create {XM_XPATH_FILTER_ITERATOR [XM_XPATH_ITEM]} Result.make_non_numeric (base_iter, filter, context)
						end
					end
				end
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
			set_dependencies (base_expression.dependencies)

			-- If filter depends upon XSLT context then so does `Current'.
			-- (not all dependencies in the filter expression matter, because the context node,
			-- position, and size are not dependent on the outer context.)

			if filter_dependencies.item (1) then
				set_depends_upon_current_item
			end
			if filter_dependencies.item (6) then
				set_depends_upon_current_group
			end			
		end

	set_base_expression (a_base_expression: XM_XPATH_EXPRESSION) is
			-- Set `base_expression.
		require
			base_expression_not_void: a_base_expression /= Void
		do
			base_expression := a_base_expression
		ensure
			base_expression_set: base_expression = a_base_expression
		end

	set_filter (a_filter: XM_XPATH_EXPRESSION) is
			-- Set `filter'.
		require
			filter_not_void: a_filter /= Void
		do
			filter := a_filter
		ensure
			filter_set: filter = a_filter
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			a_filter: XM_XPATH_FILTER_EXPRESSION
		do
			a_filter ?= other
			if a_filter /= Void then
				Result := base_expression.same_expression (a_filter.base_expression)
					and then filter.same_expression (a_filter.filter)
			end
		end

feature -- Optimization

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression;
			-- The default implementation does nothing.
		local
			result_expression: XM_XPATH_FILTER_EXPRESSION
			empty: XM_XPATH_EMPTY_SEQUENCE
			a_value: XM_XPATH_VALUE
			a_number: XM_XPATH_NUMERIC_VALUE
			last_function: XM_XPATH_LAST
			last_expression: XM_XPATH_IS_LAST_EXPRESSION
		do
			result_expression := clone (Current)
			result_expression.set_base_expression (base_expression.simplify)
			result_expression.set_filter (filter.simplify)

			-- Ignore the filter if `base_expression' is an empty sequence.

			empty ?= result_expression.base_expression
			if empty /= Void then
				Result := empty
			else
				
				-- Check whether the filter is a constant true() or false().

				a_value ?= result_expression.filter
				a_number ?= result_expression.filter

				if a_value /= Void and then a_number = Void then
					if result_expression.filter.effective_boolean_value (Void) then
						Result := result_expression.base_expression
					else
						create {XM_XPATH_EMPTY_SEQUENCE} Result.make
					end
				else

					-- Check whether the filter is [last()].
					-- (note, position()=last() will have already been simplified)

					last_function ?= result_expression.filter
					if last_function /= Void then
						create last_expression.make (True)
						result_expression.set_filter (last_expression)
					end
					Result := result_expression
				end
			end
		end

	analyze (env: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions
		local
			an_expr: XM_XPATH_EXPRESSION
			result_expression, filter1, filter2: XM_XPATH_FILTER_EXPRESSION
			an_integer: XM_XPATH_INTEGER_VALUE
			a_position_range: XM_XPATH_POSITION_RANGE
			a_boolean_filter: XM_XPATH_BOOLEAN_EXPRESSION
			offer: XM_XPATH_PROMOTION_OFFER
			let: XM_XPATH_LET_EXPRESSION
			min, max: INTEGER
			finished, filter_is_positionl: BOOLEAN
		do
			result_expression := clone (Current)
			result_expression.set_base_expression (base_expression.analyze (env))
			if base_expression.is_static_type_error then
				is_static_type_error := True
				set_last_static_type_error (base_expression.last_static_type_error)
			else
			
				--	The filter expression never needs to be sorted.
				
				result_expression.set_filter (filter.analyze (env).unsorted (False))

				if filter.is_static_type_error then
					is_static_type_error := True
					set_last_static_type_error (filter.last_static_type_error)
				else
					
					-- Detect head expressions (E[1]) and tail expressions (E[position()!=1])
					-- and treat them specially.
					
					an_integer ?= result_expression.filter
					if an_integer /= Void and then an_integer.value = 1 then
						create {XM_XPATH_FIRST_ITEM_EXPRESSION} Result.make (result_expression.base_expression)
					else
						a_position_range ?= result_expression.filter
						if a_position_range /= Void then
							min := a_position_range.minimum_position
							max := a_position_range.maximum_position
							if min = 1 and then max = 1 then
								create {XM_XPATH_FIRST_ITEM_EXPRESSION} Result.make (result_expression.base_expression)
								finished := True
							elseif a_position_range.is_maximum_unbounded then
								create {XM_XPATH_TAIL_EXPRESSION} Result.make (result_expression.base_expression, min)
								finished := True
							end
						end
						if not finished then
							
							-- Determine whether the filter might depend on position.
							
							filter_is_positional := is_positional_filter (result_expression.filter)
							
							-- If the filter is positional, try changing f[a and b] to f[a][b] to increase
							-- the chances of finishing early.
							
							a_boolean_filter ?= result_expression.filter
							if filter_is_positional and then a_boolean_filter /= Void and then a_boolean_filter.operator = And_token then
								if is_positional_filter (a_boolean_filter.operands.item (1))
									and then a_boolean_filter.operands.item (2).item_type = Boolean_type
									and then not is_positional_filter (a_boolean_filter.operands.item (2)) then
									create filter1.make (base_expression, a_boolean_filter.operands.item (1))
									create filter2.make (filter1, a_boolean_filter.operands.item (2))
									Result := filter2.analyze (env)
									finished := True
									if filter2.is_static_type_error then
										is_static_type_error := True
										set_last_static_type_error (filter2.last_static_type_error)
									end
								elseif is_positional_filter (a_boolean_filter.operands.item (2))
									and then a_boolean_filter.operands.item (1).item_type = Boolean_type -- TODO - check with Mike
									and then not is_positional_filter (a_boolean_filter.operands.item (1)) then
									create filter1.make (base_expression, a_boolean_filter.operands.item (2))
									create filter2.make (filter1, a_boolean_filter.operands.item (1))
									Result := filter2.analyze (env)
									finished := True
									if filter2.is_static_type_error then
										is_static_type_error := True
										set_last_static_type_error (filter2.last_static_type_error)
									end
								end
							end
							if not finished then

								-- If any subexpressions within the filter are not dependent on the focus,
								-- promote them: this causes them to be evaluated once, outside the filter
								-- expression.

								create offer.make (Focus_independent, Void, result_expression, False, result_expression.base_expression.Context_document_nodeset)
								result_expression.set_filter (result_expression.filter.promote (offer))
								let ?= offer.containing_expression
								if let /= Void then
									an_expr := let.analyze (env)
									if let.is_static_type_error then
										is_static_type_error := True
										set_last_static_type_error (let.last_static_type_error)
									else
										offer.set_containing_expression (an_expr)
									end
								end
								Result := offer.containing_expression
							end
						end
					end
				end
			end
		end

	promote (offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
		local
			result_expression: XM_XPATH_FILTER_EXPRESSION
		do
			result_expression ?= offer.accept (Current)
			if result_expression = Void then
				result_expression := clone (Current)
				if not (offer.action = Unordered and then filter_is_positional) then
					result_expression.set_base_expression (result_expression.promote (offer))
				end

				if offer.action = Inline_variable_references then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					--  them to say we are interested in subexpressions that don't depend on either the
					--  outer context or the inner context.
				
					result_expression.set_filter (result_expression.filter.promote (offer))
				end
			end
			Result := result_expression
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		local
			a_number: XM_XPATH_NUMERIC_VALUE
			a_position_range: XM_XPATH_POSITION_RANGE
			a_last_expression: XM_XPATH_IS_LAST_EXPRESSION
		do
			a_number ?= filter
			if a_number /= Void then
				set_cardinality_optional
			elseif not base_expression.cardinality_allows_many then
				set_cardinality_optional
			else
				a_position_range ?= filter
				if a_position_range /= Void then
					if a_position_range.minimum_position = a_position_range.maximum_position then
					set_cardinality_optional
					else
						a_last_expression ?= filter
						if a_last_expression /= Void then
							set_cardinality_optional
						elseif base_expression.cardinality_allows_one_or_more then
							set_cardinality_zero_or_more
						elseif base_expression.cardinality_exactly_one then
							set_cardinality_optional
						else
							set_cardinality (base_expression.cardinality)
						end
					end
				end
			end
		end

	filter_is_positional: BOOLEAN
			-- `True' if the value of the filter might depend on the context position

	filter_dependencies: ARRAY [BOOLEAN]
			-- Dependencies of the original (but simplifed) filter

	is_positional_filter (an_expr: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `an_expr', when used as a filter, positional?
		require
			expression_not_void: an_expr /= Void
		local
			type: INTEGER
		do
			type := an_expr.item_type
			Result := type = Atomic_type or else type = Any_item
				or else is_sub_type (type, Number_type)
				or else an_expr.depends_upon_position
				or else an_expr.depends_upon_last
		end

	compute_special_properties is
			-- Compute special properties.
		do
			set_special_properties (base_expression.special_properties)
		end

invariant

	base_expression_not_void: base_expression /= Void
	filter_not_void: filter /= Void
	filter_dependencies_not_void: filter_dependencies /= Void

end
