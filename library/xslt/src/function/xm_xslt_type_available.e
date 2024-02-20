note

	description:

		"Objects that implement the XSLT type-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_TYPE_AVAILABLE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, check_static_type
		end

create

	make

feature {NONE} -- Initialization

	make
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_single_string
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			namespace_resolver := a_context.namespace_resolver
			Precursor (a_replacement, a_context, a_context_item_type)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			arguments.item (1).evaluate_as_string (a_context)
			check attached a_result.item as l_result_item then
				if not l_result_item.is_error then
					check postcondition_of_evaluate_as_string: attached arguments.item (1).last_evaluated_string as l_last_evaluated_string then
						evaluate_qname (a_result, l_last_evaluated_string.string_value)
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	namespace_resolver: detachable XM_XPATH_NAMESPACE_RESOLVER
			-- Saved namespace context from static context

	evaluate_qname (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_qname: STRING)
			-- Evaluate if `a_qname' represents an available type
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			a_qname_not_void: a_qname /= Void
			namespace_resolver_not_void: namespace_resolver /= Void
		local
			l_fingerprint: INTEGER
		do
			if not is_qname (a_qname) then
				a_result.put (create {XM_XPATH_INVALID_VALUE}.make_from_string ("Argument is not a lexical QNAME", Xpath_errors_uri, "XTDE1428", Dynamic_error))
			else
				check precondition_namespace_resolver_not_void: attached namespace_resolver as l_namespace_resolver then
					l_fingerprint := l_namespace_resolver.fingerprint (a_qname, true)
					if l_fingerprint = -2 then
						a_result.put (create {XM_XPATH_INVALID_VALUE}.make_from_string ("There is no namespace in scope for argument's prefix", Xpath_errors_uri, "XTDE1428", Dynamic_error))
					elseif l_fingerprint = -1 then
						a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
					else
						-- TODO: will need to be changed for user-defined types in schema-aware version
						a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (type_factory.is_built_in_fingerprint (l_fingerprint) and then type_factory.schema_type (l_fingerprint) /= Void))
					end
				end
			end
		end

end

