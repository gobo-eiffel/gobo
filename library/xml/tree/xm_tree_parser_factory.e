indexing

	description:

		""

	status:  "See notice at end of class."
	author:  "Andreas Leitner"
	note:    ""

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

