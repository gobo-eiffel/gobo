indexing

	description:

		"Objects that mediate between eiffel parser events and XPath receiver events"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTENT_EMITTER

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_CALLBACKS_FILTER
		redefine
			on_content, on_end_tag, on_error, on_processing_instruction,
			on_comment, on_start_tag, on_start_tag_finish, on_attribute,
			on_xml_declaration, on_finish, on_start
		end

	XM_DTD_CALLBACKS

	XM_XPATH_TYPE

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_NAME_UTILITIES
		export {NONE} all end

	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

		-- XM_XPATH_CONTENT_EMITTER should come at the end of the event
		--  filter and dtd event filter chains, except an
		--  XM_PARSER_STOP_ON_ERROR_FILTER must follow it.
		-- It should be preceded by the following filters in order:
		--  XM_UNICODE_VALIDATION_FILTER
		--  XM_WHITESPACE_NORMALIZER
		--  XM_CONTENT_CONCATENATOR
		--  XM_ATTRIBUTE_DEFAULT_FILTER (optional - may omit if no DTDs are used)
		--  XM_NAMESPACE_RESOLVER

		-- This class makes some attempt to assign type-codes to attributes,
		--  based on the DTD.
		-- If the DTD is not present, then no type-codes can be assigned.
		-- N.B. No attempt is made to cope with prefix/namespace-uri aliasing.
		--      Only an exact match with the name declared in the DTD will work.
		--      This is a normal consequence of using DTDs with namespaces.
		--      Roll on a RELAX-NG validator!

create

	make

feature {NONE} -- Initialization

	make (a_receiver: XM_XPATH_RECEIVER; a_callback: XM_CALLBACKS) is
		-- Establish invariant
		require
			receiver_not_void: a_receiver /= Void
			a_callback_not_void: a_callback /= Void
		do
			before_dtd := True
			create attribute_types.make_with_equality_testers (7, Void, string_equality_tester)
			receiver := a_receiver
			set_next (a_callback)
		ensure
			receiver_set: receiver = a_receiver
		end


