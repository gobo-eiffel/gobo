
indexing

	description: 
		
		"Implementation of XM_PARSER using the native Eiffel parser"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum Freeware License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
class XM_EIFFEL_PARSER

inherit

	XM_NON_INCREMENTAL_PARSER
	
	XF_FULL_PARSER
		export
			{NONE} all
		end
		
	XM_FORWARD_CALLBACKS
		redefine
			on_error
		end
		
	XM_FORWARD_DTD_CALLBACKS

creation

	make
	
feature -- Source

	source: XM_SOURCE
			-- Source identification.
	
	set_source (a: XM_SOURCE) is
			-- Set source.
		do
			source := a
		end

feature -- Parsing

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse stream.
		do
			!XM_FILE_SOURCE! source.make (a_stream.name)
			parse_stream (a_stream)
		end
		
	parse_from_file_name (a_file_name: UC_STRING) is
			-- Parse file.
		do
			!XM_FILE_SOURCE! source.make (a_file_name.to_utf8)
			parse_file (a_file_name.to_utf8)
		end
		
	parse_from_string (a: STRING) is
			-- Parse from UTF8 string.
		local
			a_stream: KL_STRING_INPUT_STREAM
		do
			!XM_STRING_SOURCE! source
			!! a_stream.make (a)
			parse_stream (a_stream)
		end
	
feature {NONE} -- Error

	on_error (a: STRING) is
			-- On error.
		do
			last_error_description := a
			Precursor (a)
		end	
		
feature -- Error

	is_correct: BOOLEAN is
			-- Is this correct?
		do
			Result := not syntax_error
		end

	last_error: INTEGER is
			-- Last error code.
		do
			if is_correct then
				Result := Xml_err_unknown
			else
				Result := Xml_err_none
			end
		end
		
	last_error_description: STRING
			-- Last error description.
	
	position: XM_POSITION is
			-- Current position.
		local
			a_source: XM_FILE_SOURCE
		do
			!! a_source.make (filename)
			!XM_DEFAULT_POSITION! Result.make (a_source, byte_position, column, line)
		end

end
	
