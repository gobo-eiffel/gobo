indexing

	description:

		"Objects that implement the XPath resolve-qname() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_RESOLVE_QNAME

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XPATH_CARDINALITY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "resolve-qname"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Resolve_qname_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.qname_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_optional_string
			else
				create Result.make (element_node_kind_test, Required_cardinality_exactly_one)
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_item: XM_XPATH_ITEM
			a_string, a_prefix, a_local_part: STRING
			some_qname_parts: DS_LIST [STRING]
			a_splitter: ST_SPLITTER
			a_count: INTEGER
			an_element: XM_XPATH_ELEMENT
		do
			arguments.item (1).evaluate_item (a_context)
			an_item := arguments.item (1).last_evaluated_item
			if an_item = Void then
				last_evaluated_item := Void
			elseif an_item.is_error then
				last_evaluated_item := an_item
			else
				a_string := an_item.string_value
				create a_splitter.make
				a_splitter.set_separators (":")
				some_qname_parts := a_splitter.split (a_string)
				a_count := some_qname_parts.count
				if a_count < 1 or else a_count > 2 then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("First argument of resolve-qname() is not a lexical QName",
																												Xpath_errors_uri, "FOCA0002", Dynamic_error)
				else
					if a_count = 1 then
						a_prefix := ""
						a_local_part := some_qname_parts.item (1)
					else
						a_prefix := some_qname_parts.item (1)
						a_local_part := some_qname_parts.item (2)
					end
					arguments.item (2).evaluate_item (a_context)
					an_item := arguments.item (2).last_evaluated_item
					if an_item.is_error then
						last_evaluated_item := an_item
					else
						an_element := an_item.as_element
						if not shared_name_pool.is_code_for_prefix_allocated (a_prefix) then
							check
								not_null_prefix: a_prefix.count > 0
							end
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Prefix is not declared during resolve-qname()",
																														Xpath_errors_uri, "FONS0004", Dynamic_error)
						else
							resolve_qname (an_element, a_prefix, a_local_part)
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

feature {NONE} -- Implementation

	resolve_qname (an_element: XM_XPATH_ELEMENT; a_prefix, a_local_part: STRING; ) is
			-- Resolve qname in scope of `an_element'.
		require
			element_not_void: an_element /= Void
			prefix_not_void: a_prefix /= Void
			local_name_not_void: a_local_part /= Void
		local
			found: BOOLEAN
			a_name_code, a_namespace_code, a_prefix_code, a_uri_code: INTEGER
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			a_prefix_code := shared_name_pool.code_for_prefix (a_prefix)
			from
				a_cursor := an_element.namespace_codes_in_scope.new_cursor; a_cursor.start
			until
				found or else a_cursor.after
			loop
				a_namespace_code := a_cursor.item
				if a_prefix_code = prefix_code_from_namespace_code (a_namespace_code) then
					a_uri_code := uri_code_from_namespace_code (a_namespace_code)
					found := True
				else
					a_cursor.forth
				end
			end
			if found then
				if shared_name_pool.is_name_code_allocated_using_uri_code (a_prefix, a_uri_code, a_local_part) then
					a_name_code := shared_name_pool.name_code (a_prefix, shared_name_pool.uri_from_uri_code (a_uri_code), a_local_part)
				else
					shared_name_pool.allocate_name_using_uri_code (a_prefix, a_uri_code, a_local_part)
					a_name_code := shared_name_pool.last_name_code
				end
				create {XM_XPATH_QNAME_VALUE} last_evaluated_item.make (a_name_code)
			elseif a_prefix.count = 0 then
				if shared_name_pool.is_name_code_allocated (a_prefix, Null_uri, a_local_part) then
					a_name_code := shared_name_pool.name_code (a_prefix, Null_uri, a_local_part)
				else
					shared_name_pool.allocate_name (a_prefix, Null_uri, a_local_part)
					a_name_code := shared_name_pool.last_name_code
				end
				create {XM_XPATH_QNAME_VALUE} last_evaluated_item.make (a_name_code)
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Prefix is not declared during resolve-qname()",
																											Xpath_errors_uri, "FONS0004", Dynamic_error)
			end
		end
	
end
	