feature -- Document type definition callbacks

	on_doctype (a_name: STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
			-- Document type declaration.
		do
			before_dtd := False
		end

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
			-- Element declaration.
		do
			-- In the future add support for element typing?
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		local
			an_attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			a_message: STRING
		do
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

	on_entity_declaration (an_entity_name: STRING; is_parameter: BOOLEAN; a_value: STRING;
		an_id: XM_DTD_EXTERNAL_ID; a_notation_name: STRING) is
			-- Entity declaration.
		do
			if an_id /= Void and then a_notation_name /= Void then
					check
						not_a_parameter_declaration: is_parameter = False
					end
				receiver.set_unparsed_entity (an_entity_name, an_id.system_id, an_id.public_id)
			end
		end

	on_notation_declaration (a_notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID) is
			-- Notation declaration.
		do
			-- do nothing
		end

	on_dtd_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction within DTD.
		do
			-- do nothing
		end

	on_dtd_comment (a_content: STRING) is
			-- Processing a comment within DTD.
		do
			-- do nothing
		end

	on_dtd_end is
			-- End of DTD (last event in a document type).
		do
			-- do nothing
		end
		
feature -- Document events

	on_start is
			-- Called when parsing starts.
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_start.%N")
			end
			receiver.open
			receiver.start_document
			Precursor
		end

	on_finish is
			-- Called when parsing finished
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_finish.%N")
			end
			receiver.end_document
			receiver.close
			Precursor
		end

	on_xml_declaration (a_version: STRING; an_encoding: STRING; a_standalone: BOOLEAN) is
			-- XML declaration.
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_xml_declaration; version is: ")
				std.error.put_string (a_version)
				std.error.put_string (", encoding is: ")
				std.error.put_string (an_encoding)
				std.error.put_string (", standalone is: ")
				std.error.put_string (a_standalone.out)
				std.error.put_new_line
			end
			Precursor (a_version, an_encoding, a_standalone)
		end

feature -- Errors

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_error: ")
				std.error.put_string (a_message)
				std.error.put_new_line
			end
			receiver.on_error (a_message)
			Precursor (a_message)
		end

feature -- Meta

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction.
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_processing_instruction target: ")
				std.error.put_string (a_name)
				std.error.put_string (", content: ")
				std.error.put_string (a_content)
				std.error.put_new_line
			end
			receiver.notify_processing_instruction (a_name, a_content, 0)
			Precursor (a_name, a_content)
		end

	on_comment (a_content: STRING) is
			-- Processing a comment.
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_comment: ")
				std.error.put_string (a_content)
				std.error.put_new_line
			end
			receiver.notify_comment (a_content, 0)
			Precursor (a_content)
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; an_ns_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
		local
			a_name_code: INTEGER
			an_element_qname, a_prefix, a_message: STRING
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_start_tag: local name is ")
				std.error.put_string (a_local_part)
				if an_ns_prefix /= Void then
					std.error.put_string (", prefix is ")
					std.error.put_string (an_ns_prefix)
				end
				std.error.put_string (", namespace is ")
				std.error.put_string (a_namespace)
				std.error.put_new_line
			end
			before_dtd := False
			if a_namespace = Void then
				on_error ("XM_XPATH_CONTENT_EMITTER requires namespace to be resolved")
			end
			if a_local_part = Void then
				on_error ("XM_XPATH_CONTENT_EMITTER requires a_local_part to be non-void")
			end
			if an_ns_prefix = Void then
				a_prefix := ""
			else
				a_prefix := an_ns_prefix
			end
			if not shared_name_pool.is_name_code_allocated (a_prefix, a_namespace, a_local_part) then
				if not shared_name_pool.is_name_pool_full (a_namespace, a_local_part) then
					shared_name_pool.allocate_name (a_prefix, a_namespace, a_local_part)
					a_name_code := shared_name_pool.last_name_code
				else
					a_message := STRING_.appended_string ("Name pool has no room to allocate {", a_namespace)
					a_message := STRING_.appended_string (a_message, "}")
					a_message := STRING_.appended_string (a_message, a_local_part)
					on_error (a_message)
				end
			else
				a_name_code := shared_name_pool.name_code (a_prefix, a_namespace, a_local_part)
			end

			-- Element typing is not yet supported
			receiver.start_element (a_name_code, 0, 0)

			if a_prefix.count = 0 then
				an_element_qname := a_local_part
			else
				an_element_qname := STRING_.cloned_string (a_prefix)
				an_element_qname := STRING_.appended_string (an_element_qname, ":")
				an_element_qname := STRING_.appended_string (an_element_qname, a_local_part)
			end

			current_element_name := an_element_qname
			Precursor (a_namespace, an_ns_prefix, a_local_part)
		end

	on_attribute (a_namespace: STRING; an_ns_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Start of attribute or namespace declaration
		local
			a_name_code, a_namespace_code: INTEGER
			a_prefix, a_namespace_prefix, a_message: STRING
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_attribute: namespace is ")
				std.error.put_string (a_namespace)
				if an_ns_prefix /= Void then
					std.error.put_string (", prefix is ")
					std.error.put_string (an_ns_prefix)
				end
				std.error.put_string (", local name is ")
				std.error.put_string (a_local_part)
				std.error.put_string (", value is ")
				std.error.put_string (a_value)
				std.error.put_string (", which is ")
				std.error.put_string (a_value.count.out)
				std.error.put_string (" characters long.")
				std.error.put_new_line
			end
			if a_namespace = Void then
				on_error ("XM_XPATH_RECEIVER requires namespace to be resolved")
			end
			if an_ns_prefix = Void then
				a_prefix := ""
			else
				a_prefix := an_ns_prefix
			end
			
			if not shared_name_pool.is_name_code_allocated (a_prefix, a_namespace, a_local_part) then
				if not shared_name_pool.is_name_pool_full (a_namespace, a_local_part) then
					shared_name_pool.allocate_name (a_prefix, a_namespace, a_local_part)
					a_name_code := shared_name_pool.last_name_code
				else
					a_message := STRING_.appended_string ("Name pool has no room to allocate {", a_namespace)
					a_message := STRING_.appended_string (a_message, "}")
					a_message := STRING_.appended_string (a_message, a_local_part)
					on_error (a_message)
				end
			else
				a_name_code := shared_name_pool.name_code (a_prefix, a_namespace, a_local_part) 
			end
			if is_namespace_declaration (a_prefix, a_local_part) then

				-- Notify a namespace declaration

				if STRING_.same_string (a_local_part, "xmlns") then
					a_namespace_prefix := "" -- default namespace
				else
					a_namespace_prefix := a_local_part
				end
				if shared_name_pool.is_namespace_code_allocated (a_namespace_prefix, a_value) then
					a_namespace_code := shared_name_pool.namespace_code (a_namespace_prefix, a_value)
				else
					shared_name_pool.allocate_namespace_code (a_namespace_prefix, a_value)
					a_namespace_code := shared_name_pool.last_namespace_code
				end
				receiver.notify_namespace (a_namespace_code, 0)
			else
				notify_attribute (a_name_code, a_prefix, a_local_part, a_value)
				Precursor (a_namespace, an_ns_prefix, a_local_part, a_value)
			end
		

		end

	on_start_tag_finish is
			-- End of start tag.
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_start_tag_finish.%N")
			end			
			receiver.start_content
			Precursor
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- End tag.
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_end_tag: local name is ")
				std.error.put_string (a_local_part)
				if a_prefix /= Void then
					std.error.put_string (", prefix is ")
					std.error.put_string (a_prefix)
				end
				std.error.put_string (", namespace is ")
				std.error.put_string (a_namespace)				
				std.error.put_new_line
			end
			receiver.end_element
			Precursor (a_namespace, a_prefix, a_local_part)
		end

feature -- Content

	on_content (a_content: STRING) is
			-- Text content;
			-- XM_CONTENT_CONCATENATOR is assumed to be present
			--  earlier in the event chain, so this event is
			--  atomic
		do
			debug ("XPath content emitter")
				std.error.put_string ("On_content: ")
				std.error.put_string (a_content)
				std.error.put_new_line
			end			
			receiver.notify_characters (a_content, 0)
			Precursor (a_content)
		end

feature {NONE} -- Implementation

	receiver: XM_XPATH_RECEIVER
			-- The receiver to which we forward events

	current_element_name: STRING
			-- QName of the current element;
			-- Used for tracking attribute types

	attribute_types: DS_HASH_TABLE [DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING], STRING]
			-- Stored attribute-type definitions per element name
	
	before_dtd: BOOLEAN
			-- Has DTD been seen yet?

	is_namespace_declaration (an_ns_prefix, a_local_part: STRING): BOOLEAN is
			-- Is attribute of form xmlns= or xmlns:prefix?
		require
			prefix_not_void: an_ns_prefix /= Void
			local_part_not_empty: a_local_part /= Void and then not a_local_part.is_empty
		do
			debug ("XPath content emitter")
				std.error.put_string ("Is_namespace_declaration: local name is ")
				std.error.put_string (a_local_part)
				std.error.put_string (", prefix is ")
				std.error.put_string (an_ns_prefix)
				std.error.put_new_line
			end			
			if an_ns_prefix.count = 0 and then STRING_.same_string (a_local_part, "xmlns") then
				Result := True
			elseif STRING_.same_string (an_ns_prefix, "xmlns") then
				Result := True
			end
			debug ("XPath content emitter")
				std.error.put_string ("Is_namespace_declaration: Result is ")
				std.error.put_string (Result.out)
				std.error.put_new_line
			end
		end

	notify_attribute (a_name_code: INTEGER; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Notify an attribute
		require
			prefix_exists: a_prefix /= Void
			local_part_not_empty: a_local_part /= Void and then not a_local_part.is_empty
		local
			an_attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			an_attribute_model: XM_DTD_ATTRIBUTE_CONTENT
			a_type_code: INTEGER -- should be INTEGER_16
			an_attribute_qname: STRING
		do
			if fingerprint_from_name_code (a_name_code) = Xml_id_type_code then
				a_type_code := Id_type_code
			elseif attribute_types.has (current_element_name) then
				an_attribute_table := attribute_types.item (current_element_name)
				check
					attribute_table_not_void: an_attribute_table /= Void
					-- because `has' returned `True'
				end
				if a_prefix.count = 0 then
					an_attribute_qname := STRING_.cloned_string (a_local_part)
				else
					an_attribute_qname := STRING_.cloned_string (a_prefix)
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
						a_type_code := Id_type_code
					elseif an_attribute_model.is_id_ref then
						if an_attribute_model.is_list_type then
							a_type_code := Idrefs_type_code
						else
							a_type_code := Idref_type_code
						end
					else
						a_type_code := 0 -- not a valid type code
					end
				end
			end
			receiver.notify_attribute (a_name_code, a_type_code, a_value, 0)
		end
	
invariant

	receiver_not_void: receiver /= Void
	attribute_types_not_void: attribute_types /= Void

end
	
