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

	XM_XPATH_ERROR_TYPES

	KL_SHARED_STANDARD_FILES

feature -- Access

	parsed_error_value: XM_XPATH_ERROR_VALUE
			-- Error result from last call to make_expression

	parsed_expression: XM_XPATH_EXPRESSION is
			-- Parsed expression
		require
			no_parse_error: not is_parse_error
		do
			Result := internal_parsed_expression
		ensure
			parsed_expression_not_void: Result /= Void
		end

feature -- Status report

	is_parse_error: BOOLEAN
			-- Did a parse error or simplification error occur?

feature -- Creation

	make_expression (an_expression: STRING; a_context: XM_XPATH_STATIC_CONTEXT; a_start, a_terminator: INTEGER) is
			-- Parse an expression;
			-- This performs the basic analysis of the expression against the grammar,
			--  it binds variable references and function calls to variable definitions and
			--  function definitions, and it performs context-independent expression
			--  rewriting for optimization purposes.
		require
			expression_not_void: an_expression /= Void
			context_not_void: a_context /= Void
			strictly_positive_start: a_start > 0
		local
			a_parser: XM_XPATH_EXPRESSION_PARSER
			an_error_type: INTEGER
		do
			is_parse_error := False
			internal_parsed_expression := Void
			create a_parser.make
			a_parser.parse (an_expression, a_context, a_start, a_terminator)
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
				if a_parser.first_parse_error_code = 0 then
					an_error_type := Dynamic_error
				end
				create parsed_error_value.make_from_string (a_parser.first_parse_error, a_parser.first_parse_error_code, an_error_type)
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
			-- TODO
		ensure
			-- result_not_void: Result /= Void
		end

	created_item_position_iterator (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_min, a_max: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- New position iterator;
			--  unless `a_base_sequence' is an array iterator, in which case create a:
			-- New array iterator directly over underlying array.
			-- This optimization is important when doing recursion over a node-set using
			--  repeated calls of $nodes[position()>1]
		require
			base_iterator_not_void: a_base_iterator /= Void
		local
			an_array_iterator: XM_XPATH_ARRAY_ITERATOR [XM_XPATH_ITEM]
		do
			an_array_iterator ?= a_base_iterator
			if an_array_iterator /= Void then
				Result := an_array_iterator.new_slice_iterator (a_min, a_max)
			else
				create {XM_XPATH_POSITION_ITERATOR} Result.make (a_base_iterator, a_min, a_max)
			end
		ensure
			iterator_created: Result /= Void
		end

	created_closure (an_expression: XM_XPATH_EXPRESSION; a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- New `XM_XPATH_CLOSURE' (or sometimes, an `XM_XPATH_SEQUENCE_EXTENT'). 
		require
			expression_not_void: an_expression /= Void
			context_not_void: a_context /= Void
		local
			a_tail_expression: XM_XPATH_TAIL_EXPRESSION
			another_expression: XM_XPATH_EXPRESSION
			a_variable_reference: XM_XPATH_VARIABLE_REFERENCE
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
		do
			-- Treat tail recursion as a special case.

			a_tail_expression ?= an_expression
			if a_tail_expression /= Void then
				another_expression := a_tail_expression.base_expression
				a_variable_reference ?= another_expression
				if a_variable_reference /= Void then
					a_variable_reference.lazily_evaluate (a_context)
					a_sequence_extent ?= a_variable_reference.last_evaluation
					if a_sequence_extent /= Void then
						create {XM_XPATH_SEQUENCE_EXTENT} Result.make_as_view (a_sequence_extent, a_tail_expression.start - 1, a_sequence_extent.count -  a_tail_expression.start +1)
					end
				end
			end
			if Result = Void then
				create {XM_XPATH_CLOSURE} Result.make (an_expression, a_context)
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

