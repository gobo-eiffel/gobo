indexing

	description:

		"Objects that implement the XPath count() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COUNT

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, check_arguments, is_count_function, as_count_function
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "count"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Count_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	is_count_function: BOOLEAN is
			-- Is `Current' XPath count() function?
		do
			Result := True
		end

	as_count_function: XM_XPATH_COUNT is
			-- `Current' seen as XPath count() function
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.integer_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_any_sequence
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_integer: INTEGER
		do
			arguments.item (1).create_iterator (a_context)
			l_iterator := arguments.item (1).last_iterator
			if l_iterator.is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
			elseif l_iterator.is_last_position_finder then
				create l_integer_value.make (l_iterator.last_position)
				if l_iterator.is_error then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
				else
					a_result.put (l_integer_value)
				end
			else
				from
					l_integer := 0
					l_iterator.start
				until
					l_iterator.is_error or else l_iterator.after
				loop
					l_integer := l_integer + 1
					l_iterator.forth
				end
				if not l_iterator.is_error then
					create l_integer_value.make (l_integer)
					a_result.put (l_integer_value)
				else
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			Precursor (a_replacement, a_context)
			if a_replacement.item = Void then
				create l_replacement.make (Void)
				arguments.item (1).set_unsorted (l_replacement, True)
				if arguments.item (1) /= l_replacement.item then
					arguments.replace (l_replacement.item, 1)
				end
			end
		end

end
	
