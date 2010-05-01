note

	description:

		"Eiffel note clauses which appear in a semicolon-separated list of note clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INDEXING_ITEM

inherit

	ET_AST_NODE

feature -- Access

	indexing_clause: ET_INDEXING is
			-- Note clause in semicolon-separated list
		deferred
		ensure
			indexing_clause_not_void: Result /= Void
		end

end
