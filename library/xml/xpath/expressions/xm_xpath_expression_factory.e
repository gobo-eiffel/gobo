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

	error_value: XM_XPATH_ERROR_VALUE
			-- Error result from last call to make_expression

feature -- Creation

	make_expression (an_expression: STRING; a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Parse an expression;
			-- This performs the basic analysis of the expression against the grammar,
			--  it binds variable references and function calls to variable definitions and
			--  function definitions, and it performs context-independent expression
			--  rewriting for optimization purposes.
		require
			expression_not_void: an_expression /= Void
			context_not_void: a_context /= Void
		local
			a_parser: XM_XPATH_EXPRESSION_PARSER
			an_expr: XM_XPATH_EXPRESSION
		do
			create a_parser.make
			a_parser.parse (an_expression, a_context)
			if not a_parser.is_parse_error then
				an_expr := a_parser.last_parsed_expression
				debug ("XPath expression factory")
					std.error.put_string ("After parsing:%N%N")
					an_expr.display (1, a_context.name_pool)
					std.error.put_new_line
				end
				Result := an_expr.simplify
				if an_expr.is_error then
					error_value := an_expr.last_error
					Result := Void
					debug ("XPath expression factory")
						std.error.put_string ("Simplification failed!%N")
					end					
				else
					debug ("XPath expression factory")
						std.error.put_string ("After simplication:%N%N")
						Result.display (1, a_context.name_pool)
						std.error.put_new_line
					end					
				end
			else
				create error_value.make_from_string (a_parser.last_parse_error, 3, Static_error)
			end
		ensure
			error_or_expression: Result = Void implies error_value /= Void
		end

	make_treat_expression (a_sequence: XM_XPATH_EXPRESSION; a_sequence_type: XM_XPATH_SEQUENCE_TYPE): XM_XPATH_EXPRESSION is
			-- Create a treat expression
		require
			sequence_not_void: a_sequence /= Void
			sequence_type_not_void: a_sequence_type /= Void
		do
			-- TODO
		ensure
			result_not_void: Result /= Void
		end

	make_item_position_iterator (a_base_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; min, max: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Create a position iterator;
			--  unless `a_base_sequence' is an array iterator, in which case
			--  Create an array iterator directly over underlying array.
			-- This optimization is important when doing recursion over a node-set using
			--  repeated calls of $nodes[position()>1]
		require
			base_sequence_not_void: a_base_sequence /= Void
		do
			-- TODO
		end

	make_closure (an_expression: XM_XPATH_EXPRESSION; a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Create an `XM_XPATH_CLOSURE' (or sometimes, an `XM_XPATH_SEQUENCE_EXTENT'). 
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
					another_expression := a_variable_reference.lazy_evaluation (a_context)
					a_sequence_extent ?= another_expression
					if a_sequence_extent /= Void then
						create {XM_XPATH_SEQUENCE_EXTENT} Result.make_as_view (a_sequence_extent, a_tail_expression.start - 1, a_sequence_extent.count -  a_tail_expression.start +1)
					end
				end
			end
			if Result /= Void then
				create {XM_XPATH_CLOSURE} Result.make (an_expression, a_context)
			end
		ensure
			result_not_void: Result /= Void
		end
end

