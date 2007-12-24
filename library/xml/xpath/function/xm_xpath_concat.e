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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			evaluate_as_string (a_context)
			a_result.put (last_evaluated_string)
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a String.
		local
			l_string: STRING
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			from
				create l_string.make (0)
				l_cursor := arguments.new_cursor; l_cursor.start
			variant
				arguments.count + 1 - l_cursor.index
			until
				l_cursor.after
			loop
				create l_result.make (Void)
				l_cursor.item.evaluate_item (l_result, a_context)
				if l_result.item /= Void then
					if l_result.item.is_error then
						l_string := ""
						set_last_error (l_result.item.error_value)
					else
						l_string := STRING_.appended_string (l_string, l_result.item.string_value)
					end
				end
				l_cursor.forth
			end
			create last_evaluated_string.make (l_string)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
