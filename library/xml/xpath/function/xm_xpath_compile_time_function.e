indexing

	description:

		"Functions which are re-written at compile-time"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_COMPILE_TIME_FUNCTION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, create_iterator
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_message: STRING
		do
			a_message := "Internal error: function " + name + " should have been resolved at compile-time"
			create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message, Gexslt_eiffel_type_uri, "INTERNAL_ERROR", Dynamic_error)
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			--	do_nothing
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			a_message: STRING
		do
			a_message := "Internal error: function " + name + " should have been resolved at compile-time"
			create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string (a_message, Gexslt_eiffel_type_uri, "INTERNAL_ERROR", Dynamic_error)
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			a_message: STRING
		do
			a_message := "Internal error: function " + name + " should have been resolved at compile-time"
			create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string (a_message, Gexslt_eiffel_type_uri, "INTERNAL_ERROR", Dynamic_error)
		end

end
