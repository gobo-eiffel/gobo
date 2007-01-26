indexing

	description:

		"Abstract definition of a non-incremental XML parser"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_NON_INCREMENTAL_PARSER

inherit

	XM_PARSER

feature -- Status report

	is_incremental: BOOLEAN is False
			-- Non incremental parser

feature -- Incremental parsing

	parse_incremental_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Precondition always false.
		do
		ensure then
			not_possible: False
		end

	parse_incremental_from_string (data: STRING) is
			-- Precondition always false.
		do
		ensure then
			not_possible: False
		end

	finish_incremental is
			-- Precondition always false.
		do
		ensure then
			not_possible: False
		end

end
