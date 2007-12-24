indexing

	description:

		"Objects that represent a deferred error, to be raised only if executed"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DEFERRED_ERROR

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			evaluate_item, create_iterator, create_node_iterator, is_deferred_error
		end

create

	make

feature {NONE} -- Initialization

	make (a_error: XM_XPATH_ERROR_VALUE; a_instruction_name: STRING) is
			-- Establish invariant.
		require
			error_not_void: a_error /= Void
			instruction_name_not_void: a_instruction_name /= Void
		do
			error := a_error
			instruction_name := a_instruction_name
			compute_static_properties
			initialized := True
		ensure
			error_set: error = a_error
			name_set: instruction_name = a_instruction_name
		end

feature -- Access

	instruction_name: STRING
			-- Name of instruction, for diagnostics (??)

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known;
		do
			Result := any_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.concat (indentation (a_level), "error"))
			std.error.put_new_line
		end

	is_deferred_error: BOOLEAN is
			-- Is `Current' a deferred error?
		do
			Result := True
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			a_result.put (create {XM_XPATH_INVALID_ITEM}.make (error_value))
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		do
			create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (error)
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create iterator over a sequence of nodes.
		do
			create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (error)
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
	
