note

	description:

		"Abstract definition of an XML parser"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"

deferred class XM_PARSER

inherit

	XM_STRING_MODE

	XM_ERROR_CODES

	XM_CALLBACKS_SOURCE

	XM_DTD_CALLBACKS_SOURCE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Parsing

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM)
			-- Parse XML document from input stream.
		require
			a_stream_not_void: a_stream /= Void
			is_open_read: a_stream.is_open_read
		deferred
		end

	parse_from_string (a_string: STRING)
			-- Parse XML document from `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

	parse_from_system (a_system: STRING)
			-- Parse from system identifier using resolver.
		require
			a_system_not_void: a_system /= Void
		deferred
		end

	parse_from_public (a_public: STRING; a_system: STRING)
			-- Parse from public/system identifier using resolver.
		require
			a_public_not_void: a_public /= Void;
			a_system_not_void: a_system /= Void
		deferred
		end

feature -- Incremental parsing

	parse_incremental_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM)
			-- Parse partial XML document from input stream.
			-- After the last part of the data has been fed into the parser,
			-- call `finish_incremental' to get any pending error messages.
		require
			is_incremental: is_incremental
			a_stream_not_void: a_stream /= Void
			is_open_read: a_stream.is_open_read
		deferred
		end

	parse_incremental_from_string (a_data: STRING)
			-- Parse partial XML document from 'a_data'.
			-- Note: You can call `parse_incremental_from_string' multiple
			-- times and give the parse the document in parts only.
			-- You have to call `finish_incremental' after the last call to
			-- 'parse_incremental_from_string' in every case.
		require
			is_incremental: is_incremental
			a_data_not_void: a_data /= Void
		deferred
		end

	finish_incremental
			-- Call this routine after `parse_incremental_xxxx' to tell
			-- the parser that the document has been completely parsed
			-- and no input is coming anymore.
		require
			is_incremental: is_incremental
		deferred
		end

	set_end_of_document
			-- Old name for `finish_incremental'.
		obsolete
			"Use finish_incremental instead. [2017-04-09]"
		do
			finish_incremental
		end

