indexing

	description:

		"Objects that implement the XPath prefix-from-QName() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PREFIX_FROM_QNAME

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
			name := "prefix-from-QName"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Prefix_from_qname_function_type_code
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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_prefix: STRING
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif arguments.item (1).last_evaluated_item.is_error then
				last_evaluated_item := arguments.item (1).last_evaluated_item
			else
				a_prefix := arguments.item (1).last_evaluated_item.as_qname_value.optional_prefix
				if a_prefix.count = 0 then
					last_evaluated_item := Void
				elseif conformance.basic_xslt_processor then
					create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (a_prefix)
				else
					todo ("evaluate_item (schema-aware)", True)
				end
			end
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
			set_cardinality_optional
		end

end
	
