indexing

	description:

		"Eiffel external routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTERNAL_ROUTINE

inherit

	ET_ROUTINE

feature -- Access

	language: ET_MANIFEST_STRING
			-- External language

	alias_clause: ET_MANIFEST_STRING
			-- Alias clause

invariant

	language_not_void: language /= Void

end -- class ET_EXTERNAL_ROUTINE
