indexing

	description:

		"Eiffel indexing terms which appear in a comma-separated list of indexing terms"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INDEXING_TERM_ITEM

inherit

	ET_AST_NODE

feature -- Access

	indexing_term: ET_INDEXING_TERM is
			-- Indexing term in comma-separated list
		deferred
		ensure
			indexing_term_not_void: Result /= Void
		end

end
