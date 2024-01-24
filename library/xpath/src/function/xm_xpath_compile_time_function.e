note

	description:

		"Functions which are re-written at compile-time"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_COMPILE_TIME_FUNCTION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, create_iterator, create_node_iterator
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_message: STRING
		do
			l_message := "Internal error: function " + name + " should have been resolved at compile-time"
			a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string (l_message, Gexslt_eiffel_type_uri, "INTERNAL_ERROR", Dynamic_error))
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- An iterator over the values of a sequence
		local
			a_message: STRING
		do
			a_message := "Internal error: function " + name + " should have been resolved at compile-time"
			create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string (a_message, Gexslt_eiffel_type_uri, "INTERNAL_ERROR", Dynamic_error)
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- An iterator over the values of a sequence
		local
			a_message: STRING
		do
			a_message := "Internal error: function " + name + " should have been resolved at compile-time"
			create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string (a_message, Gexslt_eiffel_type_uri, "INTERNAL_ERROR", Dynamic_error)
		end

end
