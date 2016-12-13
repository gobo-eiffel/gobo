note

	description:

		"XML parsers using Expat"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_EXPAT_PARSER

inherit

	XM_PARSER

	XM_FORWARD_CALLBACKS

	XM_FORWARD_DTD_CALLBACKS

	MEMORY
		redefine
			dispose
		end

	XM_EXPAT_API
		export {NONE} all end

	XM_EXPAT_CALLBACK
		export {NONE} all end

	XM_EXPAT_ENCODING_CALLBACK
			-- Mainly here to silence SE warning about "Empty Cecil/Wrapper ..."
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	XM_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new parser.
		do
			initialize
			init_api
			is_correct := True
			last_error := Xml_err_none

			create {XM_CALLBACKS_NULL} callbacks.make

			create {XM_NULL_EXTERNAL_RESOLVER} dtd_resolver
			entity_resolver := dtd_resolver
		end

	initialize
			-- Initialize current callbacks and DTD callbacks.
		do
			dtd_callbacks := null_dtd_callbacks
		end

feature -- Status report

	is_incremental: BOOLEAN = True
			-- Can parser handle incremental input? If yes, you can feed
			-- the parser with a document in several steps. You must use
			-- the special parsing routines (the ones that contain
			-- "incremental" in their name) to do this and call
			-- `finish_incremental' after the last part has been fed.

	is_parser_created: BOOLEAN
			-- Has Expat parser handle been created?
		do
			Result := item /= default_pointer
		ensure
			definition: Result = (item /= default_pointer)
		end

feature -- Access

	source: XM_SOURCE
			-- Source of the XML document beeing parsed
		obsolete "Use position.source_name"
		do
			create {XM_FILE_SOURCE} Result.make (position.source_name)
		end

	position: XM_POSITION
			-- Current position in the source of the XML document
		do
			create {XM_DEFAULT_POSITION} Result.make ("source unknown", last_byte_index, last_column_number, last_line_number)
		end

	positions: DS_LINKED_LIST [XM_POSITION]
			-- To be implemented...
		do
			create Result.make
			Result.force_last (position)
		end

	relative_uri_base: STRING
			-- Relative URI base
		require
			parser_created: is_parser_created
		local
			base_ptr: POINTER
		do
			base_ptr := exml_XML_GetBase (item)
			Result := new_uc_string_from_c_utf8_zero_terminated_string (base_ptr)
		ensure
			relative_uri_base_not_void: Result /= Void
		end

	version: STRING
			-- Expat library version (e.g. "expat_1.95.5").
		do
			Result := new_uc_string_from_c_utf8_zero_terminated_string (exml_XML_ExpatVersion)
		end

feature -- Setting

	set_relative_uri_base (a_base: STRING)
			-- Set the base to be used for resolving URIs in
			-- system identifiers in declarations.
			-- Note: Is this applicable to all the different
			-- parsers out there? BdB: I don't think so
		require
			parser_created: is_parser_created
			a_base_not_void: a_base /= Void
			a_base_not_empty: a_base.count > 0
		local
			r: BOOLEAN
		do
				-- Don't have a way yet to turn UC_STRING to pointer...
			r := exml_XML_SetBase_string (item, new_unicode_string (a_base).to_utf8)
			if not r then
				Exceptions.raise ("Expat out of memory")
			end
		ensure
			relative_uri_base_set: same_string (relative_uri_base, a_base)
		end

feature -- Parsing

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM)
			-- Parse XML document from input stream.
		do
			if is_parser_created then
				free_parser
			end
			parse_incremental_from_stream (a_stream)
			finish_incremental
		end

	parse_from_string (a_string: STRING)
			-- Parse XML document from `a_string'.
		do
			if is_parser_created then
				free_parser
			end
			parse_incremental_from_string (a_string)
			finish_incremental
		end

	parse_from_system (a_system: STRING)
			-- Parse from system identifier using resolver.
		do
			entity_resolver.resolve (a_system)
			parse_from_entity
		end

	parse_from_public (a_public: STRING; a_system: STRING)
			-- Parse from public/system identifier using resolver.
		do
			entity_resolver.resolve_public (a_public, a_system)
			parse_from_entity
		end

feature {NONE} -- Implementation

	parse_from_entity
			-- Parse from entity resolver
		do
			-- TODO: plug entity_resolver into expat entity resolving scheme and use it
		end

