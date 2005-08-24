indexing

	description:

		"Factory routines for creating expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EXPRESSION_FACTORY

inherit

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

	XM_XPATH_CARDINALITY

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

feature -- Access

	parsed_error_value: XM_XPATH_ERROR_VALUE
			-- Error result from last call to make_expression

	last_created_closure: XM_XPATH_VALUE
			-- Result from `create_closure' or `create_sequence_extent'

	parsed_expression: XM_XPATH_EXPRESSION is
			-- Parsed expression
		require
			no_parse_error: not is_parse_error
		do
			Result := internal_parsed_expression
		ensure
			parsed_expression_not_replaced: Result /= Void and then not Result.was_expression_replaced
		end

feature -- Status report

	is_parse_error: BOOLEAN
			-- Did a parse error or simplification error occur?

feature -- Creation

	make_expression (an_expression: STRING; a_context: XM_XPATH_STATIC_CONTEXT; a_start, a_terminator, a_line_number: INTEGER; a_system_id: STRING) is
			-- Parse an expression;
			-- This performs the basic analysis of the expression against the grammar,
			--  it binds variable references and function calls to variable definitions and
			--  function definitions, and it performs context-independent expression
			--  rewriting for optimization purposes.
		require
			expression_not_void: an_expression /= Void
			context_not_void: a_context /= Void
			strictly_positive_start: a_start > 0
			nearly_positive_line_number: a_line_number >= -1
			system_id_known: not a_system_id.is_empty
		local
			a_parser: XM_XPATH_EXPRESSION_PARSER
			an_error_type: INTEGER
		do
			is_parse_error := False
			internal_parsed_expression := Void
			create a_parser.make
			a_parser.parse (an_expression, a_context, a_start, a_terminator, a_line_number)
			if not a_parser.is_parse_error then
				internal_parsed_expression := a_parser.last_parsed_expression
				check
					no_error: not internal_parsed_expression.is_error
				end
				debug ("XPath expression factory")
					std.error.put_string ("After parsing:%N%N")
					internal_parsed_expression.display (1)
					std.error.put_new_line
				end
				internal_parsed_expression.simplify
				if internal_parsed_expression.is_error then
					is_parse_error := True
					parsed_error_value := internal_parsed_expression.error_value
					internal_parsed_expression := Void
					debug ("XPath expression factory")
						std.error.put_string ("Simplification failed!%N")
					end
				else
					if internal_parsed_expression.was_expression_replaced then
						internal_parsed_expression := internal_parsed_expression.replacement_expression
					end
					debug ("XPath expression factory")
						std.error.put_string ("After simplication:%N%N")
						internal_parsed_expression.display (1)
						std.error.put_new_line
					end					
				end
			else
				is_parse_error := True
				an_error_type := Static_error
				create parsed_error_value.make_from_string (a_parser.first_parse_error, Xpath_errors_uri, a_parser.first_parse_error_code, an_error_type)
				parsed_error_value.set_location (a_system_id, a_parser.first_parse_error_line_number)
			end
		ensure
			error_or_expression: internal_parsed_expression = Void implies parsed_error_value /= Void
		end

	created_treat_expression (a_sequence: XM_XPATH_EXPRESSION; a_sequence_type: XM_XPATH_SEQUENCE_TYPE): XM_XPATH_EXPRESSION is
			-- New treat expression
		require
			sequence_not_void: a_sequence /= Void
			sequence_type_not_void: a_sequence_type /= Void
		do
			todo ("created_treat_expression", False)
		ensure
			result_not_void: Result /= Void
		end

	created_item_position_iterator (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_min, a_max: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- New position iterator;
			--  unless `a_base_sequence' is an array iterator, in which case create a:
			-- New array iterator directly over underlying array.
			-- This optimization is important when doing recursion over a node-set using
			--  repeated calls of $nodes[position()>1]
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
		do
			if a_base_iterator.is_array_iterator then
				Result := a_base_iterator.as_array_iterator.new_slice_iterator (a_min, a_max)
			else
				create {XM_XPATH_POSITION_ITERATOR} Result.make (a_base_iterator, a_min, a_max)
			end
		ensure
			iterator_created: Result /= Void
		end

	created_node_position_iterator (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_min, a_max: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New position iterator;
			--  unless `a_base_sequence' is an array iterator, in which case create a:
			-- New array iterator directly over underlying array.
			-- This optimization is important when doing recursion over a node-set using
			--  repeated calls of $nodes[position()>1]
		require
			base_iterator_not_void: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
		do
			if a_base_iterator.is_array_iterator then
				Result := a_base_iterator.as_array_iterator.new_slice_iterator (a_min, a_max)
			else
				create {XM_XPATH_POSITION_NODE_ITERATOR} Result.make (a_base_iterator, a_min, a_max)
			end
		ensure
			iterator_created: Result /= Void
		end

	create_closure (an_expression: XM_XPATH_COMPUTED_EXPRESSION; a_context: XM_XPATH_CONTEXT; a_reference_count: INTEGER) is
			-- New `XM_XPATH_CLOSURE' (or sometimes, an `XM_XPATH_SEQUENCE_EXTENT', or others).
		require
			expression_not_void: an_expression /= Void
			context_not_void: a_context /= Void
		local
			a_tail_expression: XM_XPATH_TAIL_EXPRESSION
			a_variable_reference: XM_XPATH_VARIABLE_REFERENCE
			a_value: XM_XPATH_VALUE
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			a_realizable_iterator: XM_XPATH_REALIZABLE_ITERATOR [XM_XPATH_ITEM]
			a_start, an_end: INTEGER
		do
			last_created_closure := Void

			-- Treat tail recursion as a special case.

			if an_expression.is_tail_expression then
				a_tail_expression := an_expression.as_tail_expression
				if a_tail_expression.base_expression.is_variable_reference then
					a_variable_reference := a_tail_expression.base_expression.as_variable_reference
					a_variable_reference.lazily_evaluate (a_context, a_reference_count)
					a_value := a_variable_reference.last_evaluation
					if a_value.is_memo_closure then
						a_value.create_iterator (Void)
						if a_value.last_iterator.is_error then
							create {XM_XPATH_INVALID_VALUE} last_created_closure.make (a_value.last_iterator.error_value)
						else
							a_realizable_iterator := a_value.last_iterator.as_realizable_iterator
							a_realizable_iterator.realize
							a_value := a_realizable_iterator.last_realized_value
						end
					end
					if a_value.is_integer_range then
						a_start := a_value.as_integer_range.minimum + 1
						an_end := a_value.as_integer_range.maximum
						if a_start = an_end then
							create {XM_XPATH_INTEGER_VALUE} last_created_closure.make_from_integer (a_start)
						else
							create {XM_XPATH_INTEGER_RANGE} last_created_closure.make (a_start, an_end)
						end
					elseif a_value.is_sequence_extent then
						a_sequence_extent := a_value.as_sequence_extent
						create {XM_XPATH_SEQUENCE_EXTENT} last_created_closure.make_as_view (a_sequence_extent, a_tail_expression.start, a_sequence_extent.count -  a_tail_expression.start + 1)
					end
				end
			end
			if last_created_closure = Void then
				if a_reference_count /= 1 then
					create {XM_XPATH_MEMO_CLOSURE} last_created_closure.make (an_expression, a_context)
				else
					create {XM_XPATH_CLOSURE} last_created_closure.make (an_expression, a_context)
				end
			end
		ensure
			result_not_void: last_created_closure /= Void
		end

	create_sequence_extent (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Create an extensional value.
		require
			iterator_before: an_iterator /= Void and then not an_iterator.is_error and then an_iterator.before
		local
			a_realizable_iterator: XM_XPATH_REALIZABLE_ITERATOR [XM_XPATH_ITEM]
		do
			if an_iterator.is_realizable_iterator then
				a_realizable_iterator := an_iterator.as_realizable_iterator
				a_realizable_iterator.realize
				last_created_closure := a_realizable_iterator.last_realized_value
			else
				create {XM_XPATH_SEQUENCE_EXTENT} last_created_closure.make (an_iterator)
			end
		ensure
			result_not_void: last_created_closure /= Void
		end

	created_cardinality_checker (a_sequence: XM_XPATH_EXPRESSION; a_requested_cardinality: INTEGER; a_role: XM_XPATH_ROLE_LOCATOR): XM_XPATH_COMPUTED_EXPRESSION is
			-- Cardinality checker of singleton atomizer over `a_sequence'
		require
			underlying_expression_not_void: a_sequence /= Void
			role_locator_not_void: a_role /= void
			valid_cardinality_request: is_valid_required_cardinality (a_requested_cardinality)
		local
			a_base: XM_XPATH_EXPRESSION
		do
			if a_sequence.is_atomizer_expression and then not is_cardinality_allows_many (a_requested_cardinality) then
				a_base := a_sequence.as_atomizer_expression.base_expression
				if a_base.is_computed_expression then
					a_base.as_computed_expression.set_parent (a_sequence.container)
				end
				create {XM_XPATH_SINGLETON_ATOMIZER} Result.make (a_base, a_role, is_cardinality_allows_zero (a_requested_cardinality))
			else
				create {XM_XPATH_CARDINALITY_CHECKER} Result.make (a_sequence, a_requested_cardinality, a_role)
			end
		ensure
			result_not_void: Result /= Void
		end

	created_lazy_expression (an_expression: XM_XPATH_EXPRESSION): XM_XPATH_EXPRESSION is
			-- Possible lazy expression
		require
			expression_not_void: an_expression /= Void
		do
			if an_expression.is_lazy_expression
				or else an_expression.is_value then
				Result := an_expression
			else
				create {XM_XPATH_LAZY_EXPRESSION} Result.make (an_expression.as_computed_expression)
			end
		ensure
			result_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	internal_parsed_expression: XM_XPATH_EXPRESSION
			-- Result of `make_expression'

invariant

	parse_error_implies_no_parsed_expression: is_parse_error implies internal_parsed_expression = Void

end

