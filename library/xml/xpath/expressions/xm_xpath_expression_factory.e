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

	KL_SHARED_STANDARD_FILES

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
				if an_expr.is_static_type_error then
					-- TODO
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
				std.error.put_string (a_parser.last_parse_error)
				std.error.put_new_line
				-- TODO - above should be an XM_XPATH_ERROR_EXPRESSION??
			end
		ensure
			dont_know_yet: True
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

end