feature {XM_PARSER_STOP_ON_ERROR_FILTER} --

	force_unreported_error (an_error: STRING)
			-- Stop the parser without reporting the error to downstream events.
		do
			is_correct := False
			last_error := Xml_err_unknown
			-- TODO: really stop the parser
		end

feature -- Incremental parsing

	parse_incremental_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM)
			-- Parse partial XML document from input stream.
			-- After the last part of the data has been fed into the parser,
			-- call `finish_incremental' to get any pending error messages.
		do
			if not is_parser_created then
				create_new_parser
				on_start
			end
			from
				a_stream.read_string (read_block_size)
			until
				a_stream.end_of_input
			loop
				parse_string_and_set_error (a_stream.last_string, False)
				a_stream.read_string (read_block_size)
			end
		end

	parse_incremental_from_string (a_data: STRING)
			-- Parse partial XML document from 'a_data'.
			-- Note: You can call `parse_incremental_from_string' multiple
			-- times and give the parse the document in parts only.
			-- You have to call `finish_incremental' after the last call to
			-- 'parse_incremental_from_string' in every case.
		do
			if not is_parser_created then
				create_new_parser
				on_start
			end
			parse_string_and_set_error (a_data, False)
		end

	finish_incremental
			-- Call this routine to tell the parser that the document
			-- has been completely parsed and no input is coming anymore.
			-- We also generate the `on_finish' callback.
		do
			if is_parser_created then
				parse_string_and_set_error (once_empty_string, True)
				on_finish
				free_parser
			end
		ensure then
			parser_not_created: not is_parser_created
		end


feature {NONE} -- Low-level parsing

	parse_string_and_set_error (a_data: STRING; is_final: BOOLEAN)
			-- Parse `a_data' (which may be empty).
			-- Set the error flags according to result.
			-- `is_final' signals end of data input.
		require
			parser_created: is_parser_created
			a_data_not_void: a_data /= Void
		local
			int_result: INTEGER
		do
			int_result := exml_XML_Parse_string (item, a_data, is_final)
			set_error_from_parse_result (int_result)
		end

	set_error_from_parse_result (i: INTEGER)
			-- Set error flags according to `i', where `i' must
			-- be the result of a call to Expat's XML_Parser function.
		require
			parser_created: is_parser_created
		local
			error: BOOLEAN
		do
			error := i = 0
			if error then
				is_correct := False
				last_error := Xml_err_unknown
				last_internal_error := exml_XML_GetErrorCode (item)
			end
		end

feature -- Error reporting

	is_correct: BOOLEAN
			-- Has no error been detected?

	last_error: INTEGER
			-- Code of last error

	last_error_description: STRING
			-- Textual description of last error
		do
			Result := new_string_from_c_zero_terminated_string (exml_XML_ErrorString (last_internal_error))
		end

	last_line_number: INTEGER
			-- Current line number
		do
			if is_parser_created then
				Result := exml_XML_GetCurrentLineNumber (item)
			end
			if Result < 1 then
				Result := 1
			end
		ensure
			line_number_positive: Result >= 1
		end

	last_column_number: INTEGER
			-- Current column number
		do
			if is_parser_created then
				Result := exml_XML_GetCurrentColumnNumber (item) + 1
			end
			if Result < 1 then
				Result := 1
			end
		ensure
			column_number_positive: Result >= 1
		end

	last_byte_index: INTEGER
			-- Current byte index
		do
			if is_parser_created then
				Result := exml_XML_GetCurrentByteIndex (item) + 1
			end
			if Result < 1 then
				Result := 1
			end
		ensure
			byte_index_positive: Result >= 1
		end

feature {NONE} -- Error reporting

	last_internal_error: INTEGER
			-- Expat specific error code

