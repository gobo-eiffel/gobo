indexing

	description:

		"Routines to implement the XPath doc() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOC_ROUTINES

inherit

	XM_XPATH_ISOLATION_LEVELS
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end
		
	UT_URL_ENCODING
		export {NONE} all end

feature -- Access

	last_evaluated_document: XM_XPATH_ITEM
			-- Result from `parse_document'

	last_evaluated_media_type: UT_MEDIA_TYPE
			-- Possible media-type set by `parse_document'

feature -- Evaluation
	
	parse_document (a_uri_reference: STRING; a_base_uri: UT_URI; a_context: XM_XPATH_CONTEXT) is
			-- Parse `a_uri_reference' as a document'.
		require
			uri_reference_not_void: a_uri_reference /= Void -- and then has no fragment-id
			base_uri_not_void: a_base_uri /= Void and then a_base_uri.is_absolute
			context_not_void: a_context /= Void
		local
			a_uri: UT_URI
			a_document: XM_XPATH_DOCUMENT
			a_message, an_iri_reference: STRING
		do
			an_iri_reference := escaped_uri (a_uri_reference)
			create a_uri.make_resolve (a_base_uri, an_iri_reference)
			if a_context.is_restricted then
				last_evaluated_document := Void
			elseif not a_context.security_manager.is_uri_permitted (a_uri) then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_document.make_from_string (STRING_.concat ("Security manager refused permission to read from ", a_uri.full_uri),
																												 Gexslt_eiffel_type_uri, "SECURITY", Dynamic_error)
			elseif a_context.available_documents.is_document_mapped (a_uri.full_reference) then
				last_evaluated_document := a_context.available_documents.document (a_uri.full_uri)
				last_evaluated_media_type := a_context.available_documents.media_type (a_uri.full_uri)
			elseif a_context.is_uri_written (a_uri.full_uri) then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_document.make_from_string (STRING_.concat (a_uri.full_uri, " has already been written to, so reading is not permitted"),
																												 Xpath_errors_uri, "XTRE1500", Dynamic_error)
			else
				a_context.build_document (a_uri.full_uri)
				if a_context.is_build_document_error then
					a_message := STRING_.concat ("Failed to parse ", a_uri.full_uri)
					a_message := STRING_.appended_string (a_message, ". ")
					a_message := STRING_.appended_string (a_message, a_context.last_build_error)
					create {XM_XPATH_INVALID_ITEM} last_evaluated_document.make_from_string (a_message, Xpath_errors_uri, "FODC0005", Dynamic_error)
					if a_context.available_documents.isolation_level = Serializable then
						a_context.available_documents.add (Void, Void, a_uri.full_uri)
					end
				else
					a_document := a_context.last_parsed_document
					last_evaluated_media_type := a_context.last_parsed_media_type
					last_evaluated_document := a_document
					if a_context.available_documents.isolation_level >= Repeatable_read then
						a_context.available_documents.add (a_document, last_evaluated_media_type, a_uri.full_uri)
					end
				end
			end
		end
	
	uri_encoding: UT_URL_ENCODING is
			-- Encoding/decoding routines and tests
		once
			create Result
		ensure
			uri_encoding_not_void: Result /= Void
		end
		
	escaped_uri (a_uri_string: STRING): STRING is
			-- Escaped version of `a_uri_string'
		require
			uri_string_not_void: a_uri_string /= Void
		do
			Result := escape_custom (utf8.to_utf8 (a_uri_string), unescaped_iri_characters, False)
		ensure
			escaped_uri_not_void: Result /= Void
		end

	unescaped_iri_characters: DS_HASH_SET [CHARACTER] is
			-- Characters not to escaped for fn:iri-to-uri()
		local
			a_character_set: STRING
		once
			a_character_set := STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_digit_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_mark_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_reserved_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_extra_reserved_characters)
			a_character_set := STRING_.appended_string (a_character_set, "#")
			a_character_set := STRING_.appended_string (a_character_set, "%%")
			Result := new_character_set (a_character_set)
		end

end
	
