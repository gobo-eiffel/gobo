note

	description:

		"Objects that implement the XPath collection() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COLLECTION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, check_arguments, create_iterator, create_node_iterator
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

	make
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := any_node_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_string
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create iterator over the values of a sequence.
		local
			l_uri: detachable UT_URI
			l_reference: STRING
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
			l_resolver: XM_XPATH_COLLECTION_RESOLVER
		do
			last_iterator := Void
			if arguments.count = 0 then
				create l_uri.make (Default_collection_scheme + ":")
			else
				create l_result.make (Void)
				arguments.item (1).evaluate_item (l_result, a_context)
				if not attached l_result.item as l_result_item then
					create l_uri.make (Default_collection_scheme + ":")
				elseif attached l_result_item.error_value as l_error_value then
					check is_error: l_result_item.is_error end
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
				else
					l_reference := l_result_item.string_value
					if Url_encoding.has_excluded_characters (l_reference) then
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Argument to fn:collection() contains invalid characters",
																												 Xpath_errors_uri, "FODC0002", Dynamic_error)
					else
						check attached base_uri as l_base_uri then
							create l_uri.make_resolve (l_base_uri, l_reference)
						end
					end
				end
			end
			if last_iterator = Void then -- no error yet
				check attached l_uri then
					if attached a_context.available_documents as l_available_documents and then l_available_documents.is_collection_mapped (l_uri.full_reference) then
						last_iterator := l_available_documents.collection (l_uri.full_reference)
					else
						l_resolver := a_context.configuration.collection_resolver
						l_resolver.resolve (l_uri, a_context)
						if attached l_resolver.last_error as l_last_error then
							check was_error: l_resolver.was_error end
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_last_error)
						else
							check postcondition_of_resolve: attached l_resolver.last_collection as l_last_collection then
								last_iterator := l_last_collection
							end
						end
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create iterator over a node sequence.
		local
			l_uri: detachable UT_URI
			l_reference: STRING
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
			l_resolver: XM_XPATH_COLLECTION_RESOLVER
		do
			last_node_iterator := Void
			if arguments.count = 0 then
				create l_uri.make (Default_collection_scheme + ":")
			else
				create l_result.make (Void)
				arguments.item (1).evaluate_item (l_result, a_context)
				if not attached l_result.item as l_result_item then
					create l_uri.make (Default_collection_scheme + ":")
				elseif attached l_result_item.error_value as l_error_value then
					check is_error: l_result_item.is_error end
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_error_value)
				else
					l_reference := l_result_item.string_value
					if Url_encoding.has_excluded_characters (l_reference) then
						create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string ("Argument to fn:collection() contains invalid characters",
							Xpath_errors_uri, "FODC0002", Dynamic_error)
					else
						check attached base_uri as l_base_uri then
							create l_uri.make_resolve (l_base_uri, l_reference)
						end
					end
				end
			end
			if last_node_iterator = Void then -- no error yet
				check attached l_uri then
					if attached a_context.available_documents as l_available_documents and then l_available_documents.is_collection_mapped (l_uri.full_reference) then
						last_node_iterator := l_available_documents.collection (l_uri.full_reference)
					else
						l_resolver := a_context.configuration.collection_resolver
						l_resolver.resolve (l_uri, a_context)
						if attached l_resolver.last_error as l_last_error then
							check was_error: l_resolver.was_error end
							create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_last_error)
						else
							check postcondition_of_resolve: attached l_resolver.last_collection as l_last_collection then
								last_node_iterator := l_last_collection
							end
						end
					end
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_replacement, a_context)
			if base_uri = Void then
				base_uri := a_context.base_uri
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

feature {NONE} -- Implementation

	base_uri: detachable UT_URI
			-- Base URI saved from static context

end

