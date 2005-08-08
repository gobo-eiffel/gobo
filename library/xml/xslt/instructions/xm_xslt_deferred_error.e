indexing

	description:

		"Objects that represent a deferred error, to be raised only if executed"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DEFERRED_ERROR

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			evaluate_item, create_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (an_error: XM_XPATH_ERROR_VALUE; an_instruction_name: STRING) is
			-- Establish invariant.
		require
			error_not_void: an_error /= Void
			instruction_name_not_void: an_instruction_name /= Void
		do
			error := an_error
			instruction_name := an_instruction_name
			compute_static_properties
			initialized := True
		ensure
			error_set: error = an_error
			name_set: instruction_name = an_instruction_name
		end

feature -- Access

	instruction_name: STRING
			-- Name of instruction, for diagnostics (??)

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known;
		do
			Result := any_item
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (error_value)
		end

	
	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		do
			create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (error)
		end

	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

feature {NONE} -- Implementation

	error: XM_XPATH_ERROR_VALUE
			-- Error to report

invariant

	error_not_void: initialized implies error /= Void

end
	
