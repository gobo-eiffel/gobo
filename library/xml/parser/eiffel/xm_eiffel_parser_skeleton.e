indexing

	description:

		"XML parser skeletons using a native Eiffel parser"

	implements: "XML 1.0 (Second Edition) - W3C Recommendation 6 October 2000"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_EIFFEL_PARSER_SKELETON

inherit

	XM_NON_INCREMENTAL_PARSER

	XM_FORWARD_CALLBACKS

	XM_FORWARD_DTD_CALLBACKS

	YY_PARSER_SKELETON
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

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make is
			-- Create a new parser.
			-- The string mode (see XM_STRING_MODE parent) is set by
			-- default to a safe mode, and the parser will be in error
			-- if the XML input contains characters above the maximum:
			-- another string mode must be set explicitely to accept
			-- the full range of unicode characters.
		do
			make_scanner
			make_parser
				-- Parser state:
			in_external_dtd := False
				-- Callbacks forwarding
			create {XM_CALLBACKS_NULL} callbacks.make
				-- Entities:
			entities := new_entities_table
			pe_entities := new_entities_table
				-- Resolvers
			dtd_resolver := null_resolver
			entity_resolver := null_resolver
			use_namespaces := True
		ensure
			string_mode_set_to_safe_latin1_only: is_string_mode_latin1
		end

	null_resolver: XM_NULL_EXTERNAL_RESOLVER is
			-- Null resolver.
		once
			create Result
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			make_scanner
			in_external_dtd := False
			entities.wipe_out
			pe_entities.wipe_out
		end

