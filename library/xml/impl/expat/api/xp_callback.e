indexing

	description:

		"Class that makes the Expat 1.95 callbacks available."

	see_also:  "The other part of the API is available through XP_API."
	status:    "See notice at end of class."
	author:    "Andreas Leitner, Berend de Boer"

deferred class XP_CALLBACK

feature {NONE}

	on_element_declaration_procedure (name_ptr: POINTER; model_ptr: POINTER) is
			-- This is called for an element declaration. It's the
			-- caller's responsibility to free model when finished with
			-- it.
		deferred
		end

	on_attribute_declaration_procedure (elname_ptr, attname_ptr, att_type_ptr, dflt_ptr: POINTER; is_required: BOOLEAN) is
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

	on_xml_declaration_procedure (version_ptr, encoding_ptr: POINTER; standalone: INTEGER) is
			-- The XML declaration handler is called for *both* XML
			-- declarations and text declarations. The way to distinguish
			-- is that the version parameter will be null for text
			-- declarations. The encoding parameter may be null for XML
			-- declarations. The standalone parameter will be -1, 0, or 1
			-- indicating respectively that there was no standalone
			-- parameter in the declaration, that it was given as no, or
			-- that it was given as yes.
		deferred
		end

	on_entity_declaration_procedure (entity_name_ptr: POINTER; is_parameter_entity: BOOLEAN; value_ptr: POINTER; value_length: INTEGER; base_ptr, system_id_ptr, public_id_ptr, notation_name_ptr: POINTER) is
			-- This is called for entity declarations. The
			-- is_parameter_entity argument will be non-zero if the
			-- entity is a parameter entity, zero otherwise.
			-- For internal entities (<!ENTITY foo "bar">), value will be
			-- non-null and systemId, publicID, and notationName will be
			-- null. The value string is NOT null terminated; the length
			-- is provided in the value_length argument. Since it is
			-- legal to have zero-length values, do not use this argument
			-- to test for internal entities.
			-- For external entities, value will be null and systemId
			-- will be -- non-null. The publicId argument will be null
			-- unless a public -- identifier was provided. The
			-- notationName argument will have a -- non-null value only
			-- for unparsed entity declarations.
		deferred
		end

	on_start_tag_procedure (tag_name_ptr, attribute_specifications_ptr: POINTER) is
			-- atts is array of name/value pairs, terminated by 0
			-- names and values are 0 terminated.
		require
			tag_name_ptr_not_void: tag_name_ptr /= Void
			attribute_specifications_ptr_not_void: attribute_specifications_ptr /= Void
		deferred
		end

	on_end_tag_procedure (tag_name_ptr: POINTER) is
		deferred
		end

	on_content_procedure (content_ptr: POINTER; len: INTEGER) is
			-- s is not 0 terminated.
		deferred
		end

	on_processing_instruction_procedure (target, data: POINTER) is
			-- target and data are 0 terminated
		deferred
		end

	on_comment_procedure (data: POINTER) is
			-- data is 0 terminated
		deferred
		end

	on_start_cdata_section_procedure is
		deferred
		end

	on_end_cdata_section_procedure is
		deferred
		end

	on_default_procedure (data_ptr: POINTER; len: INTEGER) is
			-- This is called for any characters in the XML document for
			-- which there is no applicable handler.  This includes both
			-- characters that are part of markup which is of a kind that
			-- is not reported (comments, markup declarations), or
			-- characters that are part of a construct which could be
			-- reported but for which no handler has been supplied. The
			-- characters are passed exactly as they were in the XML
			-- document except that they will be encoded in UTF-8.  Line
			-- boundaries are not normalized.  Note that a byte order
			-- mark character is not passed to the default handler.
			-- There are no guarantees about how characters are divided
			-- between calls to the default handler: for example, a
			-- comment might be split between multiple calls.
		deferred
		end

	on_default_expanded_procedure (data_ptr: POINTER; len: INTEGER) is
			-- This is called for any characters in the XML document for
			-- which there is no applicable handler.  This includes both
			-- characters that are part of markup which is of a kind that
			-- is not reported (comments, markup declarations), or
			-- characters that are part of a construct which could be
			-- reported but for which no handler has been supplied. The
			-- characters are passed exactly as they were in the XML
			-- document except that they will be encoded in UTF-8.  Line
			-- boundaries are not normalized.  Note that a byte order
			-- mark character is not passed to the default handler.
			-- There are no guarantees about how characters are divided
			-- between calls to the default handler: for example, a
			-- comment might be split between multiple calls.
		deferred
		end

	on_start_doctype_procedure (doctype_name_ptr, sysid_ptr, pubid_ptr: POINTER; has_internal_subset: BOOLEAN) is
			-- This is called for the start of the DOCTYPE declaration,
			-- before any DTD or internal subset is parsed.
		deferred
		end

	on_end_doctype_procedure is
			-- This is called for the start of the DOCTYPE declaration
			-- when the closing > is encountered, but after processing
			-- any external subset.
		deferred
		end

	on_notation_declaration_procedure (notation_name_ptr, base_ptr, system_id_ptr, public_id_ptr: POINTER) is
			-- This is called for a declaration of notation.
			-- The base argument is whatever was set by XM_SetBase.
			-- The notationName will never be null. The other arguments can be.
		deferred
		end

	on_start_namespace_declaration_procedure (prefix_ptr, uri_ptr: POINTER) is
			-- When namespace processing is enabled, these are called
			-- once for each namespace declaration. The call to the start
			-- and end element handlers occur between the calls to the
			-- start and end namespace declaration handlers. For an xmlns
			-- attribute, prefix will be null. For an xmlns="" attribute,
			-- uri will be null.
		deferred
		end

	on_end_namespace_declaration_procedure (prefix_ptr: POINTER) is
		deferred
		end

	on_not_standalone_procedure: BOOLEAN is
			-- This is called if the document is not standalone (it has
			-- an external subset or a reference to a parameter entity,
			-- but does not have standalone="yes"). If this handler
			-- returns 0, then processing will not continue, and the
			-- parser will return a XM_ERROR_NOT_STANDALONE error.
		deferred
		end

	on_external_entity_reference_procedure (context_ptr, base_ptr, system_id_ptr, public_id_ptr: POINTER): BOOLEAN is
			-- This is called for a reference to an external parsed
			-- general entity.  The referenced entity is not
			-- automatically parsed. The application can parse it
			-- immediately or later using XM_ExternalEntityParserCreate.
			-- The parser argument is the parser parsing the entity
			-- containing the reference; it can be passed as the parser
			-- argument to XM_ExternalEntityParserCreate. The systemId
			-- argument is the system identifier as specified in the
			-- entity declaration;
			-- it will not be null.
			-- The base argument is the system identifier that should be
			-- used as the base for resolving systemId if systemId was
			-- relative; this is set by XM_SetBase; it may be null.
			-- The publicId argument is the public identifier as
			-- specified in the entity declaration, or null if none was
			-- specified; the whitespace in the public identifier will
			-- have been normalized as required by the XML spec.  The
			-- context argument specifies the parsing context in the
			-- format expected by the context argument to
			-- XM_ExternalEntityParserCreate; context is valid only
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

end -- class XP_CALLBACK

