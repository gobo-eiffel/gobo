indexing

	description: 

		"XML parser skeletons using a native Eiffel parser"

	implements: "XML 1.0 (Second Edition) - W3C Recommendation 6 October 2000"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_EIFFEL_PARSER_SKELETON

inherit

	XM_NON_INCREMENTAL_PARSER

	XM_FORWARD_CALLBACKS
		redefine
			on_error
		end

	XM_FORWARD_DTD_CALLBACKS

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser
		redefine
			report_error
		end

	XM_EIFFEL_TOKENS
		export {NONE} all end

	XM_EIFFEL_PARSER_ERRORS
		export {NONE} all end

	UC_UNICODE_FACTORY
		export {NONE} all end

	UC_IMPORTED_UTF8_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UNICODE_ROUTINES
		export {NONE} all end

	XM_EIFFEL_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

feature {NONE} -- Initialization

	make is
			-- Create a new parser.
		do
			make_scanner
			make_parser
				-- Parser state:
			stand_alone := False
			in_external_dtd := False
				-- Entities:
			entities := new_entities_table
			pe_entities := new_entities_table
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			from
			until
				scanners.is_empty
			loop
				scanner := scanners.item
				scanners.remove
			end
			scanner.reset
			stand_alone := False
			in_external_dtd := False
			entities.wipe_out
			pe_entities.wipe_out
		end

feature -- Parsing

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse XML document from input stream.
		do
			reset
			scanner.set_input_buffer (scanner.new_file_buffer (a_stream))
			on_start
			parse
			on_finish
		end

	parse_from_string (a_string: STRING) is
			-- Parse XML document from `a_string'.
		local
			a_stream: KL_STRING_INPUT_STREAM
		do
			!! a_stream.make (utf8.to_utf8 (a_string))
			parse_from_stream (a_stream)
		end

feature -- Obsolete

	parse_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse XML Document from input stream.
		obsolete
			"[020815] Use `parse_from_stream' instead."
		require
			a_stream_not_void: a_stream /= Void
			is_open_read: a_stream.is_open_read
		do
			parse_from_stream (a_stream)
		end

feature -- Error reporting

	is_correct: BOOLEAN is
			-- Has no error been detected?
		do
			Result := not syntax_error
		end

	last_error: INTEGER is
			-- Code of last error
			-- (See XM_ERROR_CODES.)
		do
			if is_correct then
				Result := Xml_err_unknown
			else
				Result := Xml_err_none
			end
		end

	last_error_description: STRING
			-- Textual description of last error

feature -- Error diagnostic

	line: INTEGER is
			-- Current line
		do
			Result := scanner.line
		end

	column: INTEGER is
			-- Current column
		do
			Result := scanner.column
		end

	byte_position: INTEGER is
			-- Current byte index
		do
			Result := scanner.position
		end

	position: XM_POSITION is
			-- Current position in the source of the XML document
		do
			!XM_DEFAULT_POSITION! Result.make (source, byte_position, column, line)
		end

	filename: STRING is
			-- Current file
		do
			Result := scanner.filename
		ensure
			filename_not_void: Result /= Void
		end

	source: XM_SOURCE is
			-- Source of the XML document beeing parsed
		do
			Result := scanner.source
		end

	error_header: STRING is
			-- Header for error message
			-- (<filename>:<line>:<column>:)
		do
			Result := clone (filename)
			Result.append_character (':')
			Result := STRING_.appended_string (Result, line.out)
			Result.append_character (':')
			Result := STRING_.appended_string (Result, column.out)
			Result.append_character (':')
		ensure
			error_header_not_void: Result /= Void
		end

feature {NONE} -- Error reporting

	on_error (an_error: STRING) is
			-- On error.
		do
			last_error_description := an_error
			Precursor (an_error)
		end

	report_error (an_error: STRING) is
			-- On error.
		do
			on_error (an_error)
		end

	force_error (a_message: STRING) is
			-- Report error message.
		do
			on_error (a_message)
			abort
		end

feature {NONE} -- State

	stand_alone: BOOLEAN
			-- From XML declaration

	entities: DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING]
			-- Defined entites

	pe_entities: DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING]
			-- Defined PE entities

	in_external_dtd: BOOLEAN
			-- Is the scanner in an external DTD?

feature {NONE} -- Factory

	new_namespace_name: XM_EIFFEL_PARSER_NAME is
			-- New namespace name
		do
			!! Result.make
		ensure
			namespace_name_not_void: Result /= Void
			namespace_name_empty: Result.is_empty
		end

	new_name_set: DS_HASH_SET [XM_EIFFEL_PARSER_NAME] is
			-- New name set for checking
		do
			!! Result.make_equal (0)
		ensure
			name_set_not_void: Result /= Void
		end

	new_dtd_attribute_content: XM_DTD_ATTRIBUTE_CONTENT is
			-- New dtd attribute content
		do
			!! Result.make
		ensure
			content_not_void: Result /= Void
		end

	new_dtd_attribute_content_list: DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] is
			-- New dtd attribute content list
		do
			!! Result.make
		ensure
			content_list_not_void: Result /= Void
		end

	new_dtd_external_id: XM_DTD_EXTERNAL_ID is
			-- New dtd external id
		do
			!! Result.make
		ensure
			external_id: Result /= Void
		end

