indexing

	description:

		"Objects that filter an event stream according to an XPointer"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPOINTER_EVENT_FILTER

inherit

	XM_DTD_CALLBACKS_FILTER
		rename
			make_null as make_dtd_null,
			set_next as set_next_dtd,
			next as dtd_callbacks
		redefine
			on_attribute_declaration
		end

	XM_CALLBACKS_FILTER
		rename
			make_null as make_filter_null,
			set_next as set_next_filter,
			next as callbacks
		redefine
			on_start, on_finish, on_processing_instruction, on_comment, on_start_tag,
			on_attribute, on_start_tag_finish, on_end_tag, on_content
		end

	XM_MARKUP_CONSTANTS

	KL_IMPORTED_STRING_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER

	UT_SHARED_MEDIA_TYPE_EQUALITY_TESTER

	-- TODO: Extend the filter to accept element() scheme. (?)

create

	make

feature {NONE} -- Initialization

	make (an_xpointer: STRING; a_media_type: UT_MEDIA_TYPE; a_resolver: XM_RESOLVER_MEDIA_TYPE; a_callback: XM_CALLBACKS; a_dtd_callback: XM_DTD_CALLBACKS) is
			-- Establish invariant.
		require
			xpointer_not_void: an_xpointer /= Void
			callbacks_not_void: a_callback /= Void
			dtd_callbacks_not_void: a_dtd_callback /= Void
			resolver_not_void: a_resolver /= Void
		do
			default_media_type := a_media_type
			callbacks := a_callback
			dtd_callbacks := a_dtd_callback
			if an_xpointer.count > 0 then
				set_xpointer (an_xpointer)
			else
				set_no_filtering
			end
			resolver := a_resolver
		ensure
			resolver_set: resolver = a_resolver
			default_media_type_set: default_media_type = a_media_type
		end

feature -- Access

	media_type: UT_MEDIA_TYPE
		-- Media type of document entity

	Unacceptable_media_type: STRING is "Media type is not acceptable for fragment processing"
			-- Unaaceptable media type error message

feature -- Status report

	is_filtering: BOOLEAN
			-- Are we actually doing any XPointer filtering?

	has_media_type (a_media_type: UT_MEDIA_TYPE): BOOLEAN is
			-- Is `a_media_type' acceptable for fragment processing?
		require
			filtering: is_filtering
			media_type_not_void: a_media_type /= Void
		do
			Result := acceptable_media_types.has (a_media_type)
		end

	any_types_added: BOOLEAN is
			-- Have any acceptable media types been declared?
		require
			filtering: is_filtering
		do
			Result := acceptable_media_types.count > 0
		end

	generic_xml_types_allowed: BOOLEAN
			-- Are media types of form "application/*+xml" allowed?

	are_media_type_ignored: BOOLEAN
			-- Do we ignore the media type?

feature -- Status setting

	set_no_filtering is
			-- Change this into a pure pass-through filter
		do
			is_filtering := False
			is_error := False
			acceptable_media_types := Void
		ensure
			not_filtering: not is_filtering
		end

	set_xpointer (an_xpointer: STRING) is
			-- Use `an_xpointer' as the XPointer
		require
			xpointer_not_void: an_xpointer /= Void
		local
			a_parser: XM_XPOINTER_PARSER
		do
			is_error := False
			create a_parser.make
			a_parser.parse (an_xpointer)
			if a_parser.is_error or else not a_parser.is_shorthand then
				is_error := True
				error_message := STRING_.concat (an_xpointer, " is not a shorthand pointer")
			else
				shorthand := a_parser.shorthand
			end
			create attribute_types.make_with_equality_testers (7, Void, string_equality_tester)
			is_filtering := True
			create acceptable_media_types.make_default
			acceptable_media_types.set_equality_tester (media_type_tester)
			are_media_type_ignored := False
			create namespace_bindings_stack.make
		ensure
			filtering: is_filtering
			acceptable_media_types_table_created: acceptable_media_types /= Void
			media_types_not_ignored: are_media_type_ignored = False
			namespace_bindings_stack_not_void: namespace_bindings_stack /= Void
		end

	add_media_type (a_media_type: UT_MEDIA_TYPE) is
			-- Add `a_media_type' to list of acceptable media types
		require
			filtering: is_filtering
			media_type_not_void: a_media_type /= Void
			not_previously_added: not has_media_type (a_media_type)
		do
			acceptable_media_types.force_new (a_media_type)
		ensure
			media_type_added: has_media_type (a_media_type)
		end

	add_standard_media_types is
			-- Add standard XPointer media types to list of acceptable media types
		require
			filtering: is_filtering
			no_acceptable_types: not any_types_added
		local
			a_media_type: UT_MEDIA_TYPE
		do
			create a_media_type.make ("text", "xml")
			add_media_type (a_media_type)
			create a_media_type.make ("text", "xml-external-parsed-entity")
			add_media_type (a_media_type)
			create a_media_type.make ("application", "xml")
			add_media_type (a_media_type)
			create a_media_type.make ("application", "xml-external-parsed-entity")
			add_media_type (a_media_type)
			create a_media_type.make ("application", "xhtml+xml")
			add_media_type (a_media_type)
			create a_media_type.make ("application", "xslt+xml")
			add_media_type (a_media_type)
		end

	allow_generic_xml_types (yes_or_no: BOOLEAN) is
			-- Allow or disallow all media types of form "application/*+xml"
		require
			filtering: is_filtering
		do
			generic_xml_types_allowed := yes_or_no
		ensure
			generic_types_set: generic_xml_types_allowed = yes_or_no
		end

	ignore_media_types is
			-- Ignore `media_type'.
		require
			filtering: is_filtering
		do
			are_media_type_ignored := True
		ensure
			media_types_ignored: are_media_type_ignored = True
		end

