note

	description:

		"Eiffel note clauses which appear in a semicolon-separated list of note clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_NOTE_ITEM

inherit

	ET_AST_NODE

feature -- Access

	note_clause: ET_NOTE
			-- Note clause in semicolon-separated list
		deferred
		ensure
			note_clause_not_void: Result /= Void
		end

end
