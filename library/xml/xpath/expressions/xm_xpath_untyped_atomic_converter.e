indexing

	description:

	"Objects that converts any xdt:untypedAtomic items in a sequence%
	%to a specified type, returning all other items unchanged"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_UNTYPED_ATOMIC_CONVERTER

inherit

	XM_XPATH_COMPUTED_EXPRESSION

	XM_XPATH_MAPPING_FUNCTION

creation

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; a_required_type: INTEGER) is
			-- TODO
		do
			todo ("make", False)
		end

feature -- Access
	
	item_type: INTEGER is
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
			a_string := STRING_.appended_string (indent (a_level), "convert untyped atomic items to ")
			a_string := STRING_.appended_string (a_string, type_name (target_type))
			std.error.put_string (a_string)
			std.error.put_new_line
			sequence.display (a_level + 1, a_pool)
		end

feature -- Optimization	

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do
			-- TODO
			todo ("analyze", False)
		end

feature -- Evaluation

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_MAPPED_ITEM is
			-- Map `an_item' to a sequence
		do
			-- TODO
			todo ("map", False)
		end
feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			todo ("compute-cardinality", False)
			-- TODO
		end

	sequence: XM_XPATH_EXPRESSION
			-- Base expression 
	
	target_type: INTEGER
			-- Target type 
invariant
	
end
