note

	description:

		"Objects that implement the XPath resolve-qname() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
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

	make
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.qname_type
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_optional_string
			else
				create Result.make (element_node_kind_test, Required_cardinality_exactly_one)
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_string, l_prefix, l_local_part: STRING
			l_qname_parts: DS_LIST [STRING]
			l_splitter: ST_SPLITTER
			l_count: INTEGER
			l_element: XM_XPATH_ELEMENT
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item /= Void and then not a_result.item.is_error then
				l_string := a_result.item.string_value
				create l_splitter.make
				l_splitter.set_separators (":")
				l_qname_parts := l_splitter.split (l_string)
				l_count := l_qname_parts.count
				if l_count < 1 or else l_count > 2 then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("First argument of resolve-qname() is not a lexical QName",
						Xpath_errors_uri, "FOCA0002", Dynamic_error))
				else
					if l_count = 1 then
						l_prefix := ""
						l_local_part := l_qname_parts.item (1)
					else
						l_prefix := l_qname_parts.item (1)
						l_local_part := l_qname_parts.item (2)
					end
					a_result.put (Void)
					arguments.item (2).evaluate_item (a_result, a_context)
					if not a_result.item.is_error then
						l_element := a_result.item.as_element
						if not shared_name_pool.is_code_for_prefix_allocated (l_prefix) then
							check
								not_null_prefix: l_prefix.count > 0
							end
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Prefix is not declared during resolve-qname()",
								Xpath_errors_uri, "FONS0004", Dynamic_error))
						else
							if is_ncname (l_local_part) then
								a_result.put (Void)
								resolve_qname (a_result, l_element, l_prefix, l_local_part)
							else
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Invalid local name in resolve-qname()",
									Xpath_errors_uri, "FOCA0002", Dynamic_error))
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

feature {NONE} -- Implementation

	resolve_qname (a_result: DS_CELL [XM_XPATH_ITEM]; a_element: XM_XPATH_ELEMENT; a_prefix, a_local_part: STRING)
			-- Resolve qname in scope of `an_element'.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			element_not_void: a_element /= Void
			prefix_not_void: a_prefix /= Void
			valid_local_part: a_local_part /= Void and then (a_local_part.count > 0 implies is_ncname (a_local_part))
		local
			l_found: BOOLEAN
			l_name_code, l_namespace_code, l_prefix_code, l_uri_code: INTEGER
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			l_prefix_code := shared_name_pool.code_for_prefix (a_prefix)
			from
				l_cursor := a_element.namespace_codes_in_scope.new_cursor
				l_cursor.start
			until
				l_found or l_cursor.after
			loop
				l_namespace_code := l_cursor.item
				if l_prefix_code = prefix_code_from_namespace_code (l_namespace_code) then
					l_uri_code := uri_code_from_namespace_code (l_namespace_code)
					l_found := True
				else
					l_cursor.forth
				end
			end
			if l_found then
				if shared_name_pool.is_name_code_allocated_using_uri_code (a_prefix, l_uri_code, a_local_part) then
					l_name_code := shared_name_pool.name_code (a_prefix, shared_name_pool.uri_from_uri_code (l_uri_code), a_local_part)
				else
					shared_name_pool.allocate_name_using_uri_code (a_prefix, l_uri_code, a_local_part)
					l_name_code := shared_name_pool.last_name_code
				end
				a_result.put (create {XM_XPATH_QNAME_VALUE}.make (l_name_code))
			elseif a_prefix.count = 0 then
				if shared_name_pool.is_name_code_allocated (a_prefix, Null_uri, a_local_part) then
					l_name_code := shared_name_pool.name_code (a_prefix, Null_uri, a_local_part)
				else
					shared_name_pool.allocate_name (a_prefix, Null_uri, a_local_part)
					l_name_code := shared_name_pool.last_name_code
				end
				a_result.put (create {XM_XPATH_QNAME_VALUE}.make (l_name_code))
			else
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Prefix is not declared during resolve-qname()",
					Xpath_errors_uri, "FONS0004", Dynamic_error))
			end
		ensure
			a_result_not_empty: a_result.item /= Void
		end

end

