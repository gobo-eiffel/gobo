indexing

	description:

		"Class for parsing XML documents using Expat."

	status:	 "See notice at end of class."
	author:	 "Andreas Leitner"

class XP_EVENT_PARSER

inherit

	XI_EVENT_PARSER

	XP_API

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

	KL_IMPORTED_INPUT_STREAM_ROUTINES

	KL_IMPORTED_STRING_BUFFER_ROUTINES

	C_STRING_HELPER

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
			in_file: like INPUT_STREAM_TYPE
		do
			!XM_DEFAULT_URI_SOURCE! source.make (a_file_name)
			in_file := INPUT_STREAM_.make_file_open_read (a_file_name.to_utf8)
			check
				file_is_open: INPUT_STREAM_.is_open_read (in_file)
			end
			parse_from_stream (in_file)
			INPUT_STREAM_.close (in_file)
		end

	parse_from_stream (a_stream: like INPUT_STREAM_TYPE) is
		do
			create_new_parser
			parse_incremental_from_stream (a_stream)
			set_end_of_document
		end

	parse_from_string_buffer (a_buffer: like STRING_BUFFER_TYPE) is
		do
			create_new_parser
			parse_incremental_from_string_buffer (a_buffer)
		end

	parse_from_string (a_string: STRING) is
		do
			create_new_parser
			parse_incremental_from_string (a_string)
			set_end_of_document
		end

feature {ANY} -- Incremental parsing

	parse_incremental_from_stream (a_stream: like INPUT_STREAM_TYPE) is
			-- Parse partial XML document from GOBO input stream.
			-- After the last part of the data has been fed into the parser,
			-- call set_end_of_document to get any pending error messages.
		local
			a_string: STRING
			nc: INTEGER
		do
			from until INPUT_STREAM_.end_of_input (a_stream) loop
				a_string := STRING_.make_buffer (read_block_size)
				nc := INPUT_STREAM_.read_stream (a_stream, a_string, 1, read_block_size)
				parse_incremental_from_string (a_string)
			end
		end

	parse_incremental_from_string_buffer (a_buffer: like STRING_BUFFER_TYPE) is
		do
			parse_string_buffer_and_set_error (a_buffer, False)
		end

	parse_incremental_from_string (data: STRING) is
		do
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

	parse_string_buffer_and_set_error (data: like STRING_BUFFER_TYPE; is_final: BOOLEAN) is
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
			int_result := exml_XML_Parse_string_buffer (item, data, is_final)
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

			-- parse_incremental_from_pointer (buf: POINTER; count: INTEGER; is_final: BOOLEAN) is
			-- require
			-- created: is_parser_created
			-- valid_count: count >= 0
			-- local
			-- int_result: INTEGER
			-- error: BOOLEAN
			-- do
			-- -- function call with side effect...
			-- int_result := exml_XML_Parse (item, buf, count, is_final)
			-- error := int_result = 0
			-- if error then
			-- last_error := Xml_err_unknown
			-- last_internal_error := exml_XML_GetErrorCode (item)
			-- end
			-- end

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
			print ("create parser%N")
			item := exml_XML_ParserCreate (default_pointer)
			if item = default_pointer then
				raise ("Failure to create parser with XML_ParserCreate.")
			end
			set_callback_object
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
		local
			callback: XP_CALLBACK
		do
				-- don't forget to free the callback
			print ("free parser%N")
			callback := exml_XML_GetUserData (item)
			if callback /= Void then
				exml_XML_SetUserData (item, Void)
			end
			exml_XML_ParserFree (item)
			item := default_pointer
		ensure
			not_created: not is_parser_created
		end

	set_callback_object is
			-- This attaches the current object to the user data of Expat.
			-- The C code has to make sure that this object isn't hit by
			-- a moving gc!
		require
			created: is_parser_created
		do
			exml_XML_SetUserData (item, Current)
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
			exml_register_XML_SetXmlDeclHandler (item)
				-- people usually only want tags and data
			exml_register_XML_SetElementHandler (item)
			exml_register_XML_SetCharacterDataHandler (item)
			exml_register_XML_SetProcessingInstructionHandler (item)
			exml_register_XML_SetCommentHandler (item)
		end

	register_all_callbacks is
			-- mainly for debugging purposes
		require
			created: is_parser_created
		do
			register_element_declaration_handler
			register_attribute_declaration_handler
			exml_register_XML_SetXmlDeclHandler (item)
			exml_register_XML_SetEntityDeclHandler (item)
			exml_register_XML_SetElementHandler (item)
			exml_register_XML_SetCharacterDataHandler (item)
			exml_register_XML_SetProcessingInstructionHandler (item)
			exml_register_XML_SetCommentHandler (item)
			exml_register_XML_SetCdataSectionHandler (item)
			exml_register_XML_SetDefaultHandler (item)
			exml_register_XML_SetDefaultHandlerExpand (item)
			register_doctype_handler
			exml_register_XML_SetNotationDeclHandler (item)
			exml_register_XML_SetNamespaceDeclHandler (item)
			exml_register_XML_SetNotStandaloneHandler (item)
		end

	register_doctype_handler is
		require
			created: is_parser_created
		do
			exml_register_XML_SetDoctypeDeclHandler (item)
		end

	register_element_declaration_handler is
		require
			created: is_parser_created
		do
			exml_register_XML_SetElementDeclHandler (item)
		end

	register_attribute_declaration_handler is
		require
			created: is_parser_created
		do
			exml_register_XML_SetAttlistDeclHandler (item)
		end

