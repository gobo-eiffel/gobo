indexing

	description:

		"Objects that implement the XSLT type-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TYPE_AVAILABLE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, check_static_type
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "type-available"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Type_available_function_type_code
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
			Result := type_factory.boolean_type
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_single_string
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			namespace_resolver := a_context.namespace_resolver
			Precursor (a_context, a_context_item_type)
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		do
			arguments.item (1).evaluate_as_string (a_context)
			if arguments.item (1).last_evaluated_string.is_error then
				last_evaluated_item := arguments.item (1).last_evaluated_string
			else
				evaluate_qname (arguments.item (1).last_evaluated_string.string_value)
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
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			-- Saved namespace context from static context
	
	evaluate_qname (a_qname: STRING) is
			-- Evaluate if `a_qname' represents an available type
		require
			a_qname_not_void: a_qname /= Void
			namespace_resolver_not_void: namespace_resolver /= Void
		local
			l_fingerprint: INTEGER
		do
			if not is_qname (a_qname) then
				create {XM_XPATH_INVALID_VALUE} last_evaluated_item.make_from_string ("Argument is not a lexical QNAME", Xpath_errors_uri, "XTDE1428", Dynamic_error)
			else
				l_fingerprint := namespace_resolver.fingerprint (a_qname, true)
				if l_fingerprint = -2 then
					create {XM_XPATH_INVALID_VALUE} last_evaluated_item.make_from_string ("There is no namespace in scope for argument's prefix", Xpath_errors_uri, "XTDE1428", Dynamic_error)
				elseif l_fingerprint = -1 then
					create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (False)
				else
					-- TODO: will need to be changed for user-defined types in schema-aware version
					create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (type_factory.is_built_in_fingerprint (l_fingerprint) and then type_factory.schema_type (l_fingerprint) /= Void)
				end
			end
		end

end
	
