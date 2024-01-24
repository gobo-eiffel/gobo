note

	description:

		"Objects that implement an XPointer scheme"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_XPOINTER_SCHEME

feature -- Access

	expanded_name: STRING
			-- Expanded name of implemented scheme;
			-- Expanded name is {namespace-uri}local-name for non-W3C schemes,
			--  or just local-name for W3C schemes.
		deferred
		ensure
			expanded_name_not_empty: Result /= Void and then Result.count > 0
		end

	value: detachable XM_XPATH_VALUE
			-- Result of last call to `evaluate'
		deferred
		ensure
			no_error_if_resources_found: evaluated and then were_resources_found implies Result /= Void and then not Result.is_error
			void_if_evaluate_not_called: not evaluated implies Result = Void
		end

feature -- Status report

	were_resources_found: BOOLEAN
			-- Were any XML resoureces found by last call to `evaluate'?
		require
			evaluate_called: evaluated
		deferred
		ensure
			no_error: Result implies not is_error
		end

	is_error: BOOLEAN
			-- Did a syntax or evaluation error occur?
		require
			evaluated: evaluated
		deferred
		ensure
			error_value_set: Result implies attached value as l_value and then l_value.is_error
		end

	evaluated: BOOLEAN
			-- Has `evaluate' been called since creation?

feature -- Element change

	evaluate (a_resource: XM_XPATH_DOCUMENT; a_namespace_context: XM_XPOINTER_NAMESPACE_CONTEXT; some_data: STRING)
			-- Evaluate `some_data' against `a_resource' within `a_namespace_context'.
		require
			xml_resource_not_void: a_resource /= Void
			namespace_context_not_void: a_namespace_context /= Void
			scheme_data_not_void: some_data /= Void
		deferred
		ensure
			evaluated: evaluated
			value_set: value /= Void
		end

end

