indexing

	description:

		"Objects that implement the XPath concat() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONCAT

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, evaluate_as_string
		end

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "concat"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Concat_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := Platform.Maximum_integer
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_atomic -- infinite number of possible arguments, all the same
		end

	is_test_for_zero: BOOLEAN
			-- If this is set we return 0 for a zero length string, 1 for any other;
			-- Set by the optimizer.

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			evaluate_as_string (a_context)
			last_evaluated_item := last_evaluated_string
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a String.
		local
			a_string: STRING
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			an_item: XM_XPATH_ITEM
		do
			from
				create a_string.make (0)
				a_cursor := arguments.new_cursor; a_cursor.start
			variant
				arguments.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_cursor.item.evaluate_item (a_context)
				if a_cursor.item.last_evaluated_item /= Void then
					an_item := a_cursor.item.last_evaluated_item
					if an_item.is_error then
						a_string := ""
						set_last_error (an_item.error_value)
					else
						a_string := STRING_.appended_string (a_string, an_item.string_value)
					end
				end
				a_cursor.forth
			end
			create last_evaluated_string.make (a_string)
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