feature -- Callback unregistering, should be in xi_event_parser

	unregister_all_callbacks is
			-- quite useful when an error has been found, and you want to
			-- stop processing things. There doesn't seem to be a way to
			-- signal the parser, but unregistering everything has the
			-- same for the client class.
		require
			created: is_parser_created
		do
			exml_unregister_XML_SetElementDeclHandler (item)
			exml_unregister_XML_SetAttlistDeclHandler (item)
			exml_unregister_XML_SetXmlDeclHandler (item)
			exml_unregister_XML_SetEntityDeclHandler (item)
			exml_unregister_XML_SetElementHandler (item)
			exml_unregister_XML_SetCharacterDataHandler (item)
			exml_unregister_XML_SetProcessingInstructionHandler (item)
			exml_unregister_XML_SetCommentHandler (item)
			exml_unregister_XML_SetCdataSectionHandler (item)
			exml_unregister_XML_SetDefaultHandler (item)
			exml_unregister_XML_SetDefaultHandlerExpand (item)
			exml_unregister_XML_SetDoctypeDeclHandler (item)
			exml_unregister_XML_SetNotationDeclHandler (item)
			exml_unregister_XML_SetNamespaceDeclHandler (item)
			exml_unregister_XML_SetNotStandaloneHandler (item)
			exml_unregister_XML_SetExternalEntityRefHandler (item)
		end

feature -- Parsing parameter entities including the external dtd subset

	disable_parameter_entity_parsing is
		require
			created: is_parser_created
		local
			r: BOOLEAN
		do
			r := exml_XML_SetParamEntityParsing (item, XML_PARAM_ENTITY_PARSING_NEVER)
			exml_unregister_XML_SetExternalEntityRefHandler (item)
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
			exml_register_XML_SetExternalEntityRefHandler (item)
		end

feature {NONE} -- (low level) frozen callbacks (called from exml clib)

	frozen on_element_declaration_procedure (name_ptr: POINTER; model_ptr: POINTER) is
		local
			name: UC_STRING
		do
			name := new_uc_string_from_c_utf8_zero_terminated_string (name_ptr)
			on_element_declaration (name)
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
			if standalone /= 0 then
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
			name: UC_STRING
			ns_prefix: UC_STRING
			att_list: DS_BILINKED_LIST [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]
		do
			name := new_uc_string_from_c_utf8_zero_terminated_string (tag_name_ptr)
			create ns_prefix.make (0)
			extract_name_and_prefix_from_name (name, ns_prefix)
			att_list := new_attribute_list_from_c (attribute_specifications_ptr)
			on_start_tag (name, ns_prefix, att_list)
		end

	frozen on_end_tag_procedure (tag_name_ptr: POINTER) is
		local
			name: UC_STRING
			ns_prefix: UC_STRING
		do
			name := new_uc_string_from_c_utf8_zero_terminated_string (tag_name_ptr)
			create ns_prefix.make (0)
			extract_name_and_prefix_from_name (name, ns_prefix)
			on_end_tag (name, ns_prefix)
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
			create data.make_from_utf8 (new_string_from_c_runlength_string (data_ptr, len))
			on_default (data)
		end

	frozen on_default_expanded_procedure (data_ptr: POINTER; len: INTEGER) is
		local
			data: UC_STRING
		do
			create data.make_from_utf8 (new_string_from_c_runlength_string (data_ptr, len))
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
			in_file: like INPUT_STREAM_TYPE
		do
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
					in_file := INPUT_STREAM_.make_file_open_read (system_id.to_utf8)
					if INPUT_STREAM_.is_open_read (in_file) then
						parse_incremental_from_stream (in_file)
						set_end_of_document
						INPUT_STREAM_.close (in_file)
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

feature {NONE} -- Implementation

	new_attribute_list_from_c (attr_spec_ptr: POINTER): DS_BILINKED_LIST [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]] is
		require
			ptr_not_void: attr_spec_ptr /= Void
		local
			a_name: UC_STRING
			a_prefix: UC_STRING
			a_value: UC_STRING
			ptr1, ptr2: POINTER
			pair1: DS_PAIR [UC_STRING, UC_STRING]
			pair2: DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]
		do
			!! Result.make

				-- dirty C to Eiffel converstion

			ptr1 := attr_spec_ptr
			from ptr2 := ptr_contents (ptr1) until ptr2 = default_pointer loop
				create a_name.make_from_utf8 (new_string_from_c_zero_terminated_string (ptr2))
				create a_prefix.make (0)
				extract_name_and_prefix_from_name (a_name, a_prefix)
				ptr2 := ptr_contents (ptr_move (ptr1, 1))

				create a_value.make_from_utf8 (new_string_from_c_zero_terminated_string (ptr2))
				create pair1.make (a_name, a_prefix)
				create pair2.make (pair1, a_value)
				Result.force_last (pair2)

				ptr1 := ptr_move (ptr1, 2)
				ptr2 := ptr_contents (ptr1)
			end
		end

	extract_name_and_prefix_from_name (a_name, ns_prefix: UC_STRING) is
			-- extracts name and prefix from `a_name'.
			-- Both `a_name' and `ns_prefix' will be modified
		require
			a_name_not_void: a_name /= Void
			ns_prefix_not_void: ns_prefix /= Void
		local
			colon_index: INTEGER
			tmp: UC_STRING
		do
			colon_index := a_name.substring_index (uc_colon, 1)
			ns_prefix.wipe_out
			if colon_index /= 0 then
				ns_prefix.append_uc_string (a_name.substring (1, colon_index - 1))
				tmp := clone (a_name)
				a_name.wipe_out
				a_name.append_uc_string (tmp.substring (colon_index + 1, tmp.count))
			end
		end

	uc_colon: UC_STRING is
		once
			!! Result.make_from_string (":")
		end

end -- XP_EVENT_PARSER