feature -- Document type definition callbacks

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		local
			an_attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			a_message: STRING
		do
			if is_filtering then
				if not attribute_types.has (an_element_name) then
					create an_attribute_table.make_with_equality_testers (7, Void, string_equality_tester)
					attribute_types.force (an_attribute_table, an_element_name)
				end
				an_attribute_table := attribute_types.item (an_element_name)
				check
					attribute_table_not_void: an_attribute_table /= Void
					-- because has() returned `True'
				end
				if an_attribute_table.has (a_name) then
					a_message := "Attribute "
					a_message.append_string (a_name)
					a_message.append_string (" already present for element ")
					a_message.append_string (an_element_name)
					on_error (a_message)
				else
					an_attribute_table.force (a_model, a_name)
				end
			end
			Precursor (an_element_name, a_name, a_model)
		end

feature -- Document

	on_start is
			-- Called when parsing starts.
		local
			ok_to_filter: BOOLEAN
		do
			if resolver.has_media_type then
				media_type := resolver.last_media_type
			else
				media_type := default_media_type -- which may still be `Void'
			end
			if is_filtering then
				is_forwarding := False
				is_forwarding_processing_instructions := True
				is_shorthand_found := False
				if is_error then
					on_error (error_message)
				else
					ok_to_filter := are_media_type_ignored
					if not ok_to_filter then
						if media_type /= Void then
							if has_media_type (media_type) then
								ok_to_filter := True
							elseif generic_xml_types_allowed then
								if media_type.subtype.count > 4 and then STRING_.same_string (media_type.type, "application") then
									ok_to_filter := STRING_.same_string (media_type.subtype.substring (media_type.subtype.count - 4, media_type.subtype.count), "+xml")
								end
							end
						end
					end
					if ok_to_filter then
						Precursor

						-- We forward comments PIs prior to the document element,
						--  as they might be needed for other purposes.

						is_forwarding := True
					else
						is_error := True
						error_message := Unacceptable_media_type
						on_error (error_message)
					end
				end
			else
				Precursor
			end
		end

	on_finish is
			-- Called when parsing finished
		do
			if not is_error then Precursor end
			is_shorthand_found := False
		end

