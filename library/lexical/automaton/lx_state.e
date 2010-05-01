note

	description:

		"States of finite automata"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_STATE

inherit

	KL_CLONABLE

feature -- Status report

	is_accepting: BOOLEAN is
			-- Is current state an accepting state?
		deferred
		end

end
