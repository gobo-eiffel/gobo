note

	description:

		"XPath Filter Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_FILTER_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			compute_dependencies, compute_special_properties, simplify, promote, sub_expressions,
			same_expression, create_iterator, is_repeated_sub_expression, is_filter_expression,
			as_filter_expression, create_node_iterator
		end

	XM_XPATH_TOKENS
		export {NONE} all end

	XM_XPATH_SHARED_EXPRESSION_FACTORY
		export {NONE} all end

	XM_XPATH_NAME_UTILITIES
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

	MA_DECIMAL_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_start: XM_XPATH_EXPRESSION; a_filter: XM_XPATH_EXPRESSION)
			-- Establish invariant.
		require
			start_not_void: a_start /= Void
			filter_not_void: a_filter /= Void
		do
			base_expression := a_start
			filter := a_filter
			compute_static_properties
			adopt_child_expression (base_expression)
			adopt_child_expression (filter)
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_start
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			--Determine the data type of the expression, if possible
		do
			Result := base_expression.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	filter: XM_XPATH_EXPRESSION
			-- Filter

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression

	is_filter_expression: BOOLEAN
			-- Is `Current' a filter expression?
		do
			Result := True
		end

	as_filter_expression: XM_XPATH_FILTER_EXPRESSION
			-- `Current' seen as a filter expression
		do
			Result := Current
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (base_expression, 1)
			Result.put (filter, 2)
		end


	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		do
			Result := a_child = filter
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		local
			a_filter: XM_XPATH_FILTER_EXPRESSION
		do
			if other.is_filter_expression then
				a_filter := other.as_filter_expression
				Result := base_expression.same_expression (a_filter.base_expression)
					and then filter.same_expression (a_filter.filter)
			end
		end

