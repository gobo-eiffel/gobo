indexing

	description:

		"Objects that implement the XPath error() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ERROR

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, pre_evaluate
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "error"; namespace_uri := Xpath_standard_functions_uri
			minimum_argument_count := 0
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := any_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			inspect
				arguments.count
			when 0 then
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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_namespace_uri, an_error_code, a_description: STRING
			an_item: XM_XPATH_ITEM
			a_qname: XM_XPATH_QNAME_VALUE
			an_error_sequence: XM_XPATH_VALUE
			an_error_value: XM_XPATH_ERROR_VALUE
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			a_namespace_uri := Xpath_errors_uri
			an_error_code := "FOER0000"
			a_description := ""
			if arguments.count > 0 then
				arguments.item (1).evaluate_item (a_context)
				an_item := arguments.item (1).last_evaluated_item
				if an_item = Void then
					if arguments.count = 1 then
						a_description := "Error evaluating fn:error()! :-)"
					end
				elseif an_item.is_error then
					a_namespace_uri := an_item.error_value.namespace_uri
					an_error_code := an_item.error_value.code
					a_description := an_item.error_value.description
					an_error_sequence := an_item.error_value.value
				else
					check
						qname: an_item.is_qname_value
						-- static typing
					end
					a_qname := an_item.as_qname_value
					a_namespace_uri := a_qname.namespace_uri
					an_error_code := a_qname.local_name
				end
			end
			if arguments.count > 1 then
				arguments.item (2).evaluate_item (a_context)
				an_item := arguments.item (2).last_evaluated_item
				if an_item.is_error then
					a_namespace_uri := an_item.error_value.namespace_uri
					an_error_code := an_item.error_value.code
					a_description := an_item.error_value.description
					an_error_sequence := an_item.error_value.value
				else
					check
						description: an_item.is_string_value
						-- static typing
					end
					a_description := an_item.as_string_value.string_value
				end
			end
			if arguments.count = 3 then
				arguments.item (3).create_iterator (a_context)
				an_iterator := arguments.item (3).last_iterator
				expression_factory.create_sequence_extent (an_iterator)
				an_error_sequence := expression_factory.last_created_closure
			end
			create an_error_value.make (a_description, a_namespace_uri, an_error_code, an_error_sequence, Dynamic_error)
			create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_error_value)
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			--	do_nothing
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
