indexing

	description:

		"Gobo Eiffel Lex error handlers"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class GELEX_ERROR_HANDLER

inherit

	LX_LEX_ERROR_HANDLER

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new error handler.
		do
		end

feature -- Access

	program_name: STRING is "gelex"
			-- Program name

	usage: STRING is
		"usage: gelex [--version] [--help] [-bcefhimsVw?]%N%
		%%T[-a size] [-o filename] [--] filename"
			-- Command line Usage

	version: STRING is "gelex version 1.0b"
			-- Version number

end -- class GELEX_ERROR_HANDLER
