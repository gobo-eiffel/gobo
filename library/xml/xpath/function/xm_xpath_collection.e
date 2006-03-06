indexing

	description:

		"Objects that implement the XPath collection() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COLLECTION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, check_arguments, create_iterator
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

	UT_SHARED_URL_ENCODING
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "collection"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Collection_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := any_node_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_string
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			a_uri: UT_URI
			a_reference: STRING
			an_item: XM_XPATH_ITEM
			a_resolver: XM_XPATH_COLLECTION_RESOLVER
		do
			last_iterator := Void
			if arguments.count = 0 then
				create a_uri.make (Default_collection_scheme + ":")
			else
				arguments.item (1).evaluate_item (a_context)
				an_item := arguments.item (1).last_evaluated_item
				if an_item = Void then
					create a_uri.make (Default_collection_scheme + ":")
				elseif an_item.is_error then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (an_item.error_value)
				else
					a_reference := an_item.string_value
					if Url_encoding.has_excluded_characters (a_reference) then
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Argument to fn:collection() contains invalid characters",
																												 Xpath_errors_uri, "FODC0002", Dynamic_error)
					else
						create a_uri.make_resolve (base_uri, a_reference)
					end
				end
			end
			if last_iterator = Void then -- no error yet
				if a_context.available_documents.is_collection_mapped (a_uri.full_reference) then
					last_iterator := a_context.available_documents.collection (a_uri.full_reference)
				else
					a_resolver := a_context.configuration.collection_resolver
					a_resolver.resolve (a_uri, a_context)
					if a_resolver.was_error then
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (a_resolver.last_error)
					else
						last_iterator := a_resolver.last_collection
					end
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- Suppress compile-time evaluation
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			todo ("create_node_iterator", False)
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_context)
			if base_uri = Void then base_uri := a_context.base_uri end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

feature {NONE} -- Implementation

	base_uri: UT_URI
			-- Base URI saved from static context

end
	