feature -- Parsing

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse XML document from input stream.
		do
			reset
			scanner.set_input_stream (a_stream)
			parse_with_events
		end

	parse_from_string (a_string: STRING) is
			-- Parse XML document from `a_string'.
		local
			a_stream: KL_STRING_INPUT_STREAM
		do
			create a_stream.make (utf8.to_utf8 (a_string))
			parse_from_stream (a_stream)
		end

	parse_from_system (a_system: STRING) is
			-- Parse from system identifier using resolver.
		do
			reset
			entity_resolver.resolve (a_system)
			parse_from_entity
		end

	parse_from_public (a_public: STRING; a_system: STRING) is
			-- Parse from public/system identifier using resolver.
		do
			reset
			entity_resolver.resolve_public (a_public, a_system)
			parse_from_entity
		end

feature {NONE} -- Implementation

	parse_from_entity is
			-- Parse from entity resolver
		do
			if not entity_resolver.has_error then
				scanner.set_input_from_resolver (entity_resolver)
				parse_with_events
			else
				force_error (entity_resolver.last_error)
			end
		end

	parse_with_events is
			-- Parse with start/finish events.
		do
			reset_error_state
			on_start
			parse
			on_finish
		end

feature -- Namespace mode

	disable_namespaces is
			-- Disable namespace parsing and allow strict
			-- XML 1.0 names (eg ":" or ":a:b:c:").
			-- Namespace field in events is always Void.

		do
			use_namespaces := False
		ensure
			disabled_namespaces: not use_namespaces
		end

	use_namespaces: BOOLEAN
			-- Are namespaces parsed?

feature {NONE} -- Namespaces

	namespace_force_last (a_name: XM_EIFFEL_PARSER_NAME; a_string: STRING) is
			-- Force last namespace name component, or error.
		require
			a_name_not_void: a_name /= Void
			a_string_not_void: a_string /= Void
		do
			if a_name.can_force_last (a_string) then
				a_name.force_last (a_string)
			else
				force_error (Error_namespaces_name_misformed)
			end
		end

feature -- Error reporting

	is_correct: BOOLEAN is
			-- Has no error been detected?
		do
			Result := (internal_last_error_description = Void)
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

	last_error_description: STRING is
			-- Textual description of last error
		do
			Result := internal_last_error_description
		end

feature {NONE} -- Error reporting

	internal_last_error_description: STRING
			-- Textual description of last error, if any

feature -- Error

	line: INTEGER is
			-- Current line
		do
			Result := position.row
		ensure
			definition: Result = position.row
		end

	column: INTEGER is
			-- Current column
		do
			Result := position.column
		ensure
			definition: Result = position.column
		end

	byte_position: INTEGER is
			-- Current byte index
		do
			Result := position.byte_index
		ensure
			definition: Result = position.byte_index
		end

	position: XM_POSITION is
			-- Current position in the source of the XML document
		do
			if is_correct then
				Result := scanner.error_position
			else
				Result := positions.first
			end
		end

	positions: DS_LIST [XM_POSITION] is
			-- Current stack of positions, starting with the current entity.
		do
			if error_positions = Void then
				Result := new_positions
			else
				Result := error_positions
			end
		end

	error_header: STRING is
			-- Header for error message
			-- (<filename>:<line>:<column>:)
		do
			Result := STRING_.cloned_string (scanner.input_name)
			Result.append_character (':')
			Result := STRING_.appended_string (Result, line.out)
			Result.append_character (':')
			Result := STRING_.appended_string (Result, column.out)
			Result.append_character (':')
		ensure
			error_header_not_void: Result /= Void
		end

feature {NONE} -- Error

	error_positions: like positions
			-- Position stack in case of error.

	reset_error_state is
			-- Set error state.
		do
			error_positions := Void
			internal_last_error_description := Void
		end

	setup_error_state (an_error: STRING) is
			-- Set error message and position
		require
			an_error_not_void: an_error /= Void
		do
				-- Set error info
			internal_last_error_description := an_error

				-- Setup position and unfold scanner stack,
				-- if not already done
			if error_positions = Void then
				error_positions := new_positions

					-- Unfold scanner stack
				scanner.close_input
				from
				until
					scanners.is_empty
				loop
					scanners.item.close_input
					scanners.remove
				end
			end
		ensure
			in_error: not is_correct
			scanners_empty: scanners.is_empty
		end

	new_positions: DS_BILINKED_LIST [XM_POSITION] is
			-- Create stack of positions representing position in current XML
			-- entities.
		local
			a_scanners: like scanners
		do
				-- Copy scanners so that the stack can be traversed
				-- without unfolding it.
			create a_scanners.make
			a_scanners.copy (scanners)

				-- Top is scanner, not in scanners
			create Result.make
			Result.force_last (scanner.error_position)

				-- Rest of stack.
			from
			until
				a_scanners.is_empty
			loop
				Result.force_last (a_scanners.item.error_position)
				a_scanners.remove
			end
		ensure
			result_not_void: Result /= Void
			count: Result.count = scanners.count + 1
		end

feature -- Obsolete error

	filename: STRING is
			-- Current file
		obsolete  "Use position.source_name"
		do
			Result := scanner.input_name
		ensure
			filename_not_void: Result /= Void
		end

	source: XM_SOURCE is
			-- Source of the XML document beeing parsed
		obsolete "Use position.source_name"
		do
			create {XM_FILE_SOURCE} Result.make (position.source_name)
		end

feature {NONE} -- Error reporting

	report_error (an_error: STRING) is
			-- On error.
		do
			setup_error_state (an_error)
			on_error (last_error_extended_description)
		end

	force_error (a_message: STRING) is
			-- Report error message.
		do
			report_error (a_message)
			abort
		ensure
			in_error: not is_correct
		end

feature {XM_PARSER_STOP_ON_ERROR_FILTER} -- Error reporting

	force_unreported_error (an_error: STRING) is
			-- Stop the parser, but do not issue an event error because
			-- the error is issued by a downstream event.
		do
			setup_error_state (an_error)
			abort
		end

feature {NONE} -- State

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
			if use_namespaces then
				create Result.make_namespaces
			else
				create Result.make_no_namespaces
			end
		ensure
			namespace_name_not_void: Result /= Void
			namespace_name_empty: Result.is_empty
		end

	new_name_set: DS_HASH_SET [XM_EIFFEL_PARSER_NAME] is
			-- New name set for checking
		do
			create Result.make_equal (10)
		ensure
			name_set_not_void: Result /= Void
		end

	new_dtd_attribute_content: XM_DTD_ATTRIBUTE_CONTENT is
			-- New dtd attribute content
		do
			create Result.make
		ensure
			content_not_void: Result /= Void
		end

	new_dtd_attribute_content_list: DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] is
			-- New dtd attribute content list
		do
			create Result.make
		ensure
			content_list_not_void: Result /= Void
		end

	new_dtd_external_id: XM_DTD_EXTERNAL_ID is
			-- New dtd external id
		do
			create Result.make
		ensure
			external_id: Result /= Void
		end

feature {NONE} -- Encoding

	apply_encoding (an_encoding: STRING) is
			-- Set encoding on current scanner.
		require
			not_void: an_encoding /= Void
		do
			if scanner.is_applicable_encoding (an_encoding) then
				scanner.set_encoding (an_encoding)
			else
				force_error (Error_unsupported_encoding)
			end
		end

feature {NONE} -- DTD

	set_element_repetition (a_node: XM_DTD_ELEMENT_CONTENT; a_value: STRING) is
			-- Set repetition status of a node.
		require
			a_node_not_void: a_node /= Void
		do
			a_node.set_one
			if a_value = One_or_more_repetition then
				a_node.set_one_or_more
			elseif a_value = Zero_or_one_repetition then
				a_node.set_zero_or_one
			elseif a_value = Zero_or_more_repetition then
				a_node.set_zero_or_more
			end
		end

	One_or_more_repetition: STRING is "+"
			-- Special symbol: One of more

	Zero_or_one_repetition: STRING is "?"
			-- Special symbol: Zero or one

	Zero_or_more_repetition: STRING is "*"
			-- Special symbol: Zero or more

	element_name (a_name: STRING): XM_DTD_ELEMENT_CONTENT is
			-- New element content name node
		require
			a_name_not_void: a_name /= Void
		do
			create Result.make_name (a_name)
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
				on_attribute_declaration (ele_name, a_cursor.item.name, a_cursor.item)
				a_cursor.forth
			end
		end

feature {NONE} -- Entities

	new_literal_entity (a_name, a_value: STRING): XM_EIFFEL_ENTITY_DEF is
			-- New literal entity definition
		require
			a_value_not_void: a_value /= Void
		do
			create Result.make_literal (a_name, a_value)
		ensure
			entity_not_void: Result /= Void
		end

	new_external_entity (a_value: XM_DTD_EXTERNAL_ID): XM_EIFFEL_ENTITY_DEF is
			-- New external entity definition
		require
			a_value_not_void: a_value /= Void
		do
			create Result.make_external (entity_resolver, a_value)
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
				std.error.put_string ("Entity declared: ")
				std.error.put_string (a_name)
				if a_def /= Void and then a_def.value /= Void then
					std.error.put_string (" value: ")
					std.error.put_string (a_def.value)
				end
				std.error.put_new_line
			end
				-- 4.2: when multiple declaration first one is binding.
			if a_def /= Void then
				if not entities.has (a_name) then
					entities.force_new (a_def, a_name)
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
				std.error.put_string ("PE entity declared: ")
				std.error.put_string (a_name)
				std.error.put_string (" value: ")
				std.error.put_string (in_def.value)
				std.error.put_new_line
			end
				-- 4.2: when multiple declaration take first one.
			if in_def /= Void then
					-- Convert to PE.
				create a_def.make_def (in_def)
				if not pe_entities.has (a_name) then
					pe_entities.force_new (a_def, a_name)
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
				Result := external_entity_to_string (a_def.external_id)
			end
		end

	resolve_external_id (a_resolver: XM_EXTERNAL_RESOLVER; an_id: XM_DTD_EXTERNAL_ID) is
			-- Apply `an_id' to resolver.
		require
			a_resolver_not_void: a_resolver /= Void
			an_id_not_void: an_id /= Void
		do
			if an_id.is_public then
				a_resolver.resolve_public (an_id.public_id, an_id.system_id)
			else
				a_resolver.resolve (an_id.system_id)
			end
		end

	external_entity_to_string (a_sys: XM_DTD_EXTERNAL_ID): STRING is
			-- External entity to string
		require
			a_sys_not_void: a_sys /= Void
		local
			a_stream: XM_EIFFEL_INPUT_STREAM
			i: INTEGER
		do
			resolve_external_id (entity_resolver, a_sys)
			if not entity_resolver.has_error then
				create a_stream.make_from_stream (entity_resolver.last_stream)
				a_stream.read_string (INTEGER_.Platform.Maximum_integer)
				Result := a_stream.last_string
				if entity_resolver.last_stream.is_closable then
					entity_resolver.last_stream.close
				end
				entity_resolver.resolve_finish
				-- newline normalization XML1.0:2.11
				-- TODO: should be done in scanner?
				from
					i := 1
				until
					i >= Result.count
				loop
					if Result.item (i) = '%R' and Result.item (i+1) = '%N' then
						Result.remove (i)
					end
					i := i + 1
				end
				from
					i := 1
				until
					i > Result.count
				loop
					if Result.item (i) = '%R' then
						Result.put ('%N', i)
					end
					i := i + 1
				end
			else
				force_error (entity_resolver.last_error)
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
				std.error.put_string ("[when_external_dtd]")
			end

			resolve_external_id (dtd_resolver, a_system)
			if not dtd_resolver.has_error then
				-- Push old scanner.
				scanners.force (scanner)
				create {XM_EIFFEL_SCANNER_DTD} scanner.make_scanner
				scanner.set_input_from_resolver (dtd_resolver)
			else
				if dtd_resolver = null_resolver then
					force_error (Error_doctype_external_no_resolver)
				else
					force_error (dtd_resolver.last_error)
				end
			end
		end