feature -- Status report

	is_positional: BOOLEAN
			-- Is `Current' a positional filter?
		do
			Result := is_positional_filter (filter)
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "filter []")
			std.error.put_string (a_string)
			std.error.put_new_line
			base_expression.display (a_level + 1)
			filter.display (a_level + 1)
		end


feature -- Status setting

	compute_dependencies
			-- Compute dependencies on context.
		do
			if not are_intrinsic_dependencies_computed then
				compute_intrinsic_dependencies
			end
			if not base_expression.are_dependencies_computed then
				if base_expression.is_computed_expression then
					base_expression.as_computed_expression.compute_dependencies
				end
			end
			set_dependencies (base_expression)

			-- If filter depends upon XSLT context then so does `Current'.
			-- (not all dependencies in the filter expression matter, because the context node,
			-- position, and size are not dependent on the outer context.)

			if filter.depends_upon_current_item then
				set_depends_upon_current_item
			end
			if filter.depends_upon_current_group then
				set_depends_upon_current_group
			end
			if filter.depends_upon_regexp_group then
				set_depends_upon_regexp_group
			end
			if filter.depends_upon_user_functions then
				set_depends_upon_user_functions
			end
			if filter.depends_upon_local_variables then
				set_depends_upon_local_variables
			end
			are_dependencies_computed := True
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		local
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_is_last_expression: XM_XPATH_IS_LAST_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					set_replacement (a_replacement, l_replacement_item)
				else
					set_base_expression (l_replacement_item)
					l_replacement.put (Void)
					filter.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_replacement_item2 then
						if l_replacement_item2.is_error then
							set_replacement (a_replacement, l_replacement_item2)
						else
							set_filter (l_replacement_item2)

							-- Ignore the filter if `base_expression' is an empty sequence.

							if base_expression.is_empty_sequence then
								set_replacement (a_replacement, base_expression.as_empty_sequence)
							else

								-- Check whether the filter is a constant true() or false().

								if filter.is_value and then not filter.depends_upon_implicit_timezone
									and then not filter.is_numeric_value then
									-- TODO: need a compile-time context
									filter.calculate_effective_boolean_value (new_dummy_context)
									check postcondition_of_calculate_effective_boolean_value: attached filter.last_boolean_value as l_last_boolean_value then
										l_boolean_value := l_last_boolean_value
										if l_boolean_value.is_error then
											set_replacement (a_replacement, l_boolean_value)
										elseif l_boolean_value.value then
											set_replacement (a_replacement, base_expression)
										else
											set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
										end
									end
								else

									-- Check whether the filter is [last()].
									-- (note, position()=last() is handled elsewhere)

									if filter.is_last_function then
										create l_is_last_expression.make (True)
										set_filter (l_is_last_expression)
									end
									a_replacement.put (Current)
								end
							end
						end
					end
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_position_range: XM_XPATH_POSITION_RANGE
			l_min, l_max: INTEGER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				set_base_expression (l_replacement_item)
				if base_expression.is_error then
					set_replacement(a_replacement, base_expression)
				else
					l_replacement.put (Void)
					filter.check_static_type (l_replacement, a_context, base_expression.item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item2 then
						set_filter (l_replacement_item2)
						if filter.is_error then
							set_replacement (a_replacement, filter)
						else
							--	The filter expression usually need not be sorted.
							l_replacement.put (Void)
							filter.set_unsorted_if_homogeneous (l_replacement, False)
							check postcondition_of_set_unsorted_if_homogeneous: attached l_replacement.item as l_replacement_item3 then
								set_filter (l_replacement_item3)
								-- Treat head expressions (E[1]) as a special case
								if is_constant_one (filter) then
									set_replacement (a_replacement, create {XM_XPATH_FIRST_ITEM_EXPRESSION}.make (base_expression))
								else
									-- TODO: can check for other literals
									-- Treat other numeric predicates and tail expressions as a special case
									if filter.is_position_range then
										l_position_range := filter.as_position_range
										l_min := l_position_range.minimum_position
										l_max := l_position_range.maximum_position
										if l_min = 1 and then l_max = 1 then
											set_replacement (a_replacement, create {XM_XPATH_FIRST_ITEM_EXPRESSION}.make (base_expression))
										elseif l_max = Platform.Maximum_integer then
											set_replacement (a_replacement, create {XM_XPATH_TAIL_EXPRESSION}.make (base_expression, l_min))
										end
									end
								end
								if a_replacement.item = Void then
									filter_is_positional := is_positional_filter (filter)
									is_singleton_boolean_filter := filter.cardinality_exactly_one and filter.item_type.is_same_type (type_factory.boolean_type)
									reset_static_properties
									a_replacement.put (Current)
								end
							end
						end
					end
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_position_range: XM_XPATH_POSITION_RANGE
			l_min, l_max: INTEGER
		do
			create l_replacement.make (Void)
			base_expression.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				set_base_expression (l_replacement_item)
				if base_expression.is_error then
					set_replacement(a_replacement, base_expression)
				else
					l_replacement.put (Void)
					filter.optimize (l_replacement, a_context, base_expression.item_type)
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item2 then
						set_filter (l_replacement_item2)
						if filter.is_error then
							set_replacement (a_replacement, filter)
						else
							--	The filter expression usually need not be sorted.
							l_replacement.put (Void)
							filter.set_unsorted_if_homogeneous (l_replacement, False)
							check postcondition_of_set_unsorted_if_homogeneous: attached l_replacement.item as l_replacement_item3 then
								set_filter (l_replacement_item3)
								-- Detect head expressions (E[1]) and tail expressions (E[position()!=1])
								-- and treat them specially.
								if is_constant_one (filter) then
									set_replacement (a_replacement, create {XM_XPATH_FIRST_ITEM_EXPRESSION}.make (base_expression))
								else
									if filter.is_position_range then
										l_position_range := filter.as_position_range
										l_min := l_position_range.minimum_position
										l_max := l_position_range.maximum_position
										if l_min = 1 and then l_max = 1 then
											set_replacement (a_replacement, create {XM_XPATH_FIRST_ITEM_EXPRESSION}.make (base_expression))
										elseif l_max = Platform.Maximum_integer then
											set_replacement (a_replacement, create {XM_XPATH_TAIL_EXPRESSION}.make (base_expression, l_min))
										end
									end
								end
								if a_replacement.item = Void then
									optimize_positional_filter (a_replacement, a_context, a_context_item_type)
								end
								if a_replacement.item = Current then
									a_replacement.put (Void)
									promote_sub_expressions (a_replacement, a_context, a_context_item_type)
								end
							end
						end
					end
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
				create l_replacement.make (Void)
				if not (a_offer.action = Unordered and then filter_is_positional) then
					base_expression.promote (l_replacement, a_offer)
					check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
						if base_expression /= l_replacement_item then
							set_base_expression (l_replacement_item)
							reset_static_properties
						end
					end
				end
				if a_offer.action = Inline_variable_references
					or a_offer.action = Replace_current then
					-- Don't pass on other requests. We could pass them on, but only after augmenting
					--  them to say we are interested in subexpressions that don't depend on either the
					--  outer context or the inner context.
					l_replacement.put (Void)
					filter.promote (l_replacement, a_offer)
					check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
						if filter /= l_replacement_item then
							set_filter (l_replacement_item)
							reset_static_properties
						end
					end
				end
				a_replacement.put (Current)
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over the values of a sequence
		local
			l_position_range: XM_XPATH_POSITION_RANGE
			l_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_filter_iterator: XM_XPATH_FILTER_ITERATOR
			l_node_filter_iterator: XM_XPATH_NODE_FILTER_ITERATOR
			l_start_expression: like start_expression
		do
			last_iterator := Void
			l_start_expression := base_expression
			start_expression := l_start_expression
			create_fast_path_iterator (a_context) -- may alter `start_expression'
			if last_iterator = Void then

				-- Get an iterator over the base nodes

				l_start_expression.create_iterator (a_context)
				check postcondition_of_create_iterator: attached l_start_expression.last_iterator as l_last_iterator then
					l_base_iterator := l_last_iterator

					-- Quick exit for an empty sequence

					if  l_base_iterator.is_error then
						last_iterator := l_base_iterator
					else
						if l_base_iterator.is_empty_iterator then
							last_iterator := l_base_iterator.as_empty_iterator
						else

							-- Test whether the filter is a position range, e.g. [position()>$x]
							-- TODO: handle all such cases with a TailExpression

							if filter.is_position_range then
								l_position_range := filter.as_position_range
								last_iterator := expression_factory.created_position_iterator (l_base_iterator, l_position_range.minimum_position, l_position_range.maximum_position)
							else
								if filter_is_positional then
									if l_base_iterator.is_node_iterator then
										create l_node_filter_iterator.make (l_base_iterator.as_node_iterator, filter, a_context, is_singleton_boolean_filter)
										last_iterator := l_node_filter_iterator
									else
										create l_filter_iterator.make (l_base_iterator, filter, a_context, is_singleton_boolean_filter)
										last_iterator := l_filter_iterator
									end
								else
									if l_base_iterator.is_node_iterator then
										create l_node_filter_iterator.make_non_numeric (l_base_iterator.as_node_iterator, filter, a_context)
										last_iterator := l_node_filter_iterator
									else
										create l_filter_iterator.make_non_numeric (l_base_iterator, filter, a_context)
										last_iterator := l_filter_iterator
									end
								end
							end
						end
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		local
			l_position_range: XM_XPATH_POSITION_RANGE
			l_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_start_expression: like start_expression
		do
			last_node_iterator := Void
			l_start_expression := base_expression
			start_expression := l_start_expression

			-- Get an iterator over the base nodes

			l_start_expression.create_node_iterator (a_context)
			check postcondition_of_create_node_iterator: attached l_start_expression.last_node_iterator as l_last_node_iterator then
				l_base_iterator := l_last_node_iterator

				-- Quick exit for an empty sequence

				if  l_base_iterator.is_error then
					last_node_iterator := l_base_iterator
				else
					if l_base_iterator.is_empty_iterator then
						last_node_iterator := l_base_iterator.as_empty_iterator
					else

						-- Test whether the filter is a position range, e.g. [position()>$x]
						-- TODO: handle all such cases with a TailExpression

						if filter.is_position_range then
							l_position_range := filter.as_position_range
							last_node_iterator := expression_factory.created_position_iterator (l_base_iterator, l_position_range.minimum_position, l_position_range.maximum_position).as_node_iterator
						else
							if filter_is_positional then
								create {XM_XPATH_NODE_FILTER_ITERATOR} last_node_iterator.make (l_base_iterator.as_node_iterator, filter, a_context, is_singleton_boolean_filter)
							else
								create {XM_XPATH_NODE_FILTER_ITERATOR} last_node_iterator.make_non_numeric (l_base_iterator.as_node_iterator, filter, a_context)
							end
						end
					end
				end
			end
		end