feature {NONE} -- Parser handle

	item: POINTER
			-- Expat parser C-handle

	create_default_parser
			-- Create default parser.
		do
			debug ("EXPAT")
				std.output.put_line ("create parser")
			end
			item := exml_XML_ParserCreate (default_pointer)
			if item = default_pointer then
				Exceptions.raise ("Failure to create parser with XML_ParserCreate.")
			end
			set_callback_object (item, Current)

				-- We need a smarter way to set callbacks. What callbacks you
				-- want should be determined by the client.
				-- Perhaps override `on_xml_declaration' to give client chance
				-- to set callback and at the same time with a known handle?
			register_default_callbacks
		ensure
			parser_created: is_parser_created
		end

	create_new_parser
			-- Create a new parser. Existing parser, if any, is freed.
		do
			is_correct := True
			if is_parser_created then
				free_parser
			end
			create_default_parser
		ensure
			parser_created: is_parser_created
		end

	free_parser
			-- Free parser. Make callback, if any, available to GC.
		require
			parser_created: is_parser_created
		do
				-- Don't forget to free the callback.
			debug ("EXPAT")
				std.output.put_line ("free parser")
			end
			set_callback_object (item, Void)
			exml_XML_ParserFree (item)
			item := default_pointer
		ensure
			parser_not_created: not is_parser_created
		end

feature -- Callback registering

	register_default_callbacks
			-- Register default callbacks.
			-- (Override to register more or less handlers.)
		require
			parser_created: is_parser_created
		do
				-- Required if you want to give people a chance to set their
				-- own callbacks.
			exml_XML_SetXmlDeclHandler (item, $on_xml_declaration_procedure)
				-- People usually only want tags and data.
			exml_XML_SetElementHandler (item, $on_start_tag_procedure, $on_end_tag_procedure)
			exml_XML_SetCharacterDataHandler (item, $on_content_procedure)
			exml_XML_SetProcessingInstructionHandler (item, $on_processing_instruction_procedure)
			exml_XML_SetCommentHandler (item, $on_comment_procedure)
		end

	register_all_callbacks
			-- Register all callbacks.
			-- (Mainly for debugging purposes.)
		require
			parser_created: is_parser_created
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

	register_doctype_handler
			-- Register doctype handler.
		require
			parser_created: is_parser_created
		do
			exml_XML_SetDoctypeDeclHandler (item, $on_start_doctype_procedure, $on_end_doctype_procedure)
		end

	register_element_declaration_handler
			-- Register element declaration handler.
		require
			parser_created: is_parser_created
		do
			exml_XML_SetElementDeclHandler (item, $on_element_declaration_procedure)
		end

	register_attribute_declaration_handler
			-- Register attribute declaration handler.
		require
			parser_created: is_parser_created
		do
			exml_XML_SetAttlistDeclHandler (item, $on_attribute_declaration_procedure)
		end

feature -- Callback unregistering

	unregister_all_callbacks
			-- Unregister all callbacks.
			-- (Quite useful when an error has been found, and you want to
			-- stop processing things. There doesn't seem to be a way to
			-- signal the parser, but unregistering everything has the
			-- same effect for the client class.)
		require
			parser_created: is_parser_created
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

	disable_parameter_entity_parsing
		require
			parser_created: is_parser_created
		local
			r: BOOLEAN
		do
			r := exml_XML_SetParamEntityParsing (item, XML_PARAM_ENTITY_PARSING_NEVER)
			exml_XML_SetExternalEntityRefHandler (item, default_pointer)
		end

	enable_parameter_entity_parsing
		require
			parser_created: is_parser_created
		local
			r: BOOLEAN
		do
			r := exml_XML_SetParamEntityParsing (item, XML_PARAM_ENTITY_PARSING_ALWAYS)
			if not r then
				Exceptions.raise ("Library compiled without support for parameter entity parsing (i.e. XML_DTD not defined) or XML_Parser or XML_ParseBuffer already called in which case this function does not have any effect.")
			end
			exml_XML_SetExternalEntityRefHandler (item, $on_external_entity_reference_procedure)
		end

feature {NONE} -- Turn Expat DTD description into XM_DTD_ELEMENT_CONTENT

	create_children (parent: XM_DTD_ELEMENT_CONTENT; model_ptr: POINTER)
			-- Create the children by calling `create_element_content'
			-- and put them in the parent items list.
		require
			has_parent: parent /= Void
			has_items: parent.items /= Void
			has_model_ptr: model_ptr /= default_pointer
			has_children: exml_XML_cp_numchildren (model_ptr) > 0
		local
			i: INTEGER
		do
			check precondition_has_items: attached parent.items as l_parent_items then
				from
					i := 0
				until
					i >= exml_XML_cp_numchildren (model_ptr)
				loop
					l_parent_items.put_last (create_element_content (exml_XML_cp_children (model_ptr, i)))
					i := i + 1
				end
			end
		ensure
			children_created: attached parent.items as l_parent_items and then l_parent_items.count > 0
		end

	create_element_content (model_ptr: POINTER): XM_DTD_ELEMENT_CONTENT
			-- Recursively walk Expat XML_Content struct and copy it to
			-- XM_DTD_ELEMENT_CONTENT cells.
		require
			has_model_ptr: model_ptr /= default_pointer
		local
			type, quant: INTEGER
		do
				-- Set type and children.
			type := exml_XML_cp_type (model_ptr)
			if type = XML_CTYPE_EMPTY then
				create Result.make_empty
			elseif type = XML_CTYPE_ANY then
				create Result.make_any
			elseif type = XML_CTYPE_MIXED then
				create Result.make_mixed
				if exml_XML_cp_numchildren (model_ptr) > 0 then
					create_children (Result, model_ptr)
				end
			elseif type = XML_CTYPE_NAME then
				create Result.make_name (new_uc_string_from_c_utf8_zero_terminated_string (exml_XML_cp_name (model_ptr)))
			elseif type = XML_CTYPE_CHOICE then
				create Result.make_choice
				create_children (Result, model_ptr)
			elseif type = XML_CTYPE_SEQ then
				create Result.make_sequence
				create_children (Result, model_ptr)
			else
				check invalid_value: False then end
			end
				-- Set repetition.
			quant := exml_XML_cp_quant (model_ptr)
			if quant = XML_CQUANT_OPT then
				Result.set_zero_or_one
			elseif quant = XML_CQUANT_REP then
				Result.set_zero_or_more
			elseif quant = XML_CQUANT_PLUS then
				Result.set_one_or_more
			end
		ensure
			content_not_void: Result /= Void
		end

