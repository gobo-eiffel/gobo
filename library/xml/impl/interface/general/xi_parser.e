indexing

	description:

		"A tree based XML Parser"

	status:  "See notice at end of class."
	author:  "Andreas Leitner"
	note:    "Although it is not DOM (Level 1) conforming, it has %
			 %been writen with DOM in mind. I prefer to have this %
			 %parser follow the Eiffel design guide lines"

deferred class XI_PARSER

inherit

	DP_IMPLEMENTATION

	KL_IMPORTED_INPUT_STREAM_ROUTINES

	KL_IMPORTED_STRING_BUFFER_ROUTINES

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
			-- source of the xml document beeing parserd.
			-- if void the source is unkown.
		deferred
		end

feature {ANY} -- Element change

	set_source (a_source: XM_SOURCE) is
			-- set the source of the xml document to parse.
		deferred
		end

feature {ANY} -- Parsing

	parse_from_file_name (a_file_name: UC_STRING) is
		require
			a_file_name_not_void: a_file_name /= Void
		deferred
		end

	parse_from_stream (a_stream: like input_stream_type) is
			-- parse XML Document from GOBO input stream.
		require
			a_stream_not_void: a_stream /= Void
		deferred
		end

	parse_from_string_buffer (a_buffer: like string_buffer_type) is
			-- Parse XML Document from GOBO string buffer. This is
			-- faster that parsing from a regular STRING on some systems.
		require
			a_buffer_not_void: a_buffer /= Void
		deferred
		end

	parse_from_string (data: STRING) is
			-- Parse 'data'.
		require
			data_not_void: data /= Void
		deferred
		end

feature {ANY} -- Incremental parsing

	parse_incremental_from_stream (a_stream: like input_stream_type) is
			-- Parse partial XML document from GOBO input stream.
			-- After the last part of the data has been fed into the parser,
			-- call set_end_of_document to get any pending error messages.
		require
			a_stream_not_void: a_stream /= Void
		deferred
		end

	parse_incremental_from_string_buffer (a_buffer: like string_buffer_type) is
			-- Parse partial XML document from GOBO input stream.
			-- After the last part of the data has been fed into the parser,
			-- Parse XML Document from GOBO string buffer. This is
			-- faster that parsing from a regular STRING on some systems.
		require
			a_buffer_not_void: a_buffer /= Void
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
		deferred
		end

	set_end_of_document is
			-- Call this routine to
			-- tell the parser that the document has been
			-- completly parsed and no input is comming anymore.
		deferred
		end

feature -- Status

	last_error: INTEGER is
			-- see XM_PARSE_ERROR_CODES
		deferred
		end

	last_error_description: STRING is
			-- gives a text that explain what the error reported by
			-- 'last_error' was all about.
		deferred
		end

	position: XM_POSITION is
			-- current position
		deferred
		end

end -- class XI_PARSER
--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.at
--| www: http://exml.dhs.org
--|-------------------------------------------------------------------------