feature -- Meta

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction.
		do

			-- Processing Instructions prior to the document element, and those within
			--  the selected element, will not be filtered out.

			if not is_filtering or else (is_forwarding_processing_instructions and then not is_error) then
				Precursor (a_name, a_content)
			end
		end

	on_comment (a_content: STRING) is
			-- Processing a comment.
		do
			if not is_filtering or else (is_forwarding and then is_shorthand_found and then not is_error) then
				Precursor (a_content)
			end
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
		local
			l_element_qname, l_prefix: STRING
		do
			if is_filtering then
				is_forwarding_processing_instructions := is_forwarding
				if not is_shorthand_found or is_shorthand_element then
					create namespace_bindings.make
					namespace_bindings_stack.put (namespace_bindings)
				end
			end
			if not is_filtering then
				Precursor (a_namespace, a_prefix, a_local_part)
			elseif not is_error then
				pending_namespace := Void; pending_prefix := Void; pending_local_part := Void
				if not is_shorthand_found then
					if a_prefix = Void then
						l_prefix := ""
					else
						l_prefix := a_prefix
					end
					is_forwarding := False; is_forwarding_processing_instructions := False
					pending_namespace := a_namespace; pending_prefix := a_prefix; pending_local_part := a_local_part
					create pending_attribute_namespaces.make
					create pending_attribute_prefixes.make
					create pending_attribute_local_parts.make
					create pending_attribute_values.make
					if l_prefix.count = 0 then
						l_element_qname := a_local_part
					else
						l_element_qname := STRING_.cloned_string (l_prefix)
						l_element_qname := STRING_.appended_string (l_element_qname, ":")
						l_element_qname := STRING_.appended_string (l_element_qname, a_local_part)
					end
					current_element_name := l_element_qname
				elseif is_forwarding then
					Precursor (a_namespace, a_prefix, a_local_part)
				end
			end
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Start of attribute.
		local
			an_attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			an_attribute_model: XM_DTD_ATTRIBUTE_CONTENT
			an_attribute_qname, an_xml_prefix: STRING
		do
			if is_filtering and (not is_shorthand_found or is_shorthand_element) then
				if a_namespace = Void and a_prefix = Void and STRING_.same_string (Xmlns, a_local_part) then
					namespace_bindings.bind ("", a_value)
				elseif a_namespace = Void and a_prefix /= Void and then STRING_.same_string (Xmlns, a_prefix) then
					namespace_bindings.bind (a_local_part, a_value)
				end
			end
			if not is_filtering or else is_forwarding then
				Precursor (a_namespace, a_prefix, a_local_part, a_value)
			elseif not is_error and then not is_shorthand_found then
				if a_prefix /= Void and then Xml_prefix.is_equal (a_prefix) and then Xml_id.is_equal (a_local_part) then
					is_shorthand_found := STRING_.same_string (shorthand, a_value)
					if is_shorthand_found then
						is_shorthand_element := True
					end
				else
					if attribute_types.has (current_element_name) then
						an_attribute_table := attribute_types.item (current_element_name)
						check
							attribute_table_not_void: an_attribute_table /= Void
							-- because `has' returned `True'
						end
						if a_prefix = Void then
							an_xml_prefix := ""
						else
							an_xml_prefix := a_prefix
						end
						if an_xml_prefix.count = 0 then
							an_attribute_qname := STRING_.cloned_string (a_local_part)
						else
							an_attribute_qname := STRING_.cloned_string (an_xml_prefix)
							an_attribute_qname := STRING_.appended_string (an_attribute_qname, ":")
							an_attribute_qname := STRING_.appended_string (an_attribute_qname, a_local_part)
						end
						if an_attribute_table.has (an_attribute_qname) then
							an_attribute_model := an_attribute_table.item (an_attribute_qname)
							check
								attribute_model_not_void: an_attribute_model /= Void
								-- because `has' returned `True'
							end
							if an_attribute_model.is_id then
								is_shorthand_found := STRING_.same_string (shorthand, a_value)
								if is_shorthand_found then
									is_shorthand_element := True
								end
							end
						end
					end
				end
				if is_shorthand_found then
					is_forwarding := True
					on_start_tag (pending_namespace, pending_prefix, pending_local_part)
					from
					until
						pending_attribute_namespaces.is_empty
					loop
						on_attribute (pending_attribute_namespaces.item, pending_attribute_prefixes.item, pending_attribute_local_parts.item, pending_attribute_values.item)
						pending_attribute_namespaces.remove; pending_attribute_prefixes.remove; pending_attribute_local_parts.remove; pending_attribute_values.remove
					end
					Precursor (a_namespace, a_prefix, a_local_part, a_value)
				else
					pending_attribute_namespaces.force (a_namespace); pending_attribute_prefixes.force (a_prefix);
					pending_attribute_local_parts.force (a_local_part); pending_attribute_values.force (a_value)
				end
			end
		end

	on_start_tag_finish is
			-- End of start tag.
		local
			l_namespaces: XM_XPOINTER_NAMESPACE_CONTEXT
			l_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
			l_prefix, l_uri: STRING
		do
			if is_shorthand_element then
				l_namespaces := namespace_bindings_stack.item
				from 
					namespace_bindings_stack.remove
				until
					namespace_bindings_stack.is_empty
				loop
					l_cursor := namespace_bindings_stack.item.namespace_cursor
					from l_cursor.start until l_cursor.after loop
						l_prefix := l_cursor.key
						l_uri := l_cursor.item
						if not l_namespaces.is_prefix_declared (l_prefix) then
							if l_prefix.is_empty then
								on_attribute (Void, Void, Xmlns, l_uri)
							else
								on_attribute (Void, Xmlns, l_prefix, l_uri)
							end
						end
						l_cursor.forth
					end
					namespace_bindings_stack.remove
				end
			end
			if not is_filtering or else is_forwarding then Precursor end
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- End tag.
		local
			an_element_qname, an_xml_prefix: STRING
		do
			if not is_filtering then
				Precursor (a_namespace, a_prefix, a_local_part)
			else
				if not is_shorthand_found then
					namespace_bindings_stack.remove
				end
				if is_forwarding then
					Precursor (a_namespace, a_prefix, a_local_part)
					if a_prefix = Void then
						an_xml_prefix := ""
					else
						an_xml_prefix := a_prefix
					end
					if an_xml_prefix.count = 0 then
						an_element_qname := a_local_part
					else
						an_element_qname := STRING_.cloned_string (an_xml_prefix)
						an_element_qname := STRING_.appended_string (an_element_qname, ":")
						an_element_qname := STRING_.appended_string (an_element_qname, a_local_part)
					end
					if STRING_.same_string (an_element_qname, current_element_name) then
						is_forwarding := False
						is_forwarding_processing_instructions := False
					end
				end
			end
			is_shorthand_element := False
		end

