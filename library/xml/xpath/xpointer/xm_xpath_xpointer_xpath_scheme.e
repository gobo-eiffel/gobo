indexing

	description:

		"Objects that implement the gexslt:xpath scheme"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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

	make is
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

	make_w3c is
			-- Create W3C xpath scheme.
		do
			make
			is_w3c := True
		ensure
			w3c_xpath_scheme: is_w3c
		end

feature -- Access

	expanded_name: STRING is 
			-- Expanded name of implemented scheme
		do
			if is_w3c then
				Result := "xpath2"
			else
				Result := expanded_name_from_components (Gexslt_eiffel_type_uri, "xpath")
			end
		end

	value: XM_XPATH_VALUE
			-- Result of last call to `evaluate'

feature -- Status report

	were_resources_found: BOOLEAN
			-- Were any XML resoureces found by last call to `evaluate'?

	is_error: BOOLEAN
			-- Did a syntax or evaluation error occur?

	is_w3c: BOOLEAN
			-- Is `Current' the W3C scheme, or gexslt (no semantic differences)?

feature -- Element change

	evaluate (a_resource: XM_XPATH_DOCUMENT; a_namespace_context: XM_XPOINTER_NAMESPACE_CONTEXT; some_data: STRING) is
			-- Evaluate `some_data' against `a_resource' within `a_namespace_context'.
		local
			a_base_uri: UT_URI
			a_static_context: XM_XPATH_STAND_ALONE_CONTEXT
			an_expression: XM_XPATH_EXPRESSION
			a_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
			a_slot_manager: XM_XPATH_SLOT_MANAGER
		do
			evaluated := True
			create a_base_uri.make (a_resource.base_uri)
			create a_static_context.make (False, False, a_base_uri, function_library)
			a_static_context.clear_all_namespaces
			a_static_context.declare_namespace ("xml", Xml_uri)
			from
				a_cursor := a_namespace_context.namespace_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_static_context.declare_namespace (a_cursor.key, a_cursor.item)
				a_cursor.forth
			end
			expression_factory.make_expression (some_data, a_static_context, 1, Eof_token, 1, "unknown:")
			if expression_factory.is_parse_error then
				is_error := True
				create {XM_XPATH_INVALID_VALUE} value.make (expression_factory.parsed_error_value)
			else
				an_expression := expression_factory.parsed_expression
				an_expression.check_static_type (a_static_context, any_item)
				if an_expression.is_error then
					is_error := True
					create {XM_XPATH_INVALID_VALUE} value.make (an_expression.error_value)
				else
					if an_expression.was_expression_replaced then
						an_expression := an_expression.replacement_expression
					end
					if an_expression.is_error then
						is_error := True
						create {XM_XPATH_INVALID_VALUE} value.make (an_expression.error_value)
					else
						an_expression.optimize (a_static_context, any_item)
						if an_expression.is_error then
							is_error := True
							create {XM_XPATH_INVALID_VALUE} value.make (an_expression.error_value)
						else
							if an_expression.was_expression_replaced then
								an_expression := an_expression.replacement_expression
							end
							if an_expression.is_error then
								is_error := True
								create {XM_XPATH_INVALID_VALUE} value.make (an_expression.error_value)
							else
								create a_slot_manager.make
								an_expression.allocate_slots (1, a_slot_manager)
								evaluate_post_analysis (an_expression, a_resource)
							end
						end
					end
				end
			end
		end
	
feature {NONE} -- Implementation

	function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Function library

	evaluate_post_analysis (an_expression: XM_XPATH_EXPRESSION; a_document: XM_XPATH_DOCUMENT) is
			-- perform evaluation on `an_expression'.
		require
			expression_checked_and_optimized_without_error: an_expression /= Void and then not an_expression.is_error
			document_not_void: a_document /= Void
		local
			a_document_pool: XM_XPATH_DOCUMENT_POOL
			a_context: XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			create a_document_pool.make (Serializable)
			a_document_pool.add (a_document, Void, a_document.base_uri) -- N.B. We can safely ignore the media type
			create a_context.make (a_document, a_document_pool, function_library)
			a_context.set_string_mode_mixed
			an_expression.create_iterator (a_context)			
			a_sequence_iterator := an_expression.last_iterator
			if a_sequence_iterator.is_error then
				is_error := True
				create {XM_XPATH_INVALID_VALUE} value.make (a_sequence_iterator.error_value)
			else
				create {XM_XPATH_SEQUENCE_EXTENT} value.make (a_sequence_iterator)
				were_resources_found := True
			end
		end

invariant

	function_library_not_void: function_library /= Void

end
	
