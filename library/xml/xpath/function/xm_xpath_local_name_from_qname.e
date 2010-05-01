note

	description:

		"Objects that implement the XPath local-name-from-QName() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LOCAL_NAME_FROM_QNAME

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	XM_XPATH_SHARED_CONFORMANCE

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "local-name-from-QName"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Local_name_from_qname_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			if conformance.basic_xslt_processor then
				Result := type_factory.string_type
			else
				Result := type_factory.ncname_type
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_qname
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item /= Void and then not a_result.item.is_error then
				if conformance.basic_xslt_processor then
					a_result.put (create {XM_XPATH_STRING_VALUE}.make (a_result.item.as_qname_value.local_name))
				else
					todo ("evaluate_item (schema-aware)", True)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end
	
