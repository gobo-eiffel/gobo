indexing

	description:

		"Regular expressions";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

deferred class LX_REGULAR_EXPRESSION

feature -- Element change

	compile (a_regexp: STRING) is
			-- Compile `a_regexp'. Set `compiled' to True
			-- after successful compilation.
		require
			a_regexp_not_void: a_regexp /= Void
		deferred
		end

feature -- Status report

	compiled: BOOLEAN is
			-- Has current regular expression
			-- been sucessfully compiled?
		deferred
		end

	matches (a_string: STRING): BOOLEAN is
			-- Does current regular expression match `a_string'?
		require
			compiled: compiled
			a_string_not_void: a_string /= Void
		deferred
		end

end -- class LX_REGULAR_EXPRESSION