feature {NONE} -- DTD

	set_element_repetition (a_node: XM_DTD_ELEMENT_CONTENT; a_value: CHARACTER) is
			-- Set repetition status of a node.
		require
			a_node_not_void: a_node /= Void
		do
			a_node.set_one
			inspect a_value
			when '+' then
				a_node.set_one_or_more
			when '?' then
				a_node.set_zero_or_one
			when '*' then
				a_node.set_zero_or_more
			end
		end

	element_name (a_name: STRING): XM_DTD_ELEMENT_CONTENT is
			-- New element content name node
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make_name (onstring (a_name))
		ensure
			element_name_not_void: Result /= Void
		end

	on_attribute_declarations (ele_name: STRING; some_attributes: DS_LINEAR [XM_DTD_ATTRIBUTE_CONTENT]) is
			-- Send all element declarations.
		require
			ele_not_void: ele_name /= Void
			some_attributes_not_void: some_attributes /= Void
			no_void_attributes: not some_attributes.has (Void)
		local
			a_cursor: DS_LINEAR_CURSOR [XM_DTD_ATTRIBUTE_CONTENT]
		do
			a_cursor := some_attributes.new_cursor
			from a_cursor.start until a_cursor.after loop
					-- TODO: missing part
				on_attribute_declaration (onstring (ele_name), a_cursor.item.name, a_cursor.item)
				a_cursor.forth
			end
		end

feature {NONE} -- Entities

	new_literal_entity (a_value: STRING): XM_EIFFEL_ENTITY_DEF is
			-- New literal entity definition
		require
			a_value_not_void: a_value /= Void
		do
			!! Result.make_literal (a_value)
		ensure
			entity_not_void: Result /= Void
		end

	new_external_entity (a_value: XM_DTD_EXTERNAL_ID): XM_EIFFEL_ENTITY_DEF is
			-- New external entity definition
		require
			a_value_not_void: a_value /= Void
		do
			!! Result.make_external (a_value.system_id)
		ensure
			entity_not_void: Result /= Void
		end

feature {NONE} -- Entities

	when_entity_declared (a_name: STRING; a_def: XM_EIFFEL_ENTITY_DEF) is
			-- Entity has been declared.
		require
			a_name_not_void: a_name /= Void
		do
			debug ("xml_parser")
				std.output.put_string ("Entity declared: ")
				std.output.put_string (a_name)
				std.output.put_string (" value: ")
				std.output.put_string (a_def.value)
				std.output.put_new_line
			end
				-- 4.2: when multiple declaration first one is binding.
			if a_def /= Void then
				if not entities.has (a_name) then
					entities.force (a_def, a_name)
				end
				check has: entities.has (a_name) end
			end
		end

	when_pe_entity_declared (a_name: STRING; in_def: XM_EIFFEL_ENTITY_DEF) is
			-- PE entity has been declared.
		require
			a_name_not_void: a_name /= Void
		local
			a_def: XM_EIFFEL_PE_ENTITY_DEF
		do
			debug ("xml_parser")
				std.output.put_string ("PE entity declared: ")
				std.output.put_string (a_name)
				std.output.put_string (" value: ")
				std.output.put_string (in_def.value)
				std.output.put_new_line
			end
				-- 4.2: when multiple declaration take first one.
			if in_def /= Void then
					-- Convert to PE.
				!! a_def.make_def (in_def)
				if not pe_entities.has (a_name) then
					pe_entities.force (a_def, a_name)
				end
				check has: pe_entities.has (a_name) end
			end
		end

	entity_referenced_in_entity_value (a_name: STRING): STRING is
			-- Named parameter entity has been referenced in entity value
		require
			a_name_not_void: a_name /= Void
		do
			if in_external_dtd then
				if pe_entities.has (a_name) then
					Result := defined_entity_referenced (pe_entities.item (a_name))
				else
						-- 4.4.4 Forbidden.
					force_error (Error_external_reference_in_quoted_value)
				end
			else
				force_error (Error_doctype_peref_only_in_dtd)
			end
		end

	defined_entity_referenced (a_def: XM_EIFFEL_ENTITY_DEF): STRING is
			-- Resolved defined entity in quoted value
		require
			a_def_not_void: a_def /= Void
		do
			if a_def.is_literal then
					-- 4.4.5 Included in literal.
				Result := a_def.value
			else
				Result := external_entity_to_string (a_def.value)
			end
		end

	external_entity_to_string (a_sys: STRING): STRING is
			-- External entity to string
		require
			a_sys_not_void: a_sys /= Void
		local
			a_file: XM_EIFFEL_UTF16_INPUT_STREAM
			an_error: STRING
		do
			Result := clone (shared_empty_string)
			!! a_file.make (a_sys)
			if a_file.is_open_read then
					-- Inefficient?
				from until
					a_file.end_of_input
				loop
					a_file.read_character
					Result.append_character (a_file.last_character)
				end
			else
				an_error := STRING_.concat (Error_cannot_read_file, ": ")
				an_error := STRING_.appended_string (an_error, a_sys)
				force_error (an_error)
			end
		end

