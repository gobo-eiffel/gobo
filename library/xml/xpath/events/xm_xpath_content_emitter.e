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

	XM_CALLBACKS

	XM_DTD_CALLBACKS

	XM_XPATH_TYPE
	
	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

		-- XM_XPATH_CONTENT_EMITTER should come at the end of the event
		--  filter and dtd event filter chains.
		-- It should be preceded by the following filters in order:
		--  XM_UNICODE_VALIDATION_FILTER
		--  XM_WHITESPACE_NORMALIZER
		--  XM_CONTENT_CONCATENATOR
		--  XM_ATTRIBUTE_DEFAULT_FILTER (optional - may omit if no DTDs are used)
		--  XM_NAMESPACE_RESOLVER
		--  XM_STOP_ON_ERROR_FILTER

		-- This class makes some attempt to assign type-codes to attributes,
		--  based on the DTD.
		-- If the DTD is not present, then no type-codes can be assigned.
		-- N.B. No attempt is made to cope with prefix/namespace-uri aliasing.
		--      Only an exact match with the name declared in the DTD will work.
		--      This is a normal consequence of using DTDs with namespaces.
		--      Roll on a RELAX-NG validator!

creation

	make

feature {NONE} -- Initialization

	make (a_receiver: XM_XPATH_RECEIVER; a_name_pool: XM_XPATH_NAME_POOL) is
		-- Establish invariant
		require
				receiver_not_void: a_receiver /= Void
				name_pool_not_void: a_name_pool /= Void
		do
			before_dtd := True
			create attribute_types.make (7)
			receiver := a_receiver
			name_pool := a_name_pool
		ensure
			receiver_set: receiver = a_receiver
			name_pool_set: name_pool = a_name_pool
		end


