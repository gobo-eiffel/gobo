indexing

	description:

		"Abstract factory for event based XML parsers"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XM_EVENT_PARSER_FACTORY

feature {ANY}

	is_available: BOOLEAN is
			-- Is this parser compiled in?
		deferred
		end

	new_event_parser: XM_EVENT_PARSER is
			-- Create a event based parser
		require
			is_available: is_available
		deferred
		end

	new_event_parser_imp: XI_EVENT_PARSER is
			-- Create a event based parser implementation
		require
			is_available: is_available
		deferred
		end

end -- class XM_EVENT_PARSER_FACTORY

