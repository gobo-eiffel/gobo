note

	description:

		"Eiffel closures with components common to internal (do, once, attribute) features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_FEATURE_CLOSURE

inherit

	ET_FEATURE_CLOSURE
		redefine
			locals
		end

feature -- Access

	compound: detachable ET_COMPOUND
			-- Routine body

	locals: detachable ET_LOCAL_VARIABLE_LIST
			-- Local variables

	rescue_clause: detachable ET_COMPOUND
			-- Rescue clause

feature -- Setting

	set_compound (a_compound: like compound)
			-- Set `compound' to `a_compound'.
		do
			compound := a_compound
		ensure
			compound_set: compound = a_compound
		end

	set_locals (a_locals: like locals)
			-- Set `locals' to `a_locals'.
		do
			locals := a_locals
		ensure
			locals_set: locals = a_locals
		end

	set_rescue_clause (a_rescue: like rescue_clause)
			-- Set `rescue_clause' to `a_rescue'.
		do
			rescue_clause := a_rescue
		ensure
			rescue_clause_set: rescue_clause = a_rescue
		end

end
