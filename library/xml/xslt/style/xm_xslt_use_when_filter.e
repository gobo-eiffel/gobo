note

	description:

		"Element filters for [xsl:]use-when processing"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_USE_WHEN_FILTER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			open, start_element, notify_namespace,
			notify_attribute,	start_content,
			end_element, notify_characters,
			notify_processing_instruction, notify_comment,
			set_document_locator
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_EXPRESSION_FACTORY
		export {NONE} all end

	XM_XPATH_SHARED_ANY_TYPE
		export {NONE} all end

	XM_XPATH_TOKENS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_receiver: like base_receiver; a_config: like configuration; a_factory: like node_factory)
			-- Initialize `Current'.
		require
			a_receiver_not_void: a_receiver /= Void
			a_config_not_void: a_config /= Void
			a_factory_not_void: a_factory /= Void
		do
			node_factory := a_factory
			base_receiver := a_receiver
			base_uri := base_receiver.base_uri
			document_uri := base_receiver.document_uri
			configuration := a_config
			create default_namespace_stack.make
			default_namespace_stack.set_equality_tester (string_equality_tester)
		ensure
			base_receiver_set: base_receiver = a_receiver
			configuration_set: configuration = a_config
			node_factory_set: node_factory = a_factory
		end

feature -- Access

	locator: XM_XPATH_LOCATOR
			-- Document position locator

	node_factory: XM_XSLT_NODE_FACTORY
			-- Node factory for extension instruction availability

feature -- Setting

	set_tag_buffer (a_buffer: like start_tag_buffer)
			-- Set `start_tag_buffer' to `a_buffer'.
		require
			a_buffer_not_void: a_buffer /= Void
		do
			start_tag_buffer := a_buffer
		ensure
			start_tag_buffer_set: start_tag_buffer = a_buffer
		end

