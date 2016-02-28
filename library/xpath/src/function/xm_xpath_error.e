note

	description:

		"Objects that implement the XPath error() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ERROR

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, pre_evaluate, create_node_iterator
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "error"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Error_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := any_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			inspect
				arguments.count
			when 0 then
				check False then end
			when 1 then
				create Result.make_single_qname
			else
				inspect
					argument_number
				when 1 then
					create Result.make_optional_qname
				when 2 then
					create Result.make_single_string
				when 3 then
					create Result.make_any_sequence
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_namespace_uri, l_error_code, l_description: STRING
			l_qname: XM_XPATH_QNAME_VALUE
			l_item: detachable XM_XPATH_ITEM
			l_error_sequence: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_error_value: XM_XPATH_ERROR_VALUE
		do
			l_namespace_uri := Xpath_errors_uri
			l_error_code := "FOER0000"
			l_description := ""
			if arguments.count > 0 then
				arguments.item (1).evaluate_item (a_result, a_context)
				l_item := a_result.item
				if l_item = Void then
					if arguments.count = 1 then
						l_description := "Error evaluating fn:error()! :-)"
					end
				elseif attached l_item.error_value as l_error_value_1 then
					check is_error: l_item.is_error end
					l_namespace_uri := l_error_value_1.namespace_uri
					l_error_code := l_error_value_1.code
					l_description := l_error_value_1.description
					l_error_sequence := l_error_value_1.value
				else
					check
						qname: l_item.is_qname_value
						-- static typing
					end
					l_qname := l_item.as_qname_value
					l_namespace_uri := l_qname.namespace_uri
					l_error_code := l_qname.local_name
				end
			end
			if arguments.count > 1 then
				a_result.put (Void)
				arguments.item (2).evaluate_item (a_result, a_context)
				l_item := a_result.item
				check attached l_item then
					if attached l_item.error_value as l_error_value_2 then
						check is_error: l_item.is_error end
						l_namespace_uri := l_error_value_2.namespace_uri
						l_error_code := l_error_value_2.code
						l_description := l_error_value_2.description
						l_error_sequence := l_error_value_2.value
					else
						check
							description: l_item.is_string_value
							-- static typing
						end
						l_description := l_item.as_string_value.string_value
					end
				end
			end
			if arguments.count = 3 then
				arguments.item (3).create_iterator (a_context)
				check postcondition_of_create_iterator: attached arguments.item (3).last_iterator as l_last_iterator_3 then
					l_error_sequence := l_last_iterator_3
				end
			end
			create l_error_value.make (l_description, l_namespace_uri, l_error_code, l_error_sequence, Dynamic_error)
			l_error_value.set_location (system_id, line_number)
			a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
		ensure then
			invalid_item: attached a_result.item as a_result_item and then a_result_item.is_error
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end


	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence.
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_result.make (Void)
			evaluate_item (l_result, a_context)
			check attached l_result.item as l_result_item and then attached l_result_item.error_value as l_error_value then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_error_value)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end

