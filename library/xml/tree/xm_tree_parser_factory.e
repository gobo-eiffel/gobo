indexing

	description:

		"Abstract definition of a factory that creates tree based XML %
		%parser objects"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XM_TREE_PARSER_FACTORY

feature {ANY}

	is_available: BOOLEAN is
		deferred
		end

	new_tree_parser: XM_TREE_PARSER is
			-- Create a tree based parser
		require
			is_available: is_available
		deferred
		end

	new_tree_parser_imp: XI_TREE_PARSER is
			-- Create a tree based parser implementation
		require
			is_available: is_available
		deferred
		end

end -- class XM_TREE_PARSER_FACTORY