feature -- Status report

	is_incremental: BOOLEAN
			-- Can parser handle incremental input? If yes, you can feed
			-- the parser with a document in several steps. You must use
			-- the special parsing routines (the ones that contain
			-- "incremental" in their name) to do this and call
			-- `finish_incremental' after the last part has been fed.
		deferred
		end

feature -- Resolving external entity

	set_resolver (a_resolver: like dtd_resolver)
			-- Set both entity and DTD resolvers to the same one.
		require
			not_void: a_resolver /= Void
		do
			set_dtd_resolver (a_resolver)
			set_entity_resolver (a_resolver)
		ensure
			entity_resolver_set: entity_resolver = a_resolver
			dtd_resolver_set: dtd_resolver = a_resolver
		end

	set_dtd_resolver (a_resolver: like dtd_resolver)
			-- Set resolver for external DTD.
		require
			not_void: a_resolver /= Void
		do
			dtd_resolver := a_resolver
		ensure
			dtd_resolver_set: dtd_resolver = a_resolver
		end

	set_entity_resolver (a_resolver: like entity_resolver)
			-- Set resolver for external entities.
		require
			not_void: a_resolver /= Void
		do
			entity_resolver := a_resolver
		ensure
			entity_resolver_set: entity_resolver = a_resolver
		end

	dtd_resolver: XM_EXTERNAL_RESOLVER
			-- Resolver for external DTD.

	entity_resolver: XM_EXTERNAL_RESOLVER
			-- Resolver for external entities.

feature -- Access

	source: XM_SOURCE
			-- Source of the XML document being parsed.
		deferred
		ensure
			source_not_void: Result /= Void
		end

	position: XM_POSITION
			-- Current position in the XML entity being parsed.
		deferred
		ensure
			position_not_void: Result /= Void
		end

	positions: DS_LIST [XM_POSITION]
			-- Current position from the XML entity being parsed, and
			-- the position where it was included.
		deferred
		ensure
			positions_not_void: Result /= Void
			--consistent_with_first: Result.first = position
		end

feature -- Error reporting

	is_correct: BOOLEAN
			-- Has no error been detected?
		deferred
		ensure
			-- error_flag_set: (Result = True) implies (last_error = Xml_error_none)
			-- error_flag_set2: (Result = False) implies (last_error /= Xml_error_none)
		end

	last_error: INTEGER
			-- Code of last error
			-- (See XM_ERROR_CODES.)
		deferred
		end

	last_error_description: STRING
			-- Textual description of last error
		require
			has_error: not is_correct
		deferred
		end

	last_error_extended_description: STRING
			-- Verbose textual description of last error
		require
			has_error: not is_correct
		do
			Result := safe_error_component (position.source_name)
			Result.append_character (':')
			Result.append_string (position.row.out)
			Result.append_character (':')
			Result.append_string (position.column.out)
			Result.append_character (':')
			if last_error_description /= Void then
				Result := STRING_.appended_string (Result, last_error_description)
			end
		ensure
			description_not_void: Result /= Void
		end

	new_stop_on_error_filter: XM_PARSER_STOP_ON_ERROR_FILTER
			-- Create a stop on error filter that not only
			-- stops forwarding events but also stops the
			-- parser if the error comes from the preceding
			-- event filters.
			-- The result must be used only for processing events
			-- coming from the current parser.
		do
			create Result.make (Current)
		ensure
			result_not_void: Result /= Void
		end

	new_stop_on_error_filter_next (a_next: XM_CALLBACKS): XM_PARSER_STOP_ON_ERROR_FILTER
			-- Like 'new_stop_on_error_filter' with next
			-- filter.
		require
			a_next_not_void: a_next /= Void
		do
			create Result.make_next (Current, a_next)
		ensure
			result_not_void: Result /= Void
		end

feature {XM_PARSER_STOP_ON_ERROR_FILTER} -- Error reporting

	force_unreported_error (an_error: STRING)
			-- Force error but do not report it to event listeners.
		require
			an_error_not_void: an_error /= Void
		deferred
		end

feature {NONE} -- Implementation

	safe_error_component (a_string: STRING): STRING
			-- Return a string that can safely be included in an error
			-- message
		local
			i: INTEGER
		do
			if a_string = Void then
				Result := Safe_error_component_undefined
			else
				create Result.make_empty
				from
					i := 1
				until
					i > a_string.count or i > Safe_error_component_maximum_size
				loop
					if is_safe_error_character (a_string.item (i)) then
						Result.append_character (a_string.item (i))
					else
						Result.append_character ('?')
					end
					i := i + 1
				variant
					a_string.count + 1 - i
				end

				if i > Safe_error_component_maximum_size then
					Result.append_string (Safe_error_component_too_big)
					i := a_string.count + 1
				end
			end
		ensure
			result_not_void: Result /= Void
			result_not_large: Result.count <= Safe_error_component_maximum_size
			--result_no_special_chars: Result.for_all (agent is_safe_error_character)
		end

	is_safe_error_character (a_char: CHARACTER): BOOLEAN
			-- Is character acceptable for error component display?
		do
			Result := (a_char >= '/' and a_char < '9')
				or (a_char >= '@' and a_char < 'Z')
				or (a_char >= 'a' and a_char < 'z')
				-- (This covers a_char.code = 0 for UC_STRING unicode characters.)
		end

	Safe_error_component_maximum_size: INTEGER = 100
			-- Safe error component maximum size

	Safe_error_component_too_big: STRING = "(TRUNCATED)"
			-- Error component too big error

	Safe_error_component_undefined: STRING = "undefined"
			-- Error component undefined

invariant

	entity_resolver_not_void: entity_resolver /= Void
	dtd_resolver_not_void: dtd_resolver /= Void

end
