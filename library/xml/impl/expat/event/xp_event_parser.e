indexing

	description:

		"Class for parsing XML documents using Expat."

	status: "See notice at end of class."
	author: "Leitner"

class XP_EVENT_PARSER
	-- TODO: this is a duplicate of XP_EVENT_PARSER which
	-- it should replace.

inherit

	XI_EVENT_PARSER

	XP_EXPAT_API
		export {NONE} all end

	XP_CALLBACK

	-- mainly here to silence SE warning about "Empty Cecil/Wrapper ..."
	XP_ENCODING_CALLBACK

	MEMORY
		redefine
			dispose
		end

	EXCEPTIONS

	XM_ERROR_CODES

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new parser.
		do
			init_api
		end

feature {NONE} -- Gc

	dispose is
		do
			if is_parser_created then
				free_parser
			end
		end

feature {ANY} -- Access

	is_incremental: BOOLEAN is True

	source: XM_SOURCE
			-- source of the xml document beeing parsed.
			-- if void the source is unkown.

	version: STRING is
			-- return the library version string (e.g. "expat_1.95.1").
		local
			ucversion: UC_STRING
		do
			ucversion := new_uc_string_from_c_utf8_zero_terminated_string (exml_XML_ExpatVersion)
			Result := ucversion.out
		end

feature {ANY} -- Element change

	set_relative_URI_base (a_base: UC_STRING) is
			-- sets the base to be used for resolving URIs in system identifiers
			-- in declarations.
			-- NOTE: Is this applicable to all the different parsers out
			-- there?
			-- BdB: I don't think so
		require
			parser_created: is_parser_created
			valid_base: a_base /= Void and not a_base.empty
		local
			r: BOOLEAN
		do
				-- don't have a way yet to turn UC_STRING to pointer...
			r := exml_XML_SetBase_string (item, a_base.to_utf8)
			if not r then
				raise ("Expat out of memory.%N")
			end
		ensure
			a_base.is_equal (relative_URI_base)
		end

	relative_URI_base: UC_STRING is
			-- returns the base.
		require
			parser_created: is_parser_created
		local
			base_ptr: POINTER
		do
			base_ptr := exml_XML_GetBase (item)
			Result := new_uc_string_from_c_utf8_zero_terminated_string (base_ptr)
		ensure
			result_not_void: Result /= Void
		end

	set_source (a_source: XM_SOURCE) is
			-- set the source of the xml document to parse.
		do
			source := a_source
		end

feature {ANY} -- Parsing

	parse_from_file_name (a_file_name: UC_STRING) is
			-- Parse XML Document from file
		local
			in_file: KL_TEXT_INPUT_FILE
		do
			!! in_file.make (a_file_name.to_utf8)
			in_file.open_read
			check
				file_is_open: in_file.is_open_read
			end
			parse_from_stream (in_file)
			in_file.close
		end

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
		do
			create_new_parser
			parse_incremental_from_stream (a_stream)
			set_end_of_document
		end

	parse_from_string (a_string: STRING) is
		do
			create_new_parser
			parse_incremental_from_string (a_string)
			set_end_of_document
		end

feature {ANY} -- Incremental parsing

	parse_incremental_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse partial XML document from GOBO input stream.
			-- After the last part of the data has been fed into the parser,
			-- call set_end_of_document to get any pending error messages.
		local
			uri: UC_STRING
		do
			uri := new_unicode_string (a_stream.name)
			!XM_DEFAULT_URI_SOURCE! source.make (uri)
			from
				a_stream.read_string (read_block_size)
			until
				a_stream.end_of_input
			loop
				parse_string_and_set_error (a_stream.last_string, False)
				a_stream.read_string (read_block_size)
			end
		end

	parse_incremental_from_string (data: STRING) is
		local
			uri: UC_STRING
		do
			uri := new_unicode_string ("STRING")
			!XM_DEFAULT_URI_SOURCE! source.make (uri)
			parse_string_and_set_error (data, False)
		end

	set_end_of_document is
		do
			parse_string_and_set_error ("", True)
		end

feature {NONE} -- Low level parsing

	parse_string_and_set_error (data: STRING; is_final: BOOLEAN) is
			-- parse `data' (which may be empty).
			-- set the error flags according to result.
			-- `is_final' signals end of data input.
		require
			created: is_parser_created
			data_not_void: data /= Void
		local
			int_result: INTEGER
		do
				-- function call with side effect...
			int_result := exml_XML_Parse_string (item, data, is_final)
			set_error_from_parse_result (int_result)
		end

	set_error_from_parse_result (i: INTEGER) is
			-- sets error flags according to `i',
			-- where `i' must be the result of a call to expats
			-- XML_Parser function.
		local
			error: BOOLEAN
		do
			error := i = 0
			if error then
				last_error := Xml_err_unknown
				last_internal_error := exml_XML_GetErrorCode (item)
			end
		end

