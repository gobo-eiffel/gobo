note

	description:

		"Expat callbacks"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Andreas Leitner and others"
	license: "MIT License"

deferred class XM_EXPAT_CALLBACK

feature -- Callbacks

	on_element_declaration_procedure (name_ptr: POINTER; model_ptr: POINTER)
			-- This is called for an element declaration. It's the
			-- caller's responsibility to free model when finished with
			-- it.
		deferred
		end

	on_attribute_declaration_procedure (elname_ptr, attname_ptr, att_type_ptr, dflt_ptr: POINTER; is_required: BOOLEAN)
			-- The Attlist declaration handler is called for *each*
			-- attribute. So a single Attlist declaration with multiple
			-- attributes declared will generate multiple calls to this
			-- handler. The "default" parameter may be NULL in the case
			-- of the "#IMPLIED" or "#REQUIRED" keyword. The "isrequired"
			-- parameter will be true and the default value will be NULL
			-- in the case of "#REQUIRED". If "isrequired" is true and
			-- default is non-NULL, then this is a "#FIXED" default.
		deferred
		end

	on_xml_declaration_procedure (version_ptr, encoding_ptr: POINTER; standalone: INTEGER)
			-- The XML declaration handler is called for *both* XML
			-- declarations and text declarations. The way to distinguish
			-- is that the version parameter will be null for text
			-- declarations. The encoding parameter may be null for XML
			-- declarations. The `standalone' parameter will be -1, 0, or 1
			-- indicating respectively that there was no standalone
			-- parameter in the declaration, that it was given as no, or
			-- that it was given as yes.
		deferred
		end

	on_entity_declaration_procedure (entity_name_ptr: POINTER; is_parameter_entity: BOOLEAN; value_ptr: POINTER; value_length: INTEGER; base_ptr, system_id_ptr, public_id_ptr, notation_name_ptr: POINTER)
			-- This is called for entity declarations. The
			-- `is_parameter_entity' argument will be non-zero if the
			-- entity is a parameter entity, zero otherwise.
			-- For internal entities (<!ENTITY foo "bar">), `value_ptr' will be
			-- non-null and `system_id_ptr', `public_id_ptr', and `notation_name_ptr'
			-- will be null. The `value_ptr' string is NOT null terminated; the length
			-- is provided in the `value_length' argument. Since it is
			-- legal to have zero-length values, do not use this argument
			-- to test for internal entities.
			-- For external entities, `value_ptr' will be null and `system_id_ptr'
			-- will be non-null. The `public_id_ptr' argument will be null
			-- unless a public identifier was provided. The `notation_name_ptr'
			-- argument will have a non-null value only for unparsed entity declarations.
		deferred
		end

	on_start_tag_procedure (tag_name_ptr, attribute_specifications_ptr: POINTER)
		require
			tag_name_ptr_not_void: tag_name_ptr /= default_pointer
			attribute_specifications_ptr_not_void: attribute_specifications_ptr /= default_pointer
		deferred
		end

	on_end_tag_procedure (tag_name_ptr: POINTER)
		deferred
		end

	on_content_procedure (content_ptr: POINTER; len: INTEGER)
			-- `content_ptr' is not 0 terminated.
		deferred
		end

	on_processing_instruction_procedure (target, data: POINTER)
			-- `target' and `data' are 0 terminated.
		deferred
		end

	on_comment_procedure (data: POINTER)
			-- `data' is 0 terminated.
		deferred
		end

	on_start_cdata_section_procedure
		deferred
		end

	on_end_cdata_section_procedure
		deferred
		end

	on_default_procedure (data_ptr: POINTER; len: INTEGER)
			-- This is called for any characters in the XML document for
			-- which there is no applicable handler. This includes both
			-- characters that are part of markup which is of a kind that
			-- is not reported (comments, markup declarations), or
			-- characters that are part of a construct which could be
			-- reported but for which no handler has been supplied. The
			-- characters are passed exactly as they were in the XML
			-- document except that they will be encoded in UTF-8. Line
			-- boundaries are not normalized. Note that a byte order
			-- mark character is not passed to the default handler.
			-- There are no guarantees about how characters are divided
			-- between calls to the default handler: for example, a
			-- comment might be split between multiple calls.
		deferred
		end

	on_default_expanded_procedure (data_ptr: POINTER; len: INTEGER)
			-- This is called for any characters in the XML document for
			-- which there is no applicable handler. This includes both
			-- characters that are part of markup which is of a kind that
			-- is not reported (comments, markup declarations), or
			-- characters that are part of a construct which could be
			-- reported but for which no handler has been supplied. The
			-- characters are passed exactly as they were in the XML
			-- document except that they will be encoded in UTF-8. Line
			-- boundaries are not normalized. Note that a byte order
			-- mark character is not passed to the default handler.
			-- There are no guarantees about how characters are divided
			-- between calls to the default handler: for example, a
			-- comment might be split between multiple calls.
		deferred
		end

	on_start_doctype_procedure (doctype_name_ptr, sysid_ptr, pubid_ptr: POINTER; has_internal_subset: BOOLEAN)
			-- This is called for the start of the DOCTYPE declaration,
			-- before any DTD or internal subset is parsed.
		deferred
		end

	on_end_doctype_procedure
			-- This is called for the start of the DOCTYPE declaration
			-- when the closing > is encountered, but after processing
			-- any external subset.
		deferred
		end

	on_notation_declaration_procedure (notation_name_ptr, base_ptr, system_id_ptr, public_id_ptr: POINTER)
			-- This is called for a declaration of notation.
			-- The `base_ptr' argument is whatever was set by XML_SetBase.
			-- The `notation_name_ptr' will never be null. The other arguments can be.
		deferred
		end

	on_start_namespace_declaration_procedure (prefix_ptr, uri_ptr: POINTER)
			-- When namespace processing is enabled, these are called
			-- once for each namespace declaration. The calls to the start
			-- and end element handlers occur between the calls to the
			-- start and end namespace declaration handlers. For an xmlns
			-- attribute, prefix will be null. For an xmlns="" attribute,
			-- uri will be null.
		deferred
		end

	on_end_namespace_declaration_procedure (prefix_ptr: POINTER)
		deferred
		end

	on_not_standalone_procedure: BOOLEAN
			-- This is called if the document is not standalone (it has
			-- an external subset or a reference to a parameter entity,
			-- but does not have standalone="yes"). If this handler
			-- returns 0, then processing will not continue, and the
			-- parser will return a XM_ERROR_NOT_STANDALONE error.
		deferred
		end

	on_external_entity_reference_procedure (context_ptr, base_ptr, system_id_ptr, public_id_ptr: POINTER): BOOLEAN
			-- This is called for a reference to an external parsed
			-- general entity. The referenced entity is not
			-- automatically parsed. The application can parse it
			-- immediately or later using XML_ExternalEntityParserCreate.
			-- The parser argument is the parser parsing the entity
			-- containing the reference; it can be passed as the parser
			-- argument to XML_ExternalEntityParserCreate. The `system_id_ptr'
			-- argument is the system identifier as specified in the
			-- entity declaration;
			-- it will not be null.
			-- The base argument is the system identifier that should be
			-- used as the base for resolving `system_id_ptr' if `system_id_ptr' was
			-- relative; this is set by XML_SetBase; it may be null.
			-- The `public_id_ptr' argument is the public identifier as
			-- specified in the entity declaration, or null if none was
			-- specified; the whitespace in the public identifier will
			-- have been normalized as required by the XML spec.  The
			-- `context_ptr' argument specifies the parsing context in the
			-- format expected by the `context_ptr' argument to
			-- XML_ExternalEntityParserCreate; `context_ptr' is valid only
			-- until the handler returns, so if the referenced entity is
			-- to be parsed later, it must be copied.
			-- The handler should return 0 if processing should not
			-- continue because of a fatal error in the handling of the
			-- external entity.
			-- In this case the calling parser will return an
			-- XM_ERROR_EXTERNAL_ENTITY_HANDLING error.
			-- Note that unlike other handlers the first argument is the
			-- parser, not userData.
		deferred
		end

end
