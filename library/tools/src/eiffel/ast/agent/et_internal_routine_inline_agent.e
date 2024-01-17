note

	description:

		"Eiffel inline agents with a internal (do or once) routine as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2014, Eric Bezault and others"
	license: "MIT License"

deferred class ET_INTERNAL_ROUTINE_INLINE_AGENT

inherit

	ET_ROUTINE_INLINE_AGENT
		undefine
			locals
		redefine
			reset
		end

	ET_INTERNAL_ROUTINE_CLOSURE
		rename
			arguments as formal_arguments
		end

feature -- Initialization

	reset
			-- Reset inline agent as it was just after it was last parsed.
		do
			precursor
			if attached locals as l_locals then
				l_locals.reset
			end
			if attached compound as l_compound then
				l_compound.reset
			end
			if attached rescue_clause as l_rescue_clause then
				l_rescue_clause.reset
			end
		end

end