feature -- Element change

	set_base_expression (a_base_expression: XM_XPATH_EXPRESSION)
			-- Set `base_expression.
		require
			base_expression_not_void: a_base_expression /= Void
		do
			base_expression := a_base_expression
			adopt_child_expression (base_expression)
		ensure
			base_expression_set: base_expression = a_base_expression
		end

	set_filter (a_filter: XM_XPATH_EXPRESSION)
			-- Set `filter'.
		require
			filter_not_void: a_filter /= Void
		do
			filter := a_filter
			adopt_child_expression (filter)
		ensure
			filter_set: filter = a_filter
		end

feature {NONE} -- Implementation

	start_expression: detachable XM_XPATH_EXPRESSION
			-- Used for communicate between `create_iterator' and `create_fast_path_iterator'

	compute_cardinality
			-- Compute cardinality.
		local
			l_position_range: XM_XPATH_POSITION_RANGE
		do
			-- TODO: we can actually do a slightly wider test:
			if filter.is_numeric_value then
				set_cardinality_optional
			elseif not base_expression.cardinality_allows_many then
				set_cardinality_optional
			else
				if filter.is_position_range then
					l_position_range := filter.as_position_range
					if l_position_range.minimum_position = l_position_range.maximum_position then
						set_cardinality_optional
					end
				end
			end
			if not are_cardinalities_computed then
				if filter.is_last_expression and then filter.as_last_expression.condition then
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

	filter_is_positional: BOOLEAN
			-- `True' if the value of the filter might depend on the context position

	is_singleton_boolean_filter: BOOLEAN
			-- `True' if `filter' returns exactly one boolean

	is_positional_filter (an_expression: XM_XPATH_EXPRESSION): BOOLEAN
			-- Is `an_expression', when used as a filter, positional?
		require
			expression_not_void: an_expression /= Void
		local
			type: XM_XPATH_ITEM_TYPE
		do
			type := an_expression.item_type
			Result := type = type_factory.any_atomic_type or else type = any_item
				or else is_sub_type (type, type_factory.numeric_type)
				or else is_explicitly_positional_filter (an_expression)
		end

	is_explicitly_positional_filter (an_expression: XM_XPATH_EXPRESSION): BOOLEAN
			-- Is `an_expression', explicitly dependant on position() or last()?
		require
			expression_not_void: an_expression /= Void
		do
			Result := an_expression.depends_upon_position
				or else an_expression.depends_upon_last
		end

	force_to_boolean (an_expression: XM_XPATH_EXPRESSION; a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION
			-- A warpping of the boolean() function around `an_expression'.
		require
			expression_not_void: an_expression /= Void
			static_context_not_void: a_context /= Void
		local
			a_function_library: XM_XPATH_FUNCTION_LIBRARY
			args: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			create args.make (1)
			args.put (an_expression, 1)
			a_function_library := a_context.available_functions
			a_function_library.bind_function (Boolean_function_type_code, args, False)
			check postcondition_of_bind_function: attached a_function_library.last_bound_function as l_last_bound_function then
				Result := l_last_bound_function
			end
		end

	compute_special_properties
			-- Compute special properties.
		do
			clone_special_properties (base_expression)
		end


	create_constant_value_iterator (a_number: XM_XPATH_NUMERIC_VALUE; a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM];
											  a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a constant numeric value
		require
			base_iterator_before: a_base_iterator /= void and then not a_base_iterator.is_error and then a_base_iterator.before
		local
			a_position: INTEGER
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			if a_number /= Void then
				if a_number.is_platform_integer then
					a_position := a_number.as_integer
					if a_position >= 1 then
						last_iterator := expression_factory.created_position_iterator (a_base_iterator, a_position, a_position)
					else

						-- Index is less than one, no items will be selected

						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
					end
				else

					-- A non-integer value will never be equal to position()

					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
				end
			else

				-- Filter is a constant that we can treat as boolean

				filter.calculate_effective_boolean_value (a_context)
				check postcondition_of_calculate_effective_boolean_value: attached filter.last_boolean_value as l_last_boolean_value then
					l_boolean_value := l_last_boolean_value
					if attached l_boolean_value.error_value as l_error_value then
						check is_error: l_boolean_value.is_error end
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
					elseif l_boolean_value.value then
						last_iterator := a_base_iterator
					else
						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
					end
				end
			end
		end

	optimize_positional_filter (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Determine whether the filter might depend on position.
		require
			context_not_void: a_context /= Void
			context_item_may_not_be_set: True
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_expression, l_third_expression: XM_XPATH_EXPRESSION
			l_filter, l_other_filter: XM_XPATH_FILTER_EXPRESSION
			l_boolean_filter: XM_XPATH_BOOLEAN_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			filter_is_positional := is_positional_filter (filter)
			is_singleton_boolean_filter := filter.cardinality_exactly_one and filter.item_type.is_same_type (type_factory.boolean_type)

			-- If the filter is positional, try changing f[a and b] to f[a][b] to increase
			-- the chances of finishing early.

			if filter_is_positional and then filter.is_boolean_expression then
				l_boolean_filter := filter.as_boolean_expression
				if l_boolean_filter.operator = And_token then
					if is_explicitly_positional_filter (l_boolean_filter.first_operand)
						and then not is_explicitly_positional_filter (l_boolean_filter.second_operand) then
						l_expression := force_to_boolean (l_boolean_filter.first_operand, a_context)
						l_third_expression := force_to_boolean (l_boolean_filter.second_operand, a_context)
						create l_filter.make (base_expression, l_expression)
						create l_other_filter.make (l_filter, l_third_expression)
						create l_replacement.make (Void)
						l_other_filter.optimize (l_replacement, a_context, a_context_item_type)
						check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
							set_replacement (a_replacement, l_replacement_item)
						end
					elseif is_explicitly_positional_filter (l_boolean_filter.second_operand)
						and then not is_explicitly_positional_filter (l_boolean_filter.first_operand) then
						l_expression := force_to_boolean (l_boolean_filter.first_operand, a_context)
						l_third_expression := force_to_boolean (l_boolean_filter.second_operand, a_context)
						create l_filter.make (base_expression, l_third_expression)
						create l_other_filter.make (l_filter, l_expression)
						create l_replacement.make (Void)
						l_other_filter.optimize (l_replacement, a_context, a_context_item_type)
						check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
							set_replacement (a_replacement, l_replacement_item)
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote_sub_expressions  (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- This causes them to be evaluated once, outside the path  expression.
		require
			not_in_error: not is_error
			context_not_void: a_context /= Void
			context_item_may_not_be_set: True
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_offer: XM_XPATH_PROMOTION_OFFER
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_offer.make (Focus_independent, Void, Current, False, base_expression.context_document_nodeset)
			create l_replacement.make (Void)
			filter.promote (l_replacement, l_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				if filter /= l_replacement_item then
					set_filter(l_replacement_item)
					reset_static_properties
				end
			end
			check attached l_offer.containing_expression as l_containing_expression then
				if l_containing_expression.is_let_expression then
					l_let_expression := l_containing_expression.as_let_expression
					l_replacement.put (Void)
					l_let_expression.check_static_type (l_replacement, a_context, a_context_item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
						if l_let_expression /= l_replacement_item then
							l_offer.set_containing_expression (l_replacement_item)
						elseif not ANY_.same_objects (l_let_expression.action, Current) then
							l_replacement.put (Void)
							l_let_expression.optimize (l_replacement, a_context, a_context_item_type)
							if l_let_expression  /= l_replacement_item then
								l_offer.set_containing_expression (l_replacement_item)
							end
						end
						if attached l_offer.containing_expression as l_containing_expression2 and then l_containing_expression2 /= Current then
							set_replacement (a_replacement, l_containing_expression2)
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

	create_fast_path_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create iterator where both operands are constants, or simple variable references.
		require
			start_expression_not_void: start_expression /= Void
			context_not_void: a_context /= Void
			last_iterator_not_set: last_iterator = Void
		local
			l_position: INTEGER
			l_start_value, l_filter_value: detachable XM_XPATH_VALUE
			l_start_expression: like start_expression
		do
			l_start_expression := start_expression
			check precondition: l_start_expression /= Void then
				if l_start_expression.is_value then
					l_start_value := l_start_expression.as_value
				elseif l_start_expression.is_variable_reference then
					l_start_expression.as_variable_reference.evaluate_variable (a_context)
					l_start_value := l_start_expression.as_variable_reference.last_evaluated_binding
				end
				if l_start_value /= Void then
					l_start_expression := l_start_value
					start_expression := l_start_expression
				end
				if attached l_start_expression.error_value as l_error_value then
					check is_error: l_start_expression.is_error end
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
				elseif l_start_value /= Void and then l_start_value.is_empty_sequence then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
				else
					if filter.is_value then
						l_filter_value := filter.as_value
					elseif filter.is_variable_reference then
						filter.as_variable_reference.evaluate_variable (a_context)
						l_filter_value := filter.as_variable_reference.last_evaluated_binding
					end

					-- Handle the case where the filter is a value. Because of earlier static rewriting, this covers
					--  all cases where the filter expression is independent of the context, that is, where the
					--  value of the filter expression is the same for all items in the sequence being filtered.

					if l_filter_value /= Void then
						l_filter_value.reduce
						l_filter_value := l_filter_value.last_reduced_value
						check postcondition_of_reduce: l_filter_value /= Void then
							if l_filter_value.is_numeric_value then
								if l_filter_value.as_numeric_value.is_whole_number then
									if l_filter_value.as_numeric_value.is_platform_integer then
										l_position := l_filter_value.as_numeric_value.as_integer
										if l_start_value /= Void then
											if l_start_value.is_singleton_node then
												if l_position = 1 then
													create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (l_start_value.as_singleton_node.node)
												else
													create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
												end
											elseif l_position > 0 and then l_position <= l_start_value.count then
												check attached l_start_value.item_at (l_position) as l_item then
													if l_item.is_node then
														create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (l_item.as_node)
													else
														create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (l_item)
													end
												end
											else
												create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
											end
										end
									else
										-- We don't attempt to optimize this case, as yet
									end
								else

									-- a non-integer value will never be equal to position()

									create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
								end
							elseif l_filter_value.is_singleton_node then
								base_expression.create_iterator (a_context)
								last_iterator := base_expression.last_iterator
							else

								-- non-numeric filter value, so we can treat it as a boolean

								l_filter_value.calculate_effective_boolean_value (a_context)
								check postcondition_of_calculate_effective_boolean_value: attached l_filter_value.last_boolean_value as l_last_boolean_value then
									if l_last_boolean_value.value then
										base_expression.create_iterator (a_context)
										last_iterator := base_expression.last_iterator
									else
										create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
									end
								end
							end
						end
					end
				end
			end
		end

	is_constant_one (a_expression: XM_XPATH_EXPRESSION): BOOLEAN
			-- Does `a_expression' represent the constant 1?
		require
			a_expression_not_void: a_expression /= Void
		do
			if a_expression.is_machine_integer_value and then a_expression.as_machine_integer_value.is_platform_integer
				and then a_expression.as_machine_integer_value.value = 1 then
				Result := True
			elseif a_expression.is_integer_value and then a_expression.as_integer_value.is_platform_integer
				and then a_expression.as_integer_value.value.is_equal (one) then
				Result := True
			end
		end

invariant

	base_expression_not_void: base_expression /= Void
	filter_not_void: filter /= Void

end