feature {ANY} -- Status

	file_name: UC_STRING
			-- currently parsed file. If information is not available or
			-- data does not origin from a file, this is void

	last_error: INTEGER

	last_error_description: STRING is
		do
			Result := new_string_from_c_zero_terminated_string (exml_XML_ErrorString (last_internal_error))
		end

	last_line_number: INTEGER is
		do
			Result := exml_XML_GetCurrentLineNumber (item) + 1
		ensure
			valid_result: Result >= 1
		end

	last_column_number: INTEGER is
		do
			Result := exml_XML_GetCurrentColumnNumber (item) + 1
		ensure
			valid_result: Result >= 1
		end

	last_byte_index: INTEGER is
		do
			Result := exml_XML_GetCurrentByteIndex (item) + 1
		ensure
			valid_result: Result >= 1
		end

	position: XM_POSITION is
		do
			!XM_DEFAULT_POSITION! Result.make (source, last_byte_index, last_column_number, last_line_number)
		end

feature {NONE} -- Implementation

	last_internal_error: INTEGER
			-- Expat specific error code

	read_block_size: INTEGER is 10240
			-- 10 kB

feature {NONE} -- Parser handle handling

	item: POINTER
			-- points to expat parser c-handle

	create_default_parser is
			-- override to create other default parser
		do
				-- item := exml_XML_ParserCreateNS (default_pointer, ':')
			debug ("EXPAT")
				print ("create parser%N")
			end
			item := exml_XML_ParserCreate (default_pointer)
			if item = default_pointer then
				raise ("Failure to create parser with XML_ParserCreate.")
			end
			set_callback_object (item, Current)
				-- we need a smarter way to set callbacks. What callbacks you
				-- want should be determined by the client
				-- perhaps override on_xml_declaration to give client chance
				-- to set callback and at the same time with a known handle?
			register_default_callbacks
		ensure
			created: is_parser_created
		end

	create_new_parser is
			-- creates a new parser, existing parser is freed
		do
			if is_parser_created then
				free_parser
			end
			create_default_parser
		ensure
			created: is_parser_created
		end

	free_parser is
			-- free parser, make callback, if any, available to gc
		require
			created: is_parser_created
		do
				-- don't forget to free the callback
			debug ("EXPAT")
				print ("free parser%N")
			end
			set_callback_object (item, Void)
			exml_XML_ParserFree (item)
			item := default_pointer
		ensure
			not_created: not is_parser_created
		end

feature -- Callback registering, should be in xi_event_parser

	is_parser_created: BOOLEAN is
			-- True if parser has been created
		do
			Result := item /= default_pointer
		end

	register_default_callbacks is
			-- default callbacks, override to register more or less handlers
		require
			created: is_parser_created
		do
				-- required if you want to give people a chance to set their
				-- own callbacks
			exml_XML_SetXmlDeclHandler (item, $on_xml_declaration_procedure)
				-- people usually only want tags and data
			exml_XML_SetElementHandler (item, $on_start_tag_procedure, $on_end_tag_procedure)
			exml_XML_SetCharacterDataHandler (item, $on_content_procedure)
			exml_XML_SetProcessingInstructionHandler (item, $on_processing_instruction_procedure)
			exml_XML_SetCommentHandler (item, $on_comment_procedure)
		end

	register_all_callbacks is
			-- mainly for debugging purposes
		require
			created: is_parser_created
		do
			register_element_declaration_handler
			register_attribute_declaration_handler
			exml_XML_SetXmlDeclHandler (item, $on_xml_declaration_procedure)
			exml_XML_SetEntityDeclHandler (item, $on_entity_declaration_procedure)
			exml_XML_SetElementHandler (item, $on_start_tag_procedure, $on_end_tag_procedure)
			exml_XML_SetCharacterDataHandler (item, $on_content_procedure)
			exml_XML_SetProcessingInstructionHandler (item, $on_processing_instruction_procedure)
			exml_XML_SetCommentHandler (item, $on_comment_procedure)
			exml_XML_SetCdataSectionHandler (item, $on_start_cdata_section_procedure, $on_end_cdata_section_procedure)
			exml_XML_SetDefaultHandler (item, $on_default_procedure)
			exml_XML_SetDefaultHandlerExpand (item, $on_default_expanded_procedure)
			register_doctype_handler
			exml_XML_SetNotationDeclHandler (item, $on_notation_declaration_procedure)
			exml_XML_SetNamespaceDeclHandler (item, $on_start_namespace_declaration_procedure, $on_end_namespace_declaration_procedure)
			exml_XML_SetNotStandaloneHandler (item, $on_not_standalone_procedure)
		end

	register_doctype_handler is
		require
			created: is_parser_created
		do
			exml_XML_SetDoctypeDeclHandler (item, $on_start_doctype_procedure, $on_end_doctype_procedure)
		end

	register_element_declaration_handler is
		require
			created: is_parser_created
		do
			exml_XML_SetElementDeclHandler (item, $on_element_declaration_procedure)
		end

	register_attribute_declaration_handler is
		require
			created: is_parser_created
		do
			exml_XML_SetAttlistDeclHandler (item, $on_attribute_declaration_procedure)
		end

