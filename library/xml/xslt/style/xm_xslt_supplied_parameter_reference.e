indexing

	description:

		"Objects that provide runtime type checking for template parameters"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SUPPLIED_PARAMETER_REFERENCE

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			iterator
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_slot_number: INTEGER) is
			-- Set slot number.
		do
			slot_number := a_slot_number
		ensure
			set: slot_number = a_slot_number
		end

feature -- Access

	slot_number: INTEGER
			-- Slot number

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := any_item
		end

feature -- Status report

		display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "S#")
			a_string := STRING_.appended_string (a_string, slot_number.out)
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions.
		do
			do_nothing
		end

feature -- Evaluation
	
		iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		do
			todo ("iterator", False)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

end
	
