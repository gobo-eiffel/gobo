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
	
	KL_SHARED_EXCEPTIONS
	
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

feature -- Initialization

	make (a_receiver: XM_XPATH_RECEIVER; a_name_pool: XM_XPATH_NAME_POOL) is
		-- Establish invariant
		require
				receiver_not_void: a_receiver /= Void
				name_pool_not_void: a_name_pool /= Void
		do
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
			do_nothing
		end

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
			-- Element declaration.
		local
			attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			exception_message: STRING
		do
			if attribute_types.has (a_name) then
				exception_message := "Attribute table already present for element "
				exception_message.append_string (a_name)
				Exceptions.raise (exception_message)
			end	
			create attribute_table.make_equal (7)
			attribute_types.force (attribute_table, a_name)
			-- In the future add support for element typing?
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		local
			attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			exception_message, attribute_type: STRING
		do
			if not attribute_types.has (an_element_name) then
				exception_message := "Attribute table not present for element "
				exception_message.append_string (an_element_name)
				Exceptions.raise (exception_message)
			end
			attribute_table := attribute_types.item (an_element_name)
				check
					attribute_table_not_void: attribute_table /= Void
					-- because has() returned `True'
				end
			if attribute_table.has (a_name) then
				exception_message := "Attribute "
				exception_message.append_string (a_name)
				exception_message.append_string (" already present for element ")
				exception_message.append_string (an_element_name)
				Exceptions.raise (exception_message)
			end

			attribute_table.force (a_model, a_name)
		end

	on_entity_declaration (entity_name: STRING; is_parameter: BOOLEAN; value: STRING;
		an_id: XM_DTD_EXTERNAL_ID; notation_name: STRING) is
			-- Entity declaration.
		local
			uri: STRING
		do
			if an_id /= Void and then notation_name /= Void then
					check
						not_a_parameter_declaration: is_parameter = False
					end
				-- TODO - create uri from an_id.system_id and an_id.base(?)
				create uri.make_from_string (an_id.system_id)
				receiver.set_unparsed_entity (entity_name, uri, an_id.public_id)
			end
		end

	on_notation_declaration (notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID) is
			-- Notation declaration.
		do
			do_nothing
		end

feature -- Document

	on_start is
			-- Called when parsing starts.
		do
			receiver.start_document
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
			-- TODO
		end

feature -- Meta

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction.
		do
			receiver.processing_instruction (a_name, a_content, 0)
		end

	on_comment (a_content: STRING) is
			-- Processing a comment.
		do
			receiver.comment (a_content, 0)
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; ns_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
		local
			name_code: INTEGER
			element_qname, a_prefix: STRING
		do
			if a_namespace = Void then
				Exceptions.raise ("XM_XPATH_CONTENT_EMITTER requires namespace to be resolved")
			end
			if a_local_part = Void then
				Exceptions.raise ("XM_XPATH_CONTENT_EMITTER requires a_local_part to be non-void")
			end			
			if ns_prefix = Void then
				a_prefix := ""
			else
				a_prefix := ns_prefix
			end
			
			if not name_pool.is_name_code_allocated (a_prefix, a_namespace, a_local_part) then
				name_pool.allocate_name (a_prefix, a_namespace, a_local_part)
				name_code := name_pool.last_name_code
			else
				name_code := name_pool.name_code (a_prefix, a_namespace, a_local_part) 
			end

			-- Element typing is not yet supported
			receiver.start_element (name_code, 0, 0)

			if a_prefix.count = 0 then
				element_qname := a_local_part
			else
				element_qname := a_prefix
				element_qname.append_character (':')
				element_qname.append_string (a_local_part)
			end

			current_element_name := element_qname
		end

	on_attribute (a_namespace: STRING; ns_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Start of attribute or namespace declaration
		local
			name_code, namespace_code: INTEGER
			the_type_code: INTEGER -- should be INTEGER_16
			attribute_qname, a_prefix: STRING
			attribute_table: DS_HASH_TABLE [XM_DTD_ATTRIBUTE_CONTENT, STRING]
			attribute_model: XM_DTD_ATTRIBUTE_CONTENT
		do
			if a_namespace = Void then
				Exceptions.raise ("XM_XPATH_TINY_BUILDER requires namespace to be resolved")
			end
			if ns_prefix = Void then
				a_prefix := ""
			else
				a_prefix := ns_prefix
			end
			
			if not name_pool.is_name_code_allocated (a_prefix, a_namespace, a_local_part) then
				name_pool.allocate_name (a_prefix, a_namespace, a_local_part)
				name_code := name_pool.last_name_code
			else
				name_code := name_pool.name_code (a_prefix, a_namespace, a_local_part) 
			end

			if is_namespace_declaration (a_prefix, a_local_part) then
				-- Notify a namespace declaration
				if name_pool.is_namespace_code_allocated (a_prefix, a_namespace) then
					namespace_code := name_pool.namespace_code (a_prefix, a_namespace)
				else
					name_pool.allocate_namespace_code (a_prefix, a_namespace)
					namespace_code := name_pool.last_namespace_code
				end
				receiver.namespace (namespace_code, 0)
			else
				-- Notify an attribute
				if attribute_types.has (current_element_name) then
					attribute_table := attribute_types.item (current_element_name)
						check
							attribute_table_not_void: attribute_table /= Void
							-- because `has' returned `True'
						end
					if a_prefix.count = 0 then
						create attribute_qname.make_from_string (a_local_part)
					else
						create attribute_qname.make_from_string (a_prefix)
						attribute_qname.append_character (':')
						attribute_qname.append_string (a_local_part)
					end
					
					if attribute_table.has (attribute_qname) then
						attribute_model := attribute_table.item (attribute_qname)
							check
								attribute_model_not_void: attribute_model /= Void
								-- because `has' returned `True'
							end

						if attribute_model.is_id then
							the_type_code := Id_type
						elseif attribute_model.is_id_ref then
							the_type_code := Idref_type
						elseif attribute_model.is_token then
							the_type_code := Nmtoken_type
						elseif attribute_model.is_entity then
							the_type_code := Entity_type
						elseif attribute_model.is_notation then
							the_type_code := Notation_type
						else
							-- Ignore CDATA (it basically means "anySimpleType")
							-- Ignore NMTOKENS, ENTITIES, IDREFS: we can't handle list types yet
							the_type_code := 0 -- not a valid type code
						end
					end
					receiver.attribute (name_code, the_type_code, a_value, 0)
				end
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
			receiver.characters (a_content, 0)
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
	
	is_namespace_declaration (ns_prefix, a_local_part: STRING): BOOLEAN is
			-- xmlns= or xmlns:
		do
			if ns_prefix.count = 0 and then a_local_part.is_equal ("xmlns") then
				Result := True
			elseif ns_prefix.is_equal ("xmlns") then
				Result := True
			end
		end

invariant

	receiver_not_void: receiver /= Void
	name_pool_not_void: name_pool /= Void
	attribute_types_not_void: attribute_types /= Void

end
	