feature -- Callback unregistering, should be in xi_event_parser

	unregister_all_callbacks is
			-- quite useful when an error has been found, and you want to
			-- stop processing things. There doesn't seem to be a way to
			-- signal the parser, but unregistering everything has the
			-- same effect for the client class.
		require
			created: is_parser_created
		do
			exml_XML_SetElementDeclHandler (item, default_pointer)
			exml_XML_SetAttlistDeclHandler (item, default_pointer)
			exml_XML_SetXmlDeclHandler (item, default_pointer)
			exml_XML_SetEntityDeclHandler (item, default_pointer)
			exml_XML_SetElementHandler (item, default_pointer, default_pointer)
			exml_XML_SetCharacterDataHandler (item, default_pointer)
			exml_XML_SetProcessingInstructionHandler (item, default_pointer)
			exml_XML_SetCommentHandler (item, default_pointer)
			exml_XML_SetCdataSectionHandler (item, default_pointer, default_pointer)
			exml_XML_SetDefaultHandler (item, default_pointer)
			exml_XML_SetDefaultHandlerExpand (item, default_pointer)
			exml_XML_SetDoctypeDeclHandler (item, default_pointer, default_pointer)
			exml_XML_SetNotationDeclHandler (item, default_pointer)
			exml_XML_SetNamespaceDeclHandler (item, default_pointer, default_pointer)
			exml_XML_SetNotStandaloneHandler (item, default_pointer)
			exml_XML_SetExternalEntityRefHandler (item, default_pointer)
		end