feature {NONE} -- DTD

	when_external_dtd (a_system: XM_DTD_EXTERNAL_ID) is
			-- Load external DTD from system name.
		require
			a_system_not_void: a_system /= Void
			has_system: a_system.system_id /= Void
		do
			debug ("xml_parser")
				std.output.put_string ("[when_external_dtd]")
			end
				-- Push old scanner.
			scanners.force (scanner)
			!XM_EIFFEL_SCANNER_DTD! scanner.make_scanner
			scanner.set_input_file (a_system.system_id)
			if not scanner.last_input_file_opened then
				on_error (Error_cannot_open_external_dtd)
			end
		end

feature {NONE} -- Scanner implementation

	make_scanner is
			-- Initialize main scanner and saved
			-- scannners stack.
		do
			!! scanner.make_scanner
			!! scanners.make
		end

	scanner: XM_EIFFEL_SCANNER
			-- Scanner for PE entity

	scanners: DS_LINKED_STACK [XM_EIFFEL_SCANNER]
			-- Scanner stack for entities etc.

	last_token: INTEGER
			-- Last token read by `read_token'

	last_value: ANY
			-- Last value read by `read_token'

	read_token is
			-- Read token from scanner.
		do
				-- Read token from scanner.
			scanner.read_token
			last_token := scanner.last_token
			last_value := scanner.last_value
			debug ("xml_parser")
				std.output.put_string (token_name (last_token))
				std.output.put_string ("/")
				if last_value /= Void then
					std.output.put_string (last_value.out)
					std.output.put_string ("!")
				end
			end
				-- Unwind scanner stack if end of current one.
			if scanner.end_of_file and not scanners.is_empty then
				scanner := scanners.item
				scanners.remove
				read_token
			end
			if last_token = DOCTYPE_PEREFERENCE then
					-- If this is a PE entity reference, temporarily
					-- switch scanner. Token is left for validation.
				process_pe_entity (last_value.out)
			elseif last_token = CONTENT_ENTITY  then
				-- Same if content entity reference.
				process_entity (last_value.out)
			elseif last_token = ATTRIBUTE_ENTITY then
				process_attribute_entity (last_value.out)
			end
		end

feature {NONE} -- Scanner entity processing

	process_pe_entity (a_name: STRING) is
			-- Push PE entity scanner on stack.
		require
			a_name_not_void: a_name /= Void
		do
			if pe_entities.has (a_name) then
				process_entity_scanner (pe_entities.item (a_name))
			else
				force_error (Error_doctype_undefined_pe_entity)
			end
		end

	process_entity (a_name: STRING) is
			-- Push entity scanner on stack.
		require
			a_name_not_void: a_name /= Void
		do
			if entities.has (a_name) then
				process_entity_scanner (entities.item (a_name))
			else
					-- 4.4.4 Forbidden.
				force_error (Error_entity_undefined)
			end
		end

	process_attribute_entity (a_name: STRING) is
			-- Push entity scanner on stack.
		require
			a_name_not_void: a_name /= Void
		do
			if entities.has (a_name) then
				if entities.item (a_name).is_literal then
					process_entity_scanner (entities.item (a_name))
				else
					force_error (Error_entity_literal_in_attribute)
				end
			else
					-- 4.4.4 Forbidden.
				force_error (Error_entity_undefined)
			end
		end

	process_entity_scanner (a_def: XM_EIFFEL_ENTITY_DEF) is
			-- Save previous scannner, create new scanner, and
			-- reset it with previous scanner state. 
		require
			a_def_not_void: a_def /= Void
		do
			a_def.apply_input_buffer
			if a_def.has_error then
				force_error (a_def.last_error)
			else
					-- Push scanner.
				a_def.set_start_condition (scanner.start_condition)
				scanners.force (scanner)
				scanner := a_def
			end
		end

feature {NONE} -- String

	onstring (a_string: STRING): STRING is
			-- Convert string from inside the parser to string as 
			-- seen by callback interface.
		do
			if a_string /= Void then
				if is_string_mode_unicode then
					Result := new_unicode_string_from_utf8 (a_string)
				elseif not unicode.is_ascii_string (a_string) then
					if is_string_mode_ascii then
						force_error (Error_unicode_in_ascii_string_mode)
					else
						Result := new_unicode_string_from_utf8 (a_string)
					end
				else
					Result := a_string
				end
			end
		end

	shared_empty_string: STRING is
			-- Shared empty string
		once
			!! Result.make (0)
		ensure
			empty_string_not_void: Result /= Void
		end

invariant

	scanner_not_void: scanner /= Void
	scanners_not_void: scanners /= Void
	no_void_scanner: not scanners.has (Void)

end
