indexing

	description:

		"Eiffel external routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTERNAL_ROUTINE

inherit

	ET_ROUTINE

feature -- Access

	language: ET_EXTERNAL_LANGUAGE
			-- External language

	alias_clause: ET_EXTERNAL_ALIAS
			-- Alias clause

invariant

	language_not_void: language /= Void

end
