indexing

	description:

		"Eiffel internal (do or once) routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_ROUTINE

inherit

	ET_ROUTINE
		redefine
			reset, locals
		end

feature -- Initialization

	reset is
			-- Reset feature as it was when it was first parsed.
		do
			if locals /= Void then
				locals.reset
			end
			if compound /= Void then
				compound.reset
			end
			if rescue_clause /= Void then
				rescue_clause.reset
			end
		end

feature -- Access

	compound: ET_COMPOUND
			-- Routine body

	locals: ET_LOCAL_VARIABLE_LIST
			-- Local variables

	rescue_clause: ET_COMPOUND
			-- Rescue clause

end
