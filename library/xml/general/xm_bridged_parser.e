indexing

	description:

		"Abstract definition of a XML parser"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_BRIDGED_PARSER

inherit

	XM_PARSER
		redefine
			parse_from_file_name
		end

	DP_INTERFACE
		redefine
			implementation
		end

feature -- Callbacks

	set_callbacks (c: XM_CALLBACKS) is
			-- Callbacks not implemented for bridged parsers.
		do
			check not_implemented: false end
		end

	set_dtd_callbacks (c: XM_DTD_CALLBACKS) is
			-- Callbacks not implemented for bridged parsers.
		do
			check not_implemented: false end
		end

feature {ANY} -- Access

	is_incremental: BOOLEAN is
			-- Can parser handle incremental feed? If yes, you can feed
			-- the parser a document in several steps. You must use the
			-- special parseing routines (the ones that contain
			-- "incremental" in their name) to do this and call
			-- `set_end_of_document' after the last part has been fed.
		do
			Result := implementation.is_incremental
		end

	source: XM_SOURCE is
			-- Source of the XML document beeing parserd.
			-- If `Void' the source is unkown.
		do
			Result := implementation.source
		end

feature {ANY} -- Element change

	set_source (a_source: XM_SOURCE) is
			-- Make `a_source' the source of the XML document to parse.
		do
			implementation.set_source (a_source)
		end

feature {ANY} -- Parsing

	parse_from_file_name (a_file_name: UC_STRING) is
			-- Parse XML Document from file
			-- `source' will be automatically set.
		do
			implementation.parse_from_file_name (a_file_name)
		end

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse XML Document from GOBO input stream.
		do
			implementation.parse_from_stream (a_stream)
		end

	parse_from_string (data: STRING) is
			-- Parse `data'.
		do
			implementation.parse_from_string (data)
		end

feature {ANY} -- Incremental parsing

	parse_incremental_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse partial XML document from GOBO input stream.
			-- After the last part of the data has been fed into the parser,
			-- call set_end_of_document to get any pending error messages.
		do
			implementation.parse_incremental_from_stream (a_stream)
		end

	parse_incremental_from_string (data: STRING) is
			-- Parse partial XML document from 'data'.
			-- Note: You can call parse_string multiple times
			-- and give the parse the document in parts only.
			-- You have to call 'set_end_of_file' after the
			-- last call to 'parse_string' in every case.
		do
			implementation.parse_incremental_from_string (data)
		end

	set_end_of_document is
			-- Call this routine to tell the parser that the document 
			-- has been completly parsed and no input is comming anymore.
		do
			implementation.set_end_of_document
		end

feature -- Status

	last_error: INTEGER is
			-- See XM_PARSE_ERROR_CODES.
		do
			Result := implementation.last_error
		end

	is_correct: BOOLEAN is
			-- Returns False if an error was detected during parsing
		do
				-- TODO: Either we use the same error codes for all parsers
				-- than this feature can be implemented in the interface
				-- simply by comparing to `last_error` with the error code
				-- for no error. If we use parser dependent error codes we
				-- may need to do this query in the implementation.
			Result := last_error = Xml_err_none
		end

	last_error_description: STRING is
			-- Returns a text that explain what the error reported by
			-- `last_error' was all about.
		do
			Result := implementation.last_error_description
		end

	position: XM_POSITION is
			-- Current position in the source of the XML document.
		do
			Result := implementation.position
		end

feature {NONE} -- Implementation

	implementation: XI_PARSER

end 