feature {NONE} -- Scanner implementation

	make_scanner is
			-- Initialize main scanner and saved
			-- scannners stack.
		do
			create scanner.make_scanner
			create scanners.make
		end

	scanner: XM_EIFFEL_SCANNER
			-- Scanner for PE entity

	scanners: DS_LINKED_STACK [XM_EIFFEL_SCANNER]
			-- Scanner stack for entities etc.

	last_token: INTEGER
			-- Last token read by `read_token'

	read_token is
			-- Read token from scanner.
		local
			last_text: STRING
		do
				-- Read token from scanner.
			scanner.read_token
			last_token := scanner.last_token
			last_string_value := scanner.last_value
			debug ("xml_parser")

				std.error.put_string (token_name (last_token))
				std.error.put_string ("/")
				if last_string_value /= Void then
					std.error.put_string (last_string_value.out)
					std.error.put_string ("/")
				end
				std.error.put_string (scanner.text_count.out)
				std.error.put_new_line
			end
				-- Unwind scanner stack if end of current one.
			if scanner.end_of_file then
				scanner.close_input
				if not scanners.is_empty then
					scanner := scanners.item
					scanners.remove
					read_token
				end
			end
				-- If this is a PE entity reference, temporarily
				-- switch scanner. Token is left for validation.
			last_text := last_string_value
			--check for_all tokens_below: last_value is STRING end

			if last_token = DOCTYPE_PEREFERENCE then
				process_pe_entity (onstring_ascii (last_text))
			elseif last_token = DOCTYPE_PEREFERENCE_UTF8 then
				process_pe_entity (onstring_utf8 (last_text))

			elseif last_token = CONTENT_ENTITY  then
				process_entity (onstring_ascii (last_text))
			elseif last_token = CONTENT_ENTITY_UTF8  then
				process_entity (onstring_utf8 (last_text))

			elseif last_token = ATTRIBUTE_ENTITY then
				process_attribute_entity (onstring_ascii (last_text))
			elseif last_token = ATTRIBUTE_ENTITY_UTF8 then
				process_attribute_entity (onstring_utf8 (last_text))
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
				debug ("xml_parser")
					std.error.put_string ("Pushing entity scanner. Start condition: ")
					std.error.put_string (scanner.start_condition.out)
					std.error.put_new_line
				end
				a_def.set_start_condition (scanner.start_condition)
				scanners.force (scanner)
				scanner := a_def
			end
		end

feature {NONE} -- String mode

	onstring_ascii (a_string: STRING): STRING is
			-- Incoming ascii string.
		require
			ascii: unicode.is_ascii_string (a_string)
		do
			if is_string_mode_unicode then -- force all unicode
				Result := new_unicode_string_from_utf8 (a_string)
			else
				Result := a_string
			end
		end

	onstring_utf8 (a_string: STRING): STRING is
			-- Incoming UTF8 encoded string.
		require
			not_ascii: not unicode.is_ascii_string (a_string)
		do
			if is_string_mode_ascii then
				force_error (Error_unicode_in_ascii_string_mode)
			else
				if utf8.valid_utf8 (a_string) then
					Result := new_unicode_string_from_utf8 (a_string)
					if is_string_mode_latin1 then
						if maximum_item_code (Result) > 255 then
							force_error (Error_unicode_in_latin1_string_mode)
						else
							Result := Result.string
						end
					end
				else
					force_error (Error_unicode_invalid_utf8)
				end
			end
		end

feature {NONE} -- String mode implementation

	maximum_item_code (a_string: STRING): INTEGER is
			-- Return the largest character code used in
			-- `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			i: INTEGER
			cnt: INTEGER
			a_code: INTEGER
		do
			from
				i := 1
				cnt := a_string.count
			variant
				cnt - i + 1
			until
				i > cnt
			loop
				a_code := a_string.item_code (i)
				if a_code > Result then
					Result := a_code
				end
				i := i + 1
			end
		ensure
			empty_zero: a_string.is_empty implies Result = 0
			result_positive: Result >= 0
		end

	shared_empty_string: STRING is
			-- Shared empty string (type depends on string mode)
		do
			if is_string_mode_unicode then
				Result := shared_empty_string_uc
			else
				Result := shared_empty_string_string
			end
		ensure
			empty_string_not_void: Result /= Void
		end

feature {NONE} -- String mode: shared empty string implementation

	shared_empty_string_string: STRING is
			-- Empty string of type STRING
		once
			create Result.make_empty
		ensure
			string_type: ANY_.same_types (Result, "")
		end

	shared_empty_string_uc: STRING is
			-- Empty string of type UC_STRING
		once
			Result := new_unicode_string_empty
		end

invariant

	scanner_not_void: scanner /= Void
	scanners_not_void: scanners /= Void
	no_void_scanner: not scanners.has (Void)

end