feature -- Parsing parameter entities including the external dtd subset

	disable_parameter_entity_parsing is
		require
			created: is_parser_created
		local
			r: BOOLEAN
		do
			r := exml_XML_SetParamEntityParsing (item, XML_PARAM_ENTITY_PARSING_NEVER)
			exml_XML_SetExternalEntityRefHandler (item, default_pointer)
		end

	enable_parameter_entity_parsing is
		require
			created: is_parser_created
		local
			r: BOOLEAN
		do
			r := exml_XML_SetParamEntityParsing (item, XML_PARAM_ENTITY_PARSING_ALWAYS)
			if not r then
				raise ("Library compiled without support for parameter %
					%entity parsing (ie XML_DTD not defined).%N")
			end
			exml_XML_SetExternalEntityRefHandler (item, $on_external_entity_reference_procedure)
		end

feature {NONE} -- (low level) frozen callbacks (called from exml clib)

	frozen on_element_declaration_procedure (name_ptr: POINTER; model_ptr: POINTER) is
		local
			name: UC_STRING
		do
			name := new_uc_string_from_c_utf8_zero_terminated_string (name_ptr)
			on_element_declaration (name, model_ptr)
		end

	frozen on_attribute_declaration_procedure (elname_ptr, attname_ptr, att_type_ptr, dflt_ptr: POINTER; is_required: BOOLEAN) is
		local
			elname, attname, att_type, dflt: UC_STRING
		do
			elname := new_uc_string_from_c_utf8_zero_terminated_string (elname_ptr)
			attname := new_uc_string_from_c_utf8_zero_terminated_string (attname_ptr)
			att_type := new_uc_string_from_c_utf8_zero_terminated_string (att_type_ptr)
			dflt := new_uc_string_from_c_utf8_zero_terminated_string_safe (dflt_ptr)
			on_attribute_declaration (elname, attname, att_type, dflt, is_required)
		end

	frozen on_xml_declaration_procedure (version_ptr, encoding_ptr: POINTER; standalone: INTEGER) is
		local
			ucversion, ucencoding: UC_STRING
			bool_standalone: BOOLEAN
		do
			ucversion := new_uc_string_from_c_utf8_zero_terminated_string (version_ptr)
			ucencoding := new_uc_string_from_c_utf8_zero_terminated_string_safe (encoding_ptr)
			if standalone = 1 then
				bool_standalone := True
			end
			on_xml_declaration (ucversion, ucencoding, bool_standalone)
		end

	frozen on_entity_declaration_procedure (entity_name_ptr: POINTER; is_parameter_entity: BOOLEAN; value_ptr: POINTER; value_length: INTEGER; base_ptr, system_id_ptr, public_id_ptr, notation_name_ptr: POINTER) is
		local
			entity_name: UC_STRING
			value: UC_STRING
			base: UC_STRING
			system_id: UC_STRING
			public_id: UC_STRING
			notation_name: UC_STRING
		do
			entity_name := new_uc_string_from_c_utf8_zero_terminated_string (entity_name_ptr)
			value := new_uc_string_from_c_utf8_zero_terminated_string_safe (value_ptr)
			base := new_uc_string_from_c_utf8_zero_terminated_string_safe (base_ptr)
			system_id := new_uc_string_from_c_utf8_zero_terminated_string_safe (system_id_ptr)
			public_id := new_uc_string_from_c_utf8_zero_terminated_string_safe (public_id_ptr)
			notation_name := new_uc_string_from_c_utf8_zero_terminated_string_safe (notation_name_ptr)
			on_entity_declaration (entity_name, is_parameter_entity, value, value_length, base, system_id, public_id, notation_name)
		end

	frozen on_start_tag_procedure (tag_name_ptr, attribute_specifications_ptr: POINTER) is
		local
			a_name: UC_STRING
			a_prefix: UC_STRING
			colon_index: INTEGER
			att_list: DS_BILINKED_LIST [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]
		do
			a_name := new_uc_string_from_c_utf8_zero_terminated_string (tag_name_ptr)
			colon_index := a_name.substring_index (uc_colon, 1)
			if colon_index /= 0 then
				a_prefix := a_name.substring (1, colon_index - 1)
				a_name := a_name.substring (colon_index + 1, a_name.count)
			else
				!! a_prefix.make (0)
			end
			att_list := new_attribute_list_from_c (attribute_specifications_ptr)
			on_start_tag (a_name, a_prefix, att_list)
		end

	frozen on_end_tag_procedure (tag_name_ptr: POINTER) is
		local
			a_name: UC_STRING
			a_prefix: UC_STRING
			colon_index: INTEGER
		do
			a_name := new_uc_string_from_c_utf8_zero_terminated_string (tag_name_ptr)
			colon_index := a_name.substring_index (uc_colon, 1)
			if colon_index /= 0 then
				a_prefix := a_name.substring (1, colon_index - 1)
				a_name := a_name.substring (colon_index + 1, a_name.count)
			else
				!! a_prefix.make (0)
			end
			on_end_tag (a_name, a_prefix)
		end

	frozen on_content_procedure (chr_data_ptr: POINTER; len: INTEGER) is
		local
			chr_data: UC_STRING
		do
			chr_data := new_uc_string_from_c_utf8_runlength_string (chr_data_ptr, len)
			on_content (chr_data)
		end

	frozen on_processing_instruction_procedure (target_ptr, data_ptr: POINTER) is
		local
			target, data: UC_STRING
		do
			target := new_uc_string_from_c_utf8_zero_terminated_string_safe (target_ptr)
			if data_ptr = Void then
				create data.make (0)
			else
				data := new_uc_string_from_c_utf8_zero_terminated_string (data_ptr)
			end
			on_processing_instruction (target, data)
		end

	frozen on_comment_procedure (data_ptr: POINTER) is
			-- data is a 0 terminated C string
		local
			comment: UC_STRING
		do
			comment := new_uc_string_from_c_utf8_zero_terminated_string (data_ptr)
			on_comment (comment)
		end

	frozen on_start_cdata_section_procedure is
		do
			on_start_cdata_section
		end

	frozen on_end_cdata_section_procedure is
		do
			on_end_cdata_section
		end

	frozen on_default_procedure (data_ptr: POINTER; len: INTEGER) is
		local
			data: UC_STRING
		do
			data := new_unicode_string_from_utf8 (new_string_from_c_runlength_string (data_ptr, len))
			on_default (data)
		end

	frozen on_default_expanded_procedure (data_ptr: POINTER; len: INTEGER) is
		local
			data: UC_STRING
		do
			data := new_unicode_string_from_utf8 (new_string_from_c_runlength_string (data_ptr, len))
			on_default_expanded (data)
		end

	frozen on_start_doctype_procedure (doctype_name_ptr, sysid_ptr, pubid_ptr: POINTER; has_internal_subset: BOOLEAN) is
		local
			name, system_id, public_id: UC_STRING
		do
			name := new_uc_string_from_c_utf8_zero_terminated_string (doctype_name_ptr)
			system_id := new_uc_string_from_c_utf8_zero_terminated_string_safe (sysid_ptr)
			public_id := new_uc_string_from_c_utf8_zero_terminated_string_safe (pubid_ptr)
			on_start_doctype (name, system_id, public_id, has_internal_subset)
		end

	frozen on_end_doctype_procedure is
		do
			on_end_doctype
		end

	frozen on_notation_declaration_procedure (notation_name_ptr, base_ptr, system_id_ptr, public_id_ptr: POINTER) is
		local
			notation_name: UC_STRING
			base: UC_STRING
			system_id: UC_STRING
			public_id: UC_STRING
		do
			notation_name := new_uc_string_from_c_utf8_zero_terminated_string (notation_name_ptr)
			base := new_uc_string_from_c_utf8_zero_terminated_string_safe (base_ptr)
			system_id := new_uc_string_from_c_utf8_zero_terminated_string_safe (system_id_ptr)
			public_id := new_uc_string_from_c_utf8_zero_terminated_string_safe (public_id_ptr)
			on_notation_declaration (notation_name, base, system_id, public_id)
		end

	frozen on_start_namespace_declaration_procedure (prefix_ptr, uri_ptr: POINTER) is
		local
			ns_prefix: UC_STRING
			uri: UC_STRING
		do
			ns_prefix := new_uc_string_from_c_utf8_zero_terminated_string_safe (prefix_ptr)
			uri := new_uc_string_from_c_utf8_zero_terminated_string_safe (uri_ptr)
			on_start_namespace_declaration (ns_prefix, uri)
		end

	frozen on_end_namespace_declaration_procedure (prefix_ptr: POINTER) is
		local
			ns_prefix: UC_STRING
		do
			ns_prefix := new_uc_string_from_c_utf8_zero_terminated_string_safe (prefix_ptr)
			on_end_namespace_declaration (ns_prefix)
		end

	frozen on_not_standalone_procedure: BOOLEAN is
		do
			Result := on_not_standalone
		end

	frozen on_external_entity_reference_procedure (context_ptr, base_ptr, system_id_ptr, public_id_ptr: POINTER): BOOLEAN is
			-- return False if parsing of external entity was not
			-- successfull. You only come here if you have called
			-- `enable_parameter_entity_parsing'.
			-- We recursively keep on sending events to this the parser,
			-- saving parents on the stack.
		local
			parent_item: POINTER
			parent_source: XM_SOURCE
			encoding: POINTER
			system_id: UC_STRING
			in_file: KL_TEXT_INPUT_FILE
		do
			debug ("EXPAT")
				print ("on_external_entity_reference%N")
			end
			parent_item := item
			encoding := default_pointer
			item := exml_XML_ExternalEntityParserCreate (parent_item, context_ptr, encoding)
			if item = default_pointer then
					-- raise ("Failure to create parser with XML_ExternalEntityParserCreate.")
				Result := False
			else
					-- for now assume we simply encounter files, URI not
					-- supported
				if system_id_ptr /= default_pointer then
					parent_source := source
					system_id := new_uc_string_from_c_utf8_zero_terminated_string_safe (system_id_ptr)
					!XM_DEFAULT_URI_SOURCE! source.make (system_id)
					!! in_file.make (system_id.to_utf8)
					in_file.open_read
					if in_file.is_open_read then
						parse_incremental_from_stream (in_file)
						set_end_of_document
						in_file.close
						Result := True
					else
						Result := False
					end
					source := parent_source
				end
				exml_XML_ParserFree (item)
				item := parent_item
			end
				-- rescue
				-- if item /= default_pointer and item /= parent_item then
				-- exml_XML_ParserFree (item)
				-- item := parent_item
				-- end
		end

feature {NONE} -- Encoding callback

	on_unknown_encoding_procedure (name_ptr, info_ptr: POINTER): BOOLEAN is
		do
				-- yep, what now?
			Result := False
		end

end
