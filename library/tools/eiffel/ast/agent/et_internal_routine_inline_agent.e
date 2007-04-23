indexing

	description:

		"Eiffel inline agents with a internal (do or once) routine as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_ROUTINE_INLINE_AGENT

inherit

	ET_ROUTINE_INLINE_AGENT
		redefine
			reset,
			locals
		end

feature -- Initialization

	reset is
			-- Reset inline agent as it was just after it was last parsed.
		do
			precursor
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

feature -- Setting

	set_compound (a_compound: like compound) is
			-- Set `compound' to `a_compound'.
		do
			compound := a_compound
		ensure
			compound_set: compound = a_compound
		end

	set_locals (a_locals: like locals) is
			-- Set `locals' to `a_locals'.
		do
			locals := a_locals
		ensure
			locals_set: locals = a_locals
		end

	set_rescue_clause (a_rescue: like rescue_clause) is
			-- Set `rescue_clause' to `a_rescue'.
		do
			rescue_clause := a_rescue
		ensure
			rescue_clause_set: rescue_clause = a_rescue
		end

end
