indexing

	description:

		"Factory that creates tree based parsers, that rely on a event based parser"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XT_TREE_PARSER_FACTORY

inherit

	XM_TREE_PARSER_FACTORY

creation

	make

feature

	make (a_event_parser_factory: XM_EVENT_PARSER_FACTORY) is
			-- Create factory and use `a_event_parser_factory' to 
			-- retrieve event based parser for creation of the tree 
			-- based parsers.
		require
			a_event_parser_factory_not_void: a_event_parser_factory /= Void
		do
			event_parser_factory := a_event_parser_factory
		ensure
			event_parser_factory_set: event_parser_factory = a_event_parser_factory
		end

feature

	is_available: BOOLEAN is True
			-- Is this type of parser compiled in?

	new_tree_parser: XM_TREE_PARSER is
			-- Create and return a new tree parser.
		do
			!! Result.make_from_implementation (new_tree_parser_imp)
		end

	new_tree_parser_imp: XI_TREE_PARSER is
			-- Create and return a new tree parser implementation.
		do
			!XT_TREE_PARSER! Result.make_from_implementation (event_parser_factory.new_event_parser_imp)
		end

feature {NONE} -- Implementation

	event_parser_factory: XM_EVENT_PARSER_FACTORY

end -- class XT_TREE_PARSER_FACTORY