feature -- Document type definition callbacks

	on_doctype (a_name: STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
			-- Document type declaration.
		do
			before_dtd := False
		end

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
			-- Element declaration.
		local
			an_attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			a_message: STRING
		do
			if attribute_types.has (a_name) then
				a_message := "Attribute table already present for element "
				a_message.append_string (a_name)
				on_error (a_message)
			end	
			create an_attribute_table.make_equal (7)
			if attribute_types.is_full then
				attribute_types.resize (attribute_types.count * 2)
			end
			attribute_types.put (an_attribute_table, a_name)
			-- In the future add support for element typing?
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		local
			an_attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			a_message: STRING
		do
			if not attribute_types.has (an_element_name) then
				a_message := "Attribute table not present for element "
				a_message.append_string (an_element_name)
				on_error (a_message)
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
			end
			if an_attribute_table.is_full then
				an_attribute_table.resize (an_attribute_table.count * 2)
			end
			an_attribute_table.put (a_model, a_name)
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
			do_nothing
		end

	on_dtd_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction within DTD.
		do
			do_nothing
		end

	on_dtd_comment (a_content: STRING) is
			-- Processing a comment within DTD.
		do
			do_nothing
		end

	on_dtd_end is
			-- End of DTD (last event in a document type).
		do
			do_nothing
		end
		
feature -- Document events

	on_start is
			-- Called when parsing starts.
		local
			a_document: XM_XPATH_DOCUMENT
		do
			a_document := receiver.start_document
		end

		on_finish is
			-- Called when parsing finished
		do
			receiver.end_document
		end

	on_xml_declaration (a_version: STRING; an_encoding: STRING; a_standalone: BOOLEAN) is
			-- XML declaration.
		do
			do_nothing
		end

feature -- Errors

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
			std.error.put_string ("XML parse error: ")
			std.error.put_string (a_message)
			std.error.put_new_line
		end

feature -- Meta

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction.
		do
			if before_dtd and STRING_.same_string (a_name, "xml-stylesheet") then
				-- TODO `a_content' names the stylesheet to use in the href pseudo-attribute
			end
			receiver.notify_processing_instruction (a_name, a_content, 0)
		end

	on_comment (a_content: STRING) is
			-- Processing a comment.
		do
			receiver.notify_comment (a_content, 0)
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; an_ns_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
		local
			a_name_code: INTEGER
			an_element_qname, a_prefix, a_message: STRING
		do
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
			
			if not name_pool.is_name_code_allocated (a_prefix, a_namespace, a_local_part) then
				if not name_pool.is_name_pool_full (a_namespace, a_local_part) then
					name_pool.allocate_name (a_prefix, a_namespace, a_local_part)
					a_name_code := name_pool.last_name_code
				else
					a_message := STRING_.appended_string ("Name pool has no room to allocate {", a_namespace)
					a_message := STRING_.appended_string (a_message, "}")
					a_message := STRING_.appended_string (a_message, a_local_part)
					on_error (a_message)
				end
			else
				a_name_code := name_pool.name_code (a_prefix, a_namespace, a_local_part) 
			end

			-- Element typing is not yet supported
			receiver.start_element (a_name_code, 0, 0)

			if a_prefix.count = 0 then
				an_element_qname := a_local_part
			else
				an_element_qname := clone (a_prefix)
				an_element_qname.append_character (':')
				an_element_qname.append_string (a_local_part)
			end

			current_element_name := an_element_qname
		end

	on_attribute (a_namespace: STRING; an_ns_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Start of attribute or namespace declaration
		local
			a_name_code, a_namespace_code: INTEGER
			a_prefix, a_namespace_prefix, a_message: STRING
		do
			if a_namespace = Void then
				on_error ("XM_XPATH_TINY_BUILDER requires namespace to be resolved")
			end
			if an_ns_prefix = Void then
				a_prefix := ""
			else
				a_prefix := an_ns_prefix
			end
			
			if not name_pool.is_name_code_allocated (a_prefix, a_namespace, a_local_part) then
				if not name_pool.is_name_pool_full (a_namespace, a_local_part) then
					name_pool.allocate_name (a_prefix, a_namespace, a_local_part)
					a_name_code := name_pool.last_name_code
				else
					a_message := STRING_.appended_string ("Name pool has no room to allocate {", a_namespace)
					a_message := STRING_.appended_string (a_message, "}")
					a_message := STRING_.appended_string (a_message, a_local_part)
					on_error (a_message)
				end
			else
				a_name_code := name_pool.name_code (a_prefix, a_namespace, a_local_part) 
			end

			debug ("XPath content emitter")
				std.error.put_string ("On_attribute: local name is ")
				std.error.put_string (a_local_part)
				std.error.put_string (", name code is ")
				std.error.put_string (a_name_code.out)
				std.error.put_new_line
			end
			if is_namespace_declaration (a_prefix, a_local_part) then

				-- Notify a namespace declaration

				if STRING_.same_string (a_local_part, "xmlns") then
					a_namespace_prefix := "" -- default namespace
				else
					a_namespace_prefix := a_local_part
				end
				if name_pool.is_namespace_code_allocated (a_namespace_prefix, a_value) then
					a_namespace_code := name_pool.namespace_code (a_namespace_prefix, a_value)
				else
					name_pool.allocate_namespace_code (a_namespace_prefix, a_value)
					a_namespace_code := name_pool.last_namespace_code
				end
				receiver.notify_namespace (a_namespace_code, 0)
			else
				notify_attribute (a_name_code, a_prefix, a_local_part, a_value)
			end
		end

	on_start_tag_finish is
			-- End of start tag.
		do
			receiver.start_content
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- End tag.
		do
			receiver.end_element
		end

feature -- Content

	on_content (a_content: STRING) is
			-- Text content;
			-- XM_CONTENT_CONCATENATOR is assumed to be present
			--  earlier in the event chain, so this event is
			--  atomic
		do
			receiver.notify_characters (a_content, 0)
		end

feature {NONE} -- Implementation

	receiver: XM_XPATH_RECEIVER
			-- The receiver to which we forward events

	name_pool: XM_XPATH_NAME_POOL
			-- The name pool

	current_element_name: STRING
			-- QName of the current element;
			-- Used for tracking attribute types

	attribute_types: DS_HASH_TABLE [DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING], STRING]
			-- Stored attribute-type definitions per element name
	
	before_dtd: BOOLEAN
			-- Has DTD been seen yet?

	is_namespace_declaration (an_ns_prefix, a_local_part: STRING): BOOLEAN is
			-- xmlns= or xmlns
		require
			prefix_not_void: an_ns_prefix /= Void
			local_part_not_void: a_local_part /= Void
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
		local
			an_attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			an_attribute_model: XM_DTD_ATTRIBUTE_CONTENT
			a_type_code: INTEGER -- should be INTEGER_16
			an_attribute_qname: STRING
		do
			if attribute_types.has (current_element_name) then
				an_attribute_table := attribute_types.item (current_element_name)
					check
						attribute_table_not_void: an_attribute_table /= Void
						-- because `has' returned `True'
					end
				if a_prefix.count = 0 then
					an_attribute_qname := clone (a_local_part)
				else
					an_attribute_qname := clone (a_prefix)
					an_attribute_qname.append_character (':')
					an_attribute_qname.append_string (a_local_part)
				end
					
				if an_attribute_table.has (an_attribute_qname) then
					an_attribute_model := an_attribute_table.item (an_attribute_qname)
						check
							attribute_model_not_void: an_attribute_model /= Void
							-- because `has' returned `True'
						end

					if an_attribute_model.is_id then
						a_type_code := Id_type
					elseif an_attribute_model.is_id_ref then
						a_type_code := Idref_type
					elseif an_attribute_model.is_token then
						a_type_code := Nmtoken_type
					elseif an_attribute_model.is_entity then
						a_type_code := Entity_type
					elseif an_attribute_model.is_notation then
						a_type_code := Notation_type
					else

						-- Ignore CDATA (it basically means "anySimpleType")
						-- Ignore NMTOKENS, ENTITIES, IDREFS: we can't handle list types yet

						a_type_code := 0 -- not a valid type code
					end
				end
			end
			receiver.notify_attribute (a_name_code, a_type_code, a_value, 0)
		end

invariant

	receiver_not_void: receiver /= Void
	name_pool_not_void: name_pool /= Void
	attribute_types_not_void: attribute_types /= Void

end
	
