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
			create_iterator
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_slot_number: INTEGER) is
			-- Set slot number.
		do
			slot_number := a_slot_number
			compute_static_properties
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

		display (a_level: INTEGER) is
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
			-- do nothing
		end

feature -- Evaluation
	
	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			a_value: XM_XPATH_VALUE
		do
			if a_context.local_variable_frame.variables.item (slot_number) /= Void then
				a_value := a_context.evaluated_local_variable (slot_number)
				a_value.create_iterator (a_context)
				last_iterator := a_value.last_iterator
			else
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Local parameter value missing", "", "XTTE0570", Type_error)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

end
	
