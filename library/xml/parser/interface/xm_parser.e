indexing

	description:

		"Abstract definition of an XML parser"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_PARSER

inherit

	XM_STRING_MODE

	XM_ERROR_CODES

	XM_CALLBACKS_SOURCE

	XM_DTD_CALLBACKS_SOURCE

	KL_IMPORTED_STRING_ROUTINES

feature -- Parsing

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse XML document from input stream.
		require
			a_stream_not_void: a_stream /= Void
			is_open_read: a_stream.is_open_read
		deferred
		end

	parse_from_string (a_string: STRING) is
			-- Parse XML document from `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

feature -- Incremental parsing

	parse_incremental_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse partial XML document from input stream.
			-- After the last part of the data has been fed into the parser,
			-- call `set_end_of_document' to get any pending error messages.
		require
			is_incremental: is_incremental
			a_stream_not_void: a_stream /= Void
			is_open_read: a_stream.is_open_read
		deferred
		end

	parse_incremental_from_string (a_data: STRING) is
			-- Parse partial XML document from 'a_data'.
			-- Note: You can call `parse_incremental_from_string' multiple
			-- times and give the parse the document in parts only.
			-- You have to call `set_end_of_file' after the last call to
			-- 'parse_incremental_from_string' in every case.
		require
			is_incremental: is_incremental
			a_data_not_void: a_data /= Void
		deferred
		end

	set_end_of_document is
			-- Call this routine to tell the parser that the document
			-- has been completely parsed and no input is coming anymore.
		require
			is_incremental: is_incremental
		deferred
		end

feature -- Status report

	is_incremental: BOOLEAN is
			-- Can parser handle incremental input? If yes, you can feed
			-- the parser with a document in several steps. You must use
			-- the special parsing routines (the ones that contain
			-- "incremental" in their name) to do this and call
			-- `set_end_of_document' after the last part has been fed.
		deferred
		end

feature -- Access

	source: XM_SOURCE is
			-- Source of the XML document being parsed.
		deferred
		ensure
			source_not_void: source /= Void
		end

	position: XM_POSITION is
			-- Current position in the source of the XML document
		deferred
		ensure
			position_not_void: Result /= Void
		end

feature -- Error reporting

	is_correct: BOOLEAN is
			-- Has no error been detected?
		deferred
		ensure
			-- error_flag_set: (Result = True) implies (last_error = Xml_error_none)
			-- error_flag_set2: (Result = False) implies (last_error /= Xml_error_none)
		end

	last_error: INTEGER is
			-- Code of last error
			-- (See XM_ERROR_CODES.)
		deferred
		end

	last_error_description: STRING is
			-- Textual description of last error
		require
			has_error: not is_correct
		deferred
		end

	last_error_extended_description: STRING is
			-- Verbose textual description of last error
		require
			has_error: not is_correct
		do
			if last_error_description /= Void then
				Result := clone (last_error_description)
				Result.append_character (' ')
			else
				Result := clone ("")
			end
			Result.append_character ('(')
			Result := STRING_.appended_string (Result, position.out)
			Result.append_character (')')
		ensure
			description_not_void: Result /= Void
		end

end
