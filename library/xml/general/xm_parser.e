indexing
   description:	"A tree based XML Parser"
   status:			"See notice at end of class."
   author:			"Andreas Leitner"
   note:				"Although it is not DOM (Level 1) conforming, it has %
   %been writen with DOM in mind. I prefer to have this %
   %parser follow the Eiffel design guide lines";
class
   
   XM_PARSER

inherit
   DP_INTERFACE
      redefine
	 implementation
      end
   
   XM_ERROR_CODES
   KL_IMPORTED_INPUT_STREAM_ROUTINES
   KL_IMPORTED_STRING_BUFFER_ROUTINES
   
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
	 -- source of the xml document beeing parserd.
	 -- if void the source is unkown.
      do
	 Result := implementation.source
      end
   

feature {ANY} -- Element change
   set_source (a_source: XM_SOURCE) is
	 -- set the source of the xml document to parse.
      do
	implementation.set_source (a_source) 
      end
feature {ANY} -- Parsing
   
   parse_from_file_name (a_file_name: UC_STRING) is
	 -- Parse XML Document from file
	 -- `source' will be automatically set
      require
	 a_file_name_not_void: a_file_name /= Void
	 -- file must exist and be readable (how to check that on a 
	 -- compiler independend way?)
      do
	 implementation.parse_from_file_name (a_file_name)
      end
   
   
   parse_from_stream (a_stream: like INPUT_STREAM_TYPE) is
	 -- Parse XML Document from GOBO input stream.
      require
	 a_stream_not_void: a_stream /= Void
      do
	 implementation.parse_from_stream (a_stream)
      end
   
   parse_from_string_buffer (a_buffer: like STRING_BUFFER_TYPE) is
	 -- Parse XML Document from GOBO string buffer. This is 
	 -- faster that parsing from a regular STRING on some systems.
      require
	 a_buffer_not_void: a_buffer /= Void
      do
	 implementation.parse_from_string_buffer (a_buffer)
      end
   
   parse_from_string (data: STRING) is
	 -- Parse 'data'.
      require
	 data_not_void: data /= Void
      do
	 implementation.parse_from_string (data)
      end

feature {ANY} -- Incremental Parsing
   
   parse_incremental_from_stream (a_stream: like INPUT_STREAM_TYPE) is
	 -- Parse partial XML document from GOBO input stream.
	 -- After the last part of the data has been fed into the parser,
	 -- call set_end_of_document to get any pending error messages.
      require
	 is_incremental: is_incremental
	 a_stream_not_void: a_stream /= Void
      do
	 implementation.parse_incremental_from_stream (a_stream)
      end
   
   parse_incremental_from_string_buffer (a_buffer: like STRING_BUFFER_TYPE) is
	 -- Parse partial XML document from GOBO input stream.
	 -- After the last part of the data has been fed into the parser,
	 -- Parse XML Document from GOBO string buffer. This is 
	 -- faster that parsing from a regular STRING on some systems.
      require
	 a_buffer_not_void: a_buffer /= Void
      do
	 implementation.parse_incremental_from_string_buffer (a_buffer)
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
      do
	 implementation.parse_incremental_from_string (data)
      end

   set_end_of_document is
	 -- Call this routine to
	 -- tell the parser that the document has been
	 -- completly parsed and no input is comming anymore.
      require
	 is_incremental: is_incremental
      do
	 implementation.set_end_of_document
      end


   
feature -- Status
   last_error: INTEGER is
	 -- see XM_PARSE_ERROR_CODES
      do
	 Result := implementation.last_error
      end

   is_correct: BOOLEAN is
	 -- returns False if an error was detected
	 -- by the parser
      do
	 -- TODO: Either we use the same error codes for all parsers 
	 -- than this feature can be implemented in the interface 
	 -- simply by comparing to `last_error` with the error code 
	 -- for no error. If we use parser dependent error codes we 
	 -- may need to do this query in the implementation.
	 Result := last_error = Xml_err_none
      ensure
--	 error_flag_set: (Result = True) implies (last_error = Xml_error_none)
--	 error_flag_set2: (Result = False) implies (last_error /= Xml_error_none)
      end


   last_error_description: STRING is 
	 -- gives a text that explain what the error reported by 
	 -- 'last_error' was all about.
      do
	 Result := implementation.last_error_description

      end

   last_error_extended_description: STRING is
	 -- extends `last_error_description' with information about 
	 -- where the error occured.
      do
	 !! Result.make (0)
	 Result.append (last_error_description)
	 Result.append ("(")
	 Result.append (position.out)
	 Result.append (")")
      end

   position: XM_POSITION is
	 -- current position
      do
	 Result := implementation.position
      end
   
feature {NONE} -- Implementation   
   implementation: XI_PARSER
end -- class XM_PARSER
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
