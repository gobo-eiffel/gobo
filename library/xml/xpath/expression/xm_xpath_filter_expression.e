indexing

	description:

		"XPath Filter Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	make (a_start: XM_XPATH_EXPRESSION; a_filter: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			start_not_void: a_start /= Void
			filter_not_void: a_filter /= Void
		do
			base_expression := a_start
			filter := a_filter

			-- the reason we simplify the filter 
			-- is to ensure that functions like name() are expanded to use the
			-- context node as an implicit argument, before checking its dependencies.

			filter.simplify
			if filter.is_error then
				set_replacement (filter)
			else
				if filter.was_expression_replaced then
					set_filter (filter.replacement_expression)
				end
				if not filter.are_dependencies_computed and then filter.is_computed_expression then
					filter.as_computed_expression.compute_dependencies
				end
				filter_dependencies := filter.dependencies
			end
			compute_static_properties
			adopt_child_expression (base_expression)
			adopt_child_expression (filter)
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_start
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
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

	is_filter_expression: BOOLEAN is
			-- Is `Current' a filter expression?
		do
			Result := True
		end

	as_filter_expression: XM_XPATH_FILTER_EXPRESSION is
			-- `Current' seen as a filter expression
		do
			Result := Current
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (base_expression, 1)
			Result.put (filter, 2)
		end

	
	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		do
			Result := a_child = filter
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
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

	is_positional: BOOLEAN is
			-- Is `Current' a positional filter?
		do
			Result := is_positional_filter (filter)
		end

	display (a_level: INTEGER) is
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

	compute_dependencies is
			-- Compute dependencies on context.
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end

			if not base_expression.are_dependencies_computed then
				if base_expression.is_computed_expression then
					base_expression.as_computed_expression.compute_dependencies
				end
			end
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
			if filter_dependencies.item (7) then
				set_depends_upon_regexp_group
			end
			if filter_dependencies.item (9) then
				set_depends_upon_user_functions
			end
			are_dependencies_computed := True
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		local
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			an_is_last_expression: XM_XPATH_IS_LAST_EXPRESSION
		do
			base_expression.simplify
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if base_expression.was_expression_replaced then
					set_base_expression (base_expression.replacement_expression)
				end
				filter.simplify
				if filter.is_error then
					set_last_error (filter.error_value)
				else
					if filter.was_expression_replaced then
						set_filter (filter.replacement_expression)
					end

					-- Ignore the filter if `base_expression' is an empty sequence.
					
					if base_expression.is_empty_sequence then
						set_replacement (base_expression.as_empty_sequence)
					else
						
						-- Check whether the filter is a constant true() or false().
						
						if filter.is_value and then not filter.depends_upon_implicit_timezone
							and then not filter.is_numeric_value then
							-- TODO: need a compile-time context
							filter.calculate_effective_boolean_value (Void)
							a_boolean_value := filter.last_boolean_value
							if a_boolean_value.is_error then
								set_last_error (a_boolean_value.error_value)
							elseif  a_boolean_value.value then
								set_replacement (base_expression)
							else
								create an_empty_sequence.make
								set_replacement (an_empty_sequence)
							end
						else
							
							-- Check whether the filter is [last()].
							-- (note, position()=last() is handled elsewhere)
							
							if filter.is_last_function then
								create an_is_last_expression.make (True)
								set_filter (an_is_last_expression)
							end
						end
					end
				end
			end
		end

	
	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_expression: XM_XPATH_EXPRESSION
			l_position_range: XM_XPATH_POSITION_RANGE
			l_min, l_max: INTEGER
		do
			mark_unreplaced
			base_expression.check_static_type (a_context, a_context_item_type)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				filter.check_static_type (a_context, base_expression.item_type)
				if filter.was_expression_replaced then
					set_filter (filter.replacement_expression)
				end
				if filter.is_error then
					set_last_error (filter.error_value)
				else
											
					--	The filter expression usually need not be sorted.
					
					filter.set_unsorted_if_homogeneous (False)
					if filter.was_expression_replaced then
						set_filter (filter.replacement_expression)
					end

					-- Treat head expressions (E[1]) as a special case
					
					if is_constant_one (filter) then
						create {XM_XPATH_FIRST_ITEM_EXPRESSION} l_expression.make (base_expression)
						set_replacement (l_expression)
					else
						-- TODO: can check for other literals

					-- Treat other numeric predicates and tail expressions as a special case

						if filter.is_position_range then
							l_position_range := filter.as_position_range
							l_min := l_position_range.minimum_position
							l_max := l_position_range.maximum_position
							if l_min = 1 and then l_max = 1 then
								create {XM_XPATH_FIRST_ITEM_EXPRESSION} l_expression.make (base_expression)
								set_replacement (l_expression)
							elseif l_max = Platform.Maximum_integer then
								create {XM_XPATH_TAIL_EXPRESSION} l_expression.make (base_expression, l_min)
								set_replacement (l_expression)
							end
						end
					end
					if not was_expression_replaced then
						filter_is_positional := is_positional_filter (filter)
						is_singleton_boolean_filter := filter.cardinality_exactly_one and filter.item_type.is_same_type (type_factory.boolean_type)
						reset_static_properties
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_expression: XM_XPATH_EXPRESSION
			l_position_range: XM_XPATH_POSITION_RANGE
			l_min, l_max: INTEGER
		do
			mark_unreplaced
			base_expression.optimize (a_context, a_context_item_type)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				filter.optimize (a_context, base_expression.item_type)
				if filter.was_expression_replaced then
					set_filter (filter.replacement_expression)
				end
				if filter.is_error then
					set_last_error (filter.error_value)
				else
			
					--	The filter expression usually need not be sorted.
					
					filter.set_unsorted_if_homogeneous (False)
					if filter.was_expression_replaced then
						set_filter (filter.replacement_expression)
					end
					
					-- Detect head expressions (E[1]) and tail expressions (E[position()!=1])
					-- and treat them specially.
					
					if is_constant_one (filter) then
						create {XM_XPATH_FIRST_ITEM_EXPRESSION} l_expression.make (base_expression)
						set_replacement (l_expression)
					else
						if filter.is_position_range then
							l_position_range := filter.as_position_range
							l_min := l_position_range.minimum_position
							l_max := l_position_range.maximum_position
							if l_min = 1 and then l_max = 1 then
								create {XM_XPATH_FIRST_ITEM_EXPRESSION} l_expression.make (base_expression)
								set_replacement (l_expression)
							elseif l_max = Platform.Maximum_integer then
								create {XM_XPATH_TAIL_EXPRESSION} l_expression.make (base_expression, l_min)
								set_replacement (l_expression)
							end
						end
					end
					if not was_expression_replaced then
						optimize_positional_filter (a_context, a_context_item_type)
					end
					if not is_error and then not was_expression_replaced then
						promote_sub_expressions (a_context, a_context_item_type)
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
				if not (an_offer.action = Unordered and then filter_is_positional) then
					base_expression.promote (an_offer)
					if base_expression.was_expression_replaced then
						set_base_expression (base_expression.replacement_expression)
						reset_static_properties
					end
				end
				if an_offer.action = Inline_variable_references
				 or an_offer.action = Replace_current then

					-- Don't pass on other requests. We could pass them on, but only after augmenting
					--  them to say we are interested in subexpressions that don't depend on either the
					--  outer context or the inner context.

					filter.promote (an_offer)
					if filter.was_expression_replaced then
						set_filter (filter.replacement_expression)
						reset_static_properties
					end
				end
			end
		end	

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the values of a sequence
		local
			l_position_range: XM_XPATH_POSITION_RANGE
			l_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_filter_iterator: XM_XPATH_FILTER_ITERATOR
			l_node_filter_iterator: XM_XPATH_NODE_FILTER_ITERATOR
		do
			last_iterator := Void
			start_expression := base_expression
			create_fast_path_iterator (a_context) -- may alter `start_expression'
			if last_iterator = Void then
				
				-- Get an iterator over the base nodes

				start_expression.create_iterator (a_context)
				l_base_iterator := start_expression.last_iterator

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

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		local
			l_position_range: XM_XPATH_POSITION_RANGE
			l_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			last_node_iterator := Void
			start_expression := base_expression
				
			-- Get an iterator over the base nodes

			start_expression.create_node_iterator (a_context)
			l_base_iterator := start_expression.last_node_iterator

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

feature -- Element change

	set_base_expression (a_base_expression: XM_XPATH_EXPRESSION) is
			-- Set `base_expression.
		require
			base_expression_not_void: a_base_expression /= Void
		do
			base_expression := a_base_expression
			base_expression.mark_unreplaced
			adopt_child_expression (base_expression)
		ensure
			base_expression_set: base_expression = a_base_expression
			base_expression_not_marked_for_replacement: not base_expression.was_expression_replaced
		end

	set_filter (a_filter: XM_XPATH_EXPRESSION) is
			-- Set `filter'.
		require
			filter_not_void: a_filter /= Void
		do
			filter := a_filter
			filter.mark_unreplaced
			adopt_child_expression (filter)
		ensure
			filter_set: filter = a_filter
			filter_not_marked_for_replacement: not filter.was_expression_replaced
		end

feature {NONE} -- Implementation

	start_expression: XM_XPATH_EXPRESSION
			-- Used for communicate between `create_iterator' and `create_fast_path_iterator'

	compute_cardinality is
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

	filter_dependencies: ARRAY [BOOLEAN]
			-- Dependencies of the original (but simplifed) filter

	is_positional_filter (an_expression: XM_XPATH_EXPRESSION): BOOLEAN is
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

	is_explicitly_positional_filter (an_expression: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `an_expression', explicitly dependant on position() or last()?
		require
			expression_not_void: an_expression /= Void
		do
			Result := an_expression.depends_upon_position
				or else an_expression.depends_upon_last
		end

	force_to_boolean (an_expression: XM_XPATH_EXPRESSION; a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
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
			Result := a_function_library.last_bound_function
		end
	
	compute_special_properties is
			-- Compute special properties.
		do
			set_special_properties (base_expression.special_properties)
		end

	
	create_constant_value_iterator (a_number: XM_XPATH_NUMERIC_VALUE; a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM];
											  a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a constant numeric value
		require
			base_iterator_before: a_base_iterator /= void and then not a_base_iterator.is_error and then a_base_iterator.before
		local
			a_position: INTEGER
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
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
				a_boolean_value := filter.last_boolean_value
				if a_boolean_value.is_error then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (a_boolean_value.error_value)
				elseif a_boolean_value.value then
					last_iterator := a_base_iterator
				else
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
				end
			end
		end

	optimize_positional_filter (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Determine whether the filter might depend on position.
		local
			another_expression, a_third_expression: XM_XPATH_EXPRESSION
			a_filter, another_filter: XM_XPATH_FILTER_EXPRESSION
			a_boolean_filter: XM_XPATH_BOOLEAN_EXPRESSION
		do
			filter_is_positional := is_positional_filter (filter)
			is_singleton_boolean_filter := filter.cardinality_exactly_one and filter.item_type.is_same_type (type_factory.boolean_type)
			
			-- If the filter is positional, try changing f[a and b] to f[a][b] to increase
			-- the chances of finishing early.

			if filter_is_positional and then filter.is_boolean_expression then
				a_boolean_filter := filter.as_boolean_expression
				if a_boolean_filter.operator = And_token then
					if is_explicitly_positional_filter (a_boolean_filter.first_operand)
						and then not is_explicitly_positional_filter (a_boolean_filter.second_operand) then
						another_expression := force_to_boolean (a_boolean_filter.first_operand, a_context)
						a_third_expression := force_to_boolean (a_boolean_filter.second_operand, a_context)
						create a_filter.make (base_expression, another_expression)
						create another_filter.make (a_filter, a_third_expression)
						another_filter.optimize (a_context, a_context_item_type)
						if another_filter.was_expression_replaced then
							set_replacement (another_filter.replacement_expression)
						else
							set_replacement (another_filter)
						end
					elseif is_explicitly_positional_filter (a_boolean_filter.second_operand)
						and then not is_explicitly_positional_filter (a_boolean_filter.first_operand) then
						another_expression := force_to_boolean (a_boolean_filter.first_operand, a_context)
						a_third_expression := force_to_boolean (a_boolean_filter.second_operand, a_context)
						create a_filter.make (base_expression, a_third_expression)
						create another_filter.make (a_filter, another_expression)
						another_filter.optimize (a_context, a_context_item_type)
						if another_filter.was_expression_replaced then
							set_replacement (another_filter.replacement_expression)
						else
							set_replacement (another_filter)
						end
					end
				end
			end
		end

	promote_sub_expressions  (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is				
			-- This causes them to be evaluated once, outside the path  expression.
		require
			not_in_error: not is_error
			not_replaced: not was_expression_replaced
		local
			an_offer: XM_XPATH_PROMOTION_OFFER
			a_let_expression: XM_XPATH_LET_EXPRESSION
		do
			create an_offer.make (Focus_independent, Void, Current, False, base_expression.context_document_nodeset)
			filter.promote (an_offer)
			if filter.was_expression_replaced then
				set_filter(filter.replacement_expression)
				reset_static_properties
			end
			if an_offer.containing_expression.is_let_expression then
				a_let_expression := an_offer.containing_expression.as_let_expression
				a_let_expression.check_static_type (a_context, a_context_item_type) 
				if not a_let_expression.is_error and then not a_let_expression.was_expression_replaced then 
					a_let_expression.optimize (a_context, a_context_item_type)
				end
				if a_let_expression.is_error then
					set_last_error (a_let_expression.error_value)
				elseif a_let_expression.was_expression_replaced then
					an_offer.set_containing_expression (a_let_expression.replacement_expression)
				end
			end
			if not is_error and then an_offer.containing_expression /= Current and then not was_expression_replaced then
				set_replacement (an_offer.containing_expression)
			end
		end


	create_fast_path_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create iterator where both operands are constants, or simple variable references.
		require
			start_expression_not_void: start_expression /= Void
			context_not_void: a_context /= Void
			last_iterator_not_set: last_iterator = Void
		local
			l_position: INTEGER
			l_start_value, l_filter_value: XM_XPATH_VALUE
			l_item: XM_XPATH_ITEM
		do
			if start_expression.is_value then
				l_start_value := start_expression.as_value
			elseif start_expression.is_variable_reference then
				start_expression.as_variable_reference.evaluate_variable (a_context)
				l_start_value := start_expression.as_variable_reference.last_evaluated_binding
			end
			if l_start_value /= Void then
				start_expression := l_start_value
			end
			if start_expression.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (start_expression.error_value)
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
										l_item := l_start_value.item_at (l_position)
										if l_item.is_node then
											create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (l_item.as_node)
										else
											create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (l_item)
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
						if l_filter_value.last_boolean_value.value then
							base_expression.create_iterator (a_context)
							last_iterator := base_expression.last_iterator
						else
							create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
						end
					end
				end
			end
		end

	is_constant_one (a_expression: XM_XPATH_EXPRESSION): BOOLEAN is
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
	filter_dependencies_not_void: filter_dependencies /= Void

end