feature -- Content

	on_content (a_content: STRING) is
			-- Text content.
		do
			if not is_filtering or else is_forwarding then Precursor (a_content) end
		end

feature {NONE} -- Implementation

	error_message: STRING
			-- Error message from XPointer processing

	attribute_types: DS_HASH_TABLE [DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING], STRING]
			-- Stored attribute-type definitions per element name

	current_element_name: STRING
			-- QName of the current element;
			-- Used for tracking attribute types

	pending_namespace, pending_prefix, pending_local_part: STRING
			-- Start tag of shorthand element

	pending_attribute_namespaces: DS_LINKED_QUEUE [STRING]
			-- Namespaces of pending attributes


	pending_attribute_prefixes: DS_LINKED_QUEUE [STRING]
			-- prefixes of pending attributes


	pending_attribute_local_parts: DS_LINKED_QUEUE [STRING]
			-- Local parts of pending attributes

	pending_attribute_values: DS_LINKED_QUEUE [STRING]
			-- Values of pending attributes

	default_media_type: UT_MEDIA_TYPE
			-- Media type to use if resolver does not provide it

	resolver: XM_RESOLVER_MEDIA_TYPE
			-- Resolver for media type

	shorthand: STRING
			-- parsed shorthand pointer

	is_forwarding, is_forwarding_processing_instructions: BOOLEAN
			-- Are we forwarding non-DTD events?

	is_shorthand_found: BOOLEAN
			-- Have we found the shorthand element?

	is_shorthand_element: BOOLEAN
			-- Are we currently processing the shorthand-selected element?

	is_error: BOOLEAN
			-- Did XPointer processing flag an error?

	acceptable_media_types: DS_HASH_SET [UT_MEDIA_TYPE]
			-- Acceptable media types for current fragment-processing semantics

	namespace_bindings_stack: DS_LINKED_STACK [XM_XPOINTER_NAMESPACE_CONTEXT]
			-- Namespace declarations in scope

	namespace_bindings: XM_XPOINTER_NAMESPACE_CONTEXT
			-- Current namespace binding context

invariant

	resolver_not_void: resolver /= Void
	xpointer_error: is_error implies error_message /= Void
	attribute_types_not_void: attribute_types /= Void
	acceptable_media_types: is_filtering implies acceptable_media_types /= Void and then acceptable_media_types.equality_tester = media_type_tester

end