feature {NONE} -- (low level) frozen callbacks (called from exml clib)

	frozen on_element_declaration_procedure (name_ptr: POINTER; model_ptr: POINTER)
		do
			on_element_declaration (new_uc_string_from_c_utf8_zero_terminated_string (name_ptr), create_element_content (model_ptr))
				-- It is the caller's responsibility to free model when
				-- finished with it. So we do that here.
			exml_XML_FreeContentModel (item, model_ptr)
		end

	frozen on_attribute_declaration_procedure (elname_ptr, attname_ptr, att_type_ptr, dflt_ptr: POINTER; is_required: BOOLEAN)
		local
			elname, attname, dflt: STRING
			att_type: STRING
			a_model: XM_DTD_ATTRIBUTE_CONTENT
		do
			elname := new_uc_string_from_c_utf8_zero_terminated_string (elname_ptr)
			attname := new_uc_string_from_c_utf8_zero_terminated_string (attname_ptr)
			att_type := new_uc_string_from_c_utf8_zero_terminated_string (att_type_ptr).to_utf8
			dflt := new_uc_string_from_c_utf8_zero_terminated_string_safe (dflt_ptr)
			create a_model.make
				-- Value:
			if dflt /= Void then
				if is_required then
					a_model.set_value_fixed (dflt)
				else
					a_model.set_default_value (dflt)
				end
			else
				if is_required then
					a_model.set_value_required
				else
					a_model.set_value_implied
				end
			end
				-- Type:
			if same_string (att_type,"CDATA") then
				a_model.set_data
			elseif same_string (att_type, "ID") then
				a_model.set_id
			elseif same_string (att_type, "IDREF") then
				a_model.set_id_ref
			elseif same_string (att_type, "IDREFS") then
				a_model.set_id_ref
				a_model.set_list_type
			elseif same_string (att_type, "ENTITY") then
				a_model.set_entity
			elseif same_string (att_type, "ENTITIES") then
				a_model.set_entity
				a_model.set_list_type
			elseif same_string (att_type, "NMTOKEN") then
				a_model.set_token
			elseif same_string (att_type, "ENTITIES") then
				a_model.set_token
				a_model.set_list_type
			elseif same_string (att_type, "NOTATION") then
				a_model.set_notation
			else
				a_model.set_enumeration
			end
			on_attribute_declaration (elname, attname, a_model)
		end

	frozen on_xml_declaration_procedure (version_ptr, encoding_ptr: POINTER; standalone: INTEGER)
		do
			on_xml_declaration (new_uc_string_from_c_utf8_zero_terminated_string (version_ptr),
					new_uc_string_from_c_utf8_zero_terminated_string_safe (encoding_ptr),
					standalone = 1)
		end

	frozen on_entity_declaration_procedure (entity_name_ptr: POINTER; is_parameter_entity: BOOLEAN; value_ptr: POINTER; value_length: INTEGER; base_ptr, system_id_ptr, public_id_ptr, notation_name_ptr: POINTER)
		local
			an_id: XM_DTD_EXTERNAL_ID
		do
				-- Does `value_length' mean that value can contain zero, or is it to
				-- prevent seeking to zero?
			create an_id.make
			an_id.set_base (new_uc_string_from_c_utf8_zero_terminated_string_safe (base_ptr))
			an_id.set_system (new_uc_string_from_c_utf8_zero_terminated_string_safe (system_id_ptr))
			an_id.set_public (new_uc_string_from_c_utf8_zero_terminated_string_safe (public_id_ptr))
			if an_id.base = Void and an_id.system_id = Void and an_id.public_id = Void then
				an_id := Void
			end
			on_entity_declaration (new_uc_string_from_c_utf8_zero_terminated_string (entity_name_ptr),
					is_parameter_entity,
					new_uc_string_from_c_utf8_zero_terminated_string_safe (value_ptr),
					an_id,
					new_uc_string_from_c_utf8_zero_terminated_string_safe (notation_name_ptr))
		end

	frozen on_start_tag_procedure (tag_name_ptr, attribute_specifications_ptr: POINTER)
		local
			a_name: STRING
			a_prefix: STRING
			colon_index: INTEGER
			att_list: DS_BILINKED_LIST [DS_PAIR [DS_PAIR [STRING, STRING], STRING]]
			it: DS_LINEAR_CURSOR [DS_PAIR [DS_PAIR [STRING, STRING], STRING]]
		do
			a_name := new_uc_string_from_c_utf8_zero_terminated_string (tag_name_ptr)
			colon_index := a_name.index_of (':', 1)
			if colon_index /= 0 then
				a_prefix := a_name.substring (1, colon_index - 1)
				a_name := a_name.substring (colon_index + 1, a_name.count)
			else
				-- Void for no prefix.
			end
			att_list := new_attribute_list_from_c (attribute_specifications_ptr)

			on_start_tag (Void, a_prefix, a_name)
			it := att_list.new_cursor
			from it.start until it.after loop
				a_prefix := Void
				if it.item.first.second /= Void and then it.item.first.second.count > 0 then
					a_prefix := it.item.first.second
				end
				on_attribute (Void, -- namespace
					a_prefix, it.item.first.first, -- prefix:name
					it.item.second) -- value
				it.forth
			end
			on_start_tag_finish
		end

	frozen on_end_tag_procedure (tag_name_ptr: POINTER)
		local
			a_name: STRING
			a_prefix: STRING
			colon_index: INTEGER
		do
			a_name := new_uc_string_from_c_utf8_zero_terminated_string (tag_name_ptr)
			colon_index := a_name.index_of (':', 1)
			if colon_index /= 0 then
				a_prefix := a_name.substring (1, colon_index - 1)
				a_name := a_name.substring (colon_index + 1, a_name.count)
			else
				-- Void for no prefix.
			end
			on_end_tag (Void, a_prefix, a_name)
		end

	frozen on_content_procedure (chr_data_ptr: POINTER; len: INTEGER)
		do
			on_content (new_uc_string_from_c_utf8_runlength_string (chr_data_ptr, len))
		end

	frozen on_processing_instruction_procedure (target_ptr, data_ptr: POINTER)
		local
			data: STRING
			l_name: STRING
		do
			if data_ptr = default_pointer then
				data := new_unicode_string_empty
			else
				data := new_uc_string_from_c_utf8_zero_terminated_string (data_ptr)
			end
			if target_ptr = default_pointer then
				l_name := new_unicode_string_empty
			else
				l_name := new_uc_string_from_c_utf8_zero_terminated_string (target_ptr)
			end
			on_processing_instruction (l_name, data)
		end

	frozen on_comment_procedure (data_ptr: POINTER)
			-- Data is a 0 terminated C string.
		do
			on_comment (new_uc_string_from_c_utf8_zero_terminated_string (data_ptr))
		end

	frozen on_start_cdata_section_procedure
		do
			on_start_cdata_section
		end

	frozen on_end_cdata_section_procedure
		do
			on_end_cdata_section
		end

	frozen on_default_procedure (data_ptr: POINTER; len: INTEGER)
		do
			on_default (new_unicode_string_from_utf8 (new_string_from_c_runlength_string (data_ptr, len)))
		end

	frozen on_default_expanded_procedure (data_ptr: POINTER; len: INTEGER)
		do
			on_default_expanded (new_unicode_string_from_utf8 (new_string_from_c_runlength_string (data_ptr, len)))
		end

	frozen on_start_doctype_procedure (doctype_name_ptr, sysid_ptr, pubid_ptr: POINTER; has_internal_subset: BOOLEAN)
		local
			an_id: XM_DTD_EXTERNAL_ID
		do
			create an_id.make
			an_id.set_system (new_uc_string_from_c_utf8_zero_terminated_string_safe (sysid_ptr))
			an_id.set_public (new_uc_string_from_c_utf8_zero_terminated_string_safe (pubid_ptr))
			on_doctype (new_uc_string_from_c_utf8_zero_terminated_string (doctype_name_ptr),
				an_id, has_internal_subset)
		end

	frozen on_end_doctype_procedure
		do
			on_end_doctype
		end

	frozen on_notation_declaration_procedure (notation_name_ptr, base_ptr, system_id_ptr, public_id_ptr: POINTER)
		local
			an_id: XM_DTD_EXTERNAL_ID
		do
			create an_id.make
			an_id.set_base (new_uc_string_from_c_utf8_zero_terminated_string_safe (base_ptr))
			an_id.set_system (new_uc_string_from_c_utf8_zero_terminated_string_safe (system_id_ptr))
			an_id.set_public (new_uc_string_from_c_utf8_zero_terminated_string_safe (public_id_ptr))
			on_notation_declaration (new_uc_string_from_c_utf8_zero_terminated_string (notation_name_ptr), an_id)
		end

	frozen on_start_namespace_declaration_procedure (prefix_ptr, uri_ptr: POINTER)
		do
			on_start_namespace_declaration (
				new_uc_string_from_c_utf8_zero_terminated_string_safe (prefix_ptr),
				new_uc_string_from_c_utf8_zero_terminated_string_safe (uri_ptr))
		end

	frozen on_end_namespace_declaration_procedure (prefix_ptr: POINTER)
		do
			on_end_namespace_declaration (
				new_uc_string_from_c_utf8_zero_terminated_string_safe (prefix_ptr))
		end

	frozen on_not_standalone_procedure: BOOLEAN
		do
			Result := on_not_standalone
		end

	frozen on_external_entity_reference_procedure (context_ptr, base_ptr, system_id_ptr, public_id_ptr: POINTER): BOOLEAN
			-- Return False if parsing of external entity was not
			-- successfull. You only come here if you have called
			-- `enable_parameter_entity_parsing'.
			-- We recursively keep on sending events to this the parser,
			-- saving parents on the stack.
		local
			parent_item: POINTER
			encoding: POINTER
			system_id: UC_STRING
			in_file: KL_TEXT_INPUT_FILE
		do
			debug ("EXPAT")
				std.output.put_line ("on_external_entity_reference")
			end
			parent_item := item
			encoding := default_pointer
			item := exml_XML_ExternalEntityParserCreate (parent_item, context_ptr, encoding)
			if item = default_pointer then
					-- raise ("Failure to create parser with XML_ExternalEntityParserCreate.")
				Result := False
			else
					-- For now assume we simply encounter files, URI not
					-- supported.
				if system_id_ptr /= default_pointer then
					system_id := new_uc_string_from_c_utf8_zero_terminated_string (system_id_ptr)
					create in_file.make (system_id.to_utf8)
					in_file.open_read
					if in_file.is_open_read then
						parse_incremental_from_stream (in_file)
						finish_incremental
						in_file.close
						Result := True
					else
						Result := False
					end
				end
				exml_XML_ParserFree (item)
				item := parent_item
			end
		end

feature {NONE} -- Encoding callback

	on_unknown_encoding_procedure (name_ptr, info_ptr: POINTER): BOOLEAN
		do
				-- yep, what now?
			Result := False
		end

feature {NONE} -- Orphan expat events

	on_not_standalone: BOOLEAN
			-- TODO: routine with side-effect!
		do
		end

	on_end_doctype
		do
		end

	on_start_namespace_declaration (a_prefix: detachable STRING; a_uri: detachable STRING)
		do
		end

	on_end_namespace_declaration (a_prefix: detachable STRING)
		do
		end

	on_default (a_data: STRING)
		do
		end

	on_default_expanded (a_data: STRING)
		do
		end

	on_start_cdata_section
		do
		end

	on_end_cdata_section
		do
		end

feature {NONE} -- GC

	dispose
			-- Action to be executed just before garbage collector
			-- reclaims the object.
		do
			if is_parser_created then
				free_parser
			end
		end

feature {NONE} -- Constants

	read_block_size: INTEGER = 10240
			-- 10 kB

feature {NONE} -- Once strings

	once_empty_string: STRING = ""
			-- The empty string


end
