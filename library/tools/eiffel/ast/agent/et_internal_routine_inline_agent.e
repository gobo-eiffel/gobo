note

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

end
