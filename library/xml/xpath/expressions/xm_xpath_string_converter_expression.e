indexing

	description:

		"Objects that perform string conversion in XPath 1.0 compatibility mode"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_CONVERTER_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION


creation

	make

feature {NONE} -- Initialization

	make (a_base_expression: XM_XPATH_EXPRESSION) is
			-- TODO
		do
			todo ("make", False)
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed			
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			-- TODO
			todo ("item-type", False)
		end

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression
	
feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "convert to string: ")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				base_expression.display (a_level + 1, a_pool)
			end
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Curent' and its subexpressions
		do
			mark_unreplaced
			-- TODO
			todo ("analyze", False)
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			-- TODO
			todo ("compute-cardinality", False)
		end

end

	
