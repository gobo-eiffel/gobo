
indexing

	description:

		"Abstract definition of a non-incremental XML parser"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_NON_INCREMENTAL_PARSER

inherit

	XM_PARSER
	
feature -- Access

	is_incremental: BOOLEAN is false
			-- Non incremental parser.
			
feature -- Incremental parsing

	parse_incremental_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Precondition always false.
		do
		ensure then
			not_possible: false
		end
		
	parse_incremental_from_string (data: STRING) is
			-- Precondition always false.
		do
		ensure then
			not_possible: false
		end

	set_end_of_document is
			-- Precondition always false.
		do
		ensure then
			not_possible: false
		end

end
