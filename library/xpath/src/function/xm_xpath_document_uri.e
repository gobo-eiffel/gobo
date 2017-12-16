note

	description:

		"Objects that implement the XPath document-uri() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOCUMENT_URI

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "document-uri"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Document_uri_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.any_uri_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_node
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_uri: detachable UT_URI
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not attached a_result.item as a_result_item or else a_result_item.is_error then
				-- nothing to do
			else
				if a_result_item.is_document then
					l_uri := a_result_item.as_document.document_uri
					if l_uri /= Void and then l_uri.is_absolute then
						a_result.put (create {XM_XPATH_ANY_URI_VALUE}.make (l_uri.full_reference))
					else
						a_result.put (Void)
					end
				else
					a_result.put (Void)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end

