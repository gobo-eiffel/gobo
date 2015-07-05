note

	description:

		"Eiffel closures with components common to extended attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTENDED_ATTRIBUTE_CLOSURE

inherit

	ET_FEATURE_CLOSURE
		undefine
			type
		redefine
			type, locals
		end

feature -- Access

	type: ET_TYPE
			-- Return type
		deferred
		ensure then
			type_not_void: Result /= Void
		end

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
