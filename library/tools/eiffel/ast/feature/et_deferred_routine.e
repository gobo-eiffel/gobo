indexing

	description:

		"Eiffel deferred routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DEFERRED_ROUTINE

inherit

	ET_ROUTINE
		redefine
			is_deferred
		end

feature -- Status report

	is_deferred: BOOLEAN is True
			-- Is feature deferred?

feature -- Access

	deferred_keyword: ET_KEYWORD
			-- 'deferred' keyword

feature -- Setting

	set_deferred_keyword (a_deferred: like deferred_keyword) is
			-- Set `deferred_keyword' to `a_deferred'.
		require
			a_deferred_not_void: a_deferred /= Void
		do
			deferred_keyword := a_deferred
		ensure
			deferred_keyword_set: deferred_keyword = a_deferred
		end

invariant

	deferred_keyword_not_void: deferred_keyword /= Void

end
