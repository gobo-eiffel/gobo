indexing

	description:

		"Abstract definition of a XML parser"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_PARSER

inherit

	XM_ERROR_CODES

	XM_CALLBACKS_SOURCE

	XM_DTD_CALLBACKS_SOURCE

feature {ANY} -- Access

	is_incremental: BOOLEAN is
			-- Can parser handle incremental feed? If yes, you can feed
			-- the parser a document in several steps. You must use the
			-- special parseing routines (the ones that contain
			-- "incremental" in their name) to do this and call
			-- `set_end_of_document' after the last part has been fed.
		deferred
		end

	source: XM_SOURCE is
			-- Source of the XML document beeing parserd.
			-- If `Void' the source is unkown.
		deferred
		end

feature {ANY} -- Element change

	set_source (a_source: XM_SOURCE) is
			-- Make `a_source' the source of the XML document to parse.
		deferred
		end

feature {ANY} -- Parsing

	parse_from_file_name (a_file_name: UC_STRING) is
			-- Parse XML Document from file
			-- `source' will be automatically set.
		require
			a_file_name_not_void: a_file_name /= Void
			-- file must exist and be readable (how to check that on a
			-- compiler independend way?)
		deferred
		end

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse XML Document from GOBO input stream.
		require
			a_stream_not_void: a_stream /= Void
		deferred
		end

	parse_from_string (data: STRING) is
			-- Parse `data'.
		require
			data_not_void: data /= Void
		deferred
		end

feature {ANY} -- Incremental parsing

	parse_incremental_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse partial XML document from GOBO input stream.
			-- After the last part of the data has been fed into the parser,
			-- call set_end_of_document to get any pending error messages.
		require
			is_incremental: is_incremental
			a_stream_not_void: a_stream /= Void
		deferred
		end

	parse_incremental_from_string (data: STRING) is
			-- Parse partial XML document from 'data'.
			-- Note: You can call parse_string multiple times
			-- and give the parse the document in parts only.
			-- You have to call 'set_end_of_file' after the
			-- last call to 'parse_string' in every case.
		require
			data_not_void: data /= Void
			is_incremental: is_incremental
		deferred
		end

	set_end_of_document is
			-- Call this routine to tell the parser that the document
			-- has been completly parsed and no input is comming anymore.
		require
			is_incremental: is_incremental
		deferred
		end

feature -- Status

	last_error: INTEGER is
			-- See XM_PARSE_ERROR_CODES.
		deferred
		end

	is_correct: BOOLEAN is
			-- Returns False if an error was detected during parsing
		deferred
		ensure
			-- error_flag_set: (Result = True) implies (last_error = Xml_error_none)
			-- error_flag_set2: (Result = False) implies (last_error /= Xml_error_none)
		end

	last_error_description: STRING is
			-- Returns a text that explain what the error reported by
			-- `last_error' was all about.
		deferred
		end

	last_error_extended_description: STRING is
			-- Same as `last_error_description', but more verbose.
		do
			if last_error_description /= Void then
				Result := clone (last_error_description)
				Result.append_character (' ')
			else
				Result := clone ("")
			end
			Result.append_string ("(")
			Result.append_string (position.out)
			Result.append_string (")")
		end

	position: XM_POSITION is
			-- Current position in the source of the XML document.
		deferred
		end

end -- class XM_PARSER