feature -- Events

	open
			-- Notify start of event stream.
		do
			is_open := True
			if start_tag_buffer = Void then
				on_error ("Configuration error in use-when filter - no start tag buffer")
			elseif locator = Void then
				on_error ("Configuration error in use-when filter - no document locator")
			else
				if not shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Use_when_attribute) then
					shared_name_pool.allocate_name (Null_uri, Null_uri, Use_when_attribute)
					use_when_fingerprint := fingerprint_from_name_code (shared_name_pool.last_name_code)
				else
					use_when_fingerprint := fingerprint_from_name_code (shared_name_pool.name_code (Null_uri, Null_uri, Use_when_attribute))
				end
				if not shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, Xpath_default_namespace_attribute) then
					shared_name_pool.allocate_name (Null_uri, Null_uri, Xpath_default_namespace_attribute)
					xpath_default_namespace_fingerprint := fingerprint_from_name_code (shared_name_pool.last_name_code)
				else
					xpath_default_namespace_fingerprint := fingerprint_from_name_code (shared_name_pool.name_code (Null_uri, Null_uri, Xpath_default_namespace_attribute))
				end
			end
			base_receiver.open
		ensure then
			no_error_implies_start_tag_buffer_not_void: True
			no_error_implies_locator_not_void: True
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element.
		local
			l_uri_code, l_fingerprint: INTEGER
			l_use_when, l_base: STRING
			l_base_uri: UT_URI
			l_backwards, l_excluded: BOOLEAN
		do
			check
				start_tag_buffer_not_void: start_tag_buffer /= Void
				locator_not_void: locator /= Void
				-- postcondition of `open'
			end
			mark_as_written
			l_uri_code := shared_name_pool.uri_code_from_name_code (a_name_code)
			if l_uri_code = Xslt_uri_code then
				default_namespace_stack.put (start_tag_buffer.attribute_value (xpath_default_namespace_fingerprint))
			else
				default_namespace_stack.put (start_tag_buffer.attribute_value (Xslt_xpath_default_namespace_type_code))
			end
			if is_excluded_stylesheet_module then
				excluded_elements_nest_count := excluded_elements_nest_count + 1
			elseif excluded_elements_nest_count = 0 then
				if l_uri_code = Xslt_uri_code then
					l_use_when := start_tag_buffer.attribute_value (use_when_fingerprint)
				else
					l_use_when := start_tag_buffer.attribute_value (Xslt_use_when_type_code)
				end
				if l_use_when /= Void then
					create l_base_uri.make (locator.system_id)
					-- TODO: need to stack xml:base attributes
					l_base := start_tag_buffer.attribute_value (Xml_base_type_code)
					if l_base /= Void then
						create l_base_uri.make_resolve (l_base_uri, l_base)
					end
					-- TODO: need to check version attributes for backwards compatibility
					evaluate_use_when (l_use_when, l_base_uri, l_backwards)
					if not last_use_when_value then
						l_fingerprint := fingerprint_from_name_code (a_name_code)
						if l_fingerprint = Xslt_stylesheet_type_code or l_fingerprint = Xslt_transform_type_code then
							is_excluded_stylesheet_module := True
						else
							excluded_elements_nest_count := 1
							l_excluded := True
						end
					end
				end
				if not l_excluded then
					base_receiver.start_element (a_name_code, a_type_code, properties)
				end
			else
				excluded_elements_nest_count := excluded_elements_nest_count + 1
			end
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER)
			-- Notify a namespace.
		do
			mark_as_written
			if excluded_elements_nest_count = 0 then
				base_receiver.notify_namespace (a_namespace_code, properties)
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER)
			-- Notify an attribute.
		do
			mark_as_written
			if excluded_elements_nest_count = 0 then
				base_receiver.notify_attribute (a_name_code, a_type_code, a_value, properties)
			end
		end

	start_content
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			mark_as_written
			if excluded_elements_nest_count = 0 then
				base_receiver.start_content
			end
		end

	end_element
			-- Notify the end of an element.
		do
			mark_as_written
			default_namespace_stack.remove
			if excluded_elements_nest_count > 0 then
				excluded_elements_nest_count := excluded_elements_nest_count - 1
			else
				base_receiver.end_element
			end
		end

	notify_characters (chars: STRING; properties: INTEGER)
			-- Notify character data.
		do
			mark_as_written
			if excluded_elements_nest_count = 0 then
				base_receiver.	notify_characters (chars, properties)
			end
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER)
			-- Notify a processing instruction.
		do
			-- drop silently from stylesheet modules
		end

	notify_comment (a_content_string: STRING; properties: INTEGER)
			-- Notify a comment.
		do
			-- drop silently from stylesheet modules
		end

feature -- Element change

	set_document_locator (a_locator: XM_XPATH_LOCATOR)
			-- Set the locator.
		do
			locator := a_locator
			base_receiver.set_document_locator (a_locator)
		ensure then
			locator_set: locator = a_locator
		end

feature {NONE} -- Implementation

	use_when_fingerprint: INTEGER
			-- Name code fingerprint for use-when attribute in no namespace

	xpath_default_namespace_fingerprint: INTEGER
			-- Name code fingerprint for xpath-default-namespace attribute in no namespace

	configuration: XM_XSLT_CONFIGURATION
			-- XSLT configuration

	excluded_elements_nest_count: INTEGER
			-- Nesting count of excluded elements

	is_excluded_stylesheet_module: BOOLEAN
			-- Are we within a stylesheet module that has failed use-when inclusion?

	start_tag_buffer: XM_XSLT_START_TAG_BUFFER
			-- Attribute and namespace buffer

	default_namespace_stack: DS_LINKED_STACK [STRING]
			-- Stack for xpath-default-namespace values

	last_use_when_value: BOOLEAN
			-- Result from last call to `evaluate_use_when'

	evaluate_use_when (a_use_when: STRING; a_base_uri: UT_URI; a_backwards: BOOLEAN)
			-- Evaluate `a_use_when' as an XPath expression.
		require
			a_use_when_not_void: a_use_when /= Void
			a_base_uri_not_void: a_base_uri /= Void
			a_base_uri_absolute: a_base_uri.is_absolute
			start_tag_buffer_not_void: start_tag_buffer /= Void
			locator_not_void: locator /= Void
		local
			l_static_context: XM_XSLT_USE_WHEN_STATIC_CONTEXT
			l_stack: like default_namespace_stack
			l_default_namespace: STRING
			l_found: BOOLEAN
			l_expression: XM_XPATH_EXPRESSION
			l_slot_manager: XM_XPATH_SLOT_MANAGER
			l_context: XM_XPATH_CONTEXT
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			last_use_when_value := False
			from
				create l_stack.make
				l_stack.copy (default_namespace_stack)
			until
				l_stack.is_empty or l_found
			loop
				l_default_namespace := l_stack.item
				l_stack.remove
				if l_default_namespace /= Void then
					l_found := True
				end
			end
			if l_default_namespace = Void then
				l_default_namespace := ""
			end
			create l_static_context.make (configuration, start_tag_buffer, a_base_uri, locator.system_id, locator.line_number, l_default_namespace, a_backwards, node_factory)
			make_expression (a_use_when, l_static_context, 1, Eof_token, locator.line_number, locator.system_id)
			if is_parse_error then
				on_error (parsed_error_value.error_message)
			else
				l_expression := parsed_expression
				create l_replacement.make (Void)
				l_expression.check_static_type (l_replacement, l_static_context, any_type)
				l_expression := l_replacement.item
				if l_expression.is_error then
					on_error (l_expression.error_value.error_message)
				else
					create l_slot_manager.make
					l_expression.allocate_slots (1, l_slot_manager)
					l_context := l_static_context.new_compile_time_context
					l_context.open_stack_frame (l_slot_manager)
					l_expression.calculate_effective_boolean_value (l_context)
					if l_expression.is_error then
						on_error (l_expression.error_value.error_message)
					else
						last_use_when_value := l_expression.last_boolean_value.value
					end
				end
			end
		end

invariant

	default_namespace_stack_not_void: default_namespace_stack /= Void
	configuration_not_void: configuration /= Void
	node_factory_not_void: node_factory /= Void

end
