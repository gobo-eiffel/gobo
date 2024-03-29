﻿note

	description:

		"Objects that implement the gexslt:xpath scheme"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_XPOINTER_XPATH_SCHEME

inherit

	XM_XPATH_XPOINTER_SCHEME

	XM_XPATH_SHARED_ANY_ITEM_TYPE

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_SHARED_EXPRESSION_FACTORY
		export {NONE} all end

	XM_XPATH_SHARED_CONFORMANCE
		export {NONE} all end

	XM_XPATH_TOKENS
		export {NONE} all end

	XM_XPATH_ISOLATION_LEVELS
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make, make_w3c

feature {NONE} -- Implementation

	make
			-- Establish environment.
		local
			a_core_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
			a_constructor_function_library: XM_XPATH_CONSTRUCTOR_FUNCTION_LIBRARY
		do
			conformance.set_basic_xslt_processor
			create function_library.make
			create a_core_function_library.make
			create a_constructor_function_library.make
			function_library.add_function_library (a_core_function_library)
			function_library.add_function_library (a_constructor_function_library)
		ensure
			gexslt_xpath_scheme: not is_w3c
		end

	make_w3c
			-- Create W3C xpath scheme.
		do
			make
			is_w3c := True
		ensure
			w3c_xpath_scheme: is_w3c
		end

feature -- Access

	expanded_name: STRING
			-- Expanded name of implemented scheme
		do
			if is_w3c then
				Result := "xpath2"
			else
				Result := expanded_name_from_components (Gexslt_eiffel_type_uri, "xpath")
			end
		end

	value: detachable XM_XPATH_VALUE
			-- Result of last call to `evaluate'

feature -- Status report

	were_resources_found: BOOLEAN
			-- Were any XML resoureces found by last call to `evaluate'?

	is_error: BOOLEAN
			-- Did a syntax or evaluation error occur?

	is_w3c: BOOLEAN
			-- Is `Current' the W3C scheme, or gexslt (no semantic differences)?

feature -- Element change

	evaluate (a_resource: XM_XPATH_DOCUMENT; a_namespace_context: XM_XPOINTER_NAMESPACE_CONTEXT; a_data: STRING)
			-- Evaluate `a_data' against `a_resource' within `a_namespace_context'.
		local
			l_base_uri: UT_URI
			l_static_context: XM_XPATH_STAND_ALONE_CONTEXT
			l_expression: XM_XPATH_EXPRESSION
			l_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
			l_slot_manager: XM_XPATH_SLOT_MANAGER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			evaluated := True
			check attached a_resource.base_uri as l_resource_base_uri then
				create l_base_uri.make (l_resource_base_uri)
				create l_static_context.make (False, False, l_base_uri, function_library)
				l_static_context.clear_all_namespaces
				l_static_context.declare_namespace ("xml", Xml_uri)
				from
					l_cursor := a_namespace_context.namespace_cursor; l_cursor.start
				until
					l_cursor.after
				loop
					l_static_context.declare_namespace (l_cursor.key, l_cursor.item)
					l_cursor.forth
				end
				expression_factory.make_expression (a_data, l_static_context, 1, Eof_token, 1, "unknown:")
				if attached expression_factory.parsed_error_value as l_parsed_error_value then
					check is_parse_error: expression_factory.is_parse_error end
					is_error := True
					create {XM_XPATH_INVALID_VALUE} value.make (l_parsed_error_value)
				else
					l_expression := expression_factory.parsed_expression
					create l_replacement.make (Void)
					l_expression.check_static_type (l_replacement, l_static_context, any_item)
					check postcondition_check_static_type: attached l_replacement.item as l_replacement_item1 then
						l_expression := l_replacement_item1
						if attached l_expression.error_value as l_expression_error_value then
							check is_error: l_expression.is_error end
							is_error := True
							create {XM_XPATH_INVALID_VALUE} value.make (l_expression_error_value)
						else
							l_replacement.put (Void)
							l_expression.optimize (l_replacement, l_static_context, any_item)
							check postcondition_optimize: attached l_replacement.item as l_replacement_item2 then
								l_expression := l_replacement_item2
								if attached l_expression.error_value as l_expression_error_value then
									check is_error: l_expression.is_error end
									is_error := True
									create {XM_XPATH_INVALID_VALUE} value.make (l_expression_error_value)
								else
									create l_slot_manager.make
									l_expression.allocate_slots (1, l_slot_manager)
									evaluate_post_analysis (l_expression, a_resource)
								end
							end
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Function library

	evaluate_post_analysis (a_expression: XM_XPATH_EXPRESSION; a_document: XM_XPATH_DOCUMENT)
			-- perform evaluation on `a_expression'.
		require
			expression_checked_and_optimized_without_error: a_expression /= Void and then not a_expression.is_error
			document_not_void: a_document /= Void
		local
			a_document_pool: XM_XPATH_DOCUMENT_POOL
			a_context: XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			create a_document_pool.make (Serializable)
			check attached a_document.base_uri as l_document_base_uri then
				a_document_pool.add (a_document, Void, l_document_base_uri) -- N.B. We can safely ignore the media type
				create a_context.make (a_document, a_document_pool, function_library)
				a_context.set_string_mode_mixed
				a_expression.create_iterator (a_context)
				check postcondition_create_iterator: attached a_expression.last_iterator as l_expression_last_iterator then
					a_sequence_iterator := l_expression_last_iterator
					if attached a_sequence_iterator.error_value as l_error_value then
						check is_error: a_sequence_iterator.is_error end
						is_error := True
						create {XM_XPATH_INVALID_VALUE} value.make (l_error_value)
					else
						create {XM_XPATH_SEQUENCE_EXTENT} value.make (a_sequence_iterator)
						were_resources_found := True
					end
				end
			end
		end

invariant

	function_library_not_void: function_library /= Void

end

