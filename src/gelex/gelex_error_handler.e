indexing

	description:

		"Gobo Eiffel Lex error handlers";

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
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

	usage: STRING is "usage: gelex [-bcdefimosVw] [-o filename] filename"
			-- Command line Usage

	version: STRING is "gelex version 0.2"
			-- Version number

end -- class GELEX_ERROR_HANDLER
