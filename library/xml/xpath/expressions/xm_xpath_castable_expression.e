indexing

	description:

		"XPath castable as Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CASTABLE_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION

	XM_XPATH_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target: XM_XPATH_SEQUENCE_TYPE) is
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

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "castable")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				source.display (a_level + 1, a_pool)
				a_string := STRING_.appended_string (indentation (a_level + 1), "as")
				a_string := STRING_.appended_string (a_string, target_type.conventional_name)
				std.error.put_string (a_string)
				std.error.put_new_line
			end
		end

feature -- Optimization	

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do
			-- TODO
			mark_unreplaced
			todo ("analyze", False)
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			todo ("compute-cardinality", False)
			-- TODO
		end
	
	source: XM_XPATH_EXPRESSION
			-- Castable expression 
	
	target_type: XM_XPATH_ITEM_TYPE
			-- Target type 
end
