indexing

	description:

		"Regular expressions"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class LX_REGULAR_EXPRESSION

feature -- Element change

	compile (a_regexp: STRING; i: BOOLEAN) is
			-- Compile `a_regexp'. Make the matching engine
			-- case-insensitive if `i' is set. Set `compiled'
			-- to True after successful compilation.
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
			-- Does `a_string' include a token of the language
			-- described by current regular expression?
		require
			compiled: compiled
			a_string_not_void: a_string /= Void
		deferred
		end

	recognizes (a_string: STRING): BOOLEAN is
			-- Is `a_string' a token of the language
			-- described by current regular expression?
		require
			compiled: compiled
			a_string_not_void: a_string /= Void
		deferred
		ensure
			definition: Result =
				(matches (a_string) and then
				(matched_position (a_string).first = 1 and
				matched_position (a_string).second = a_string.count))
		end

feature -- Access

	matched_position (a_string: STRING): DS_PAIR [INTEGER, INTEGER] is
			-- Position of the longest-leftmost token matched
			-- by current regular expression in `a_string'
		require
			compiled: compiled
			a_string_not_void: a_string /= Void
		deferred
		ensure
			matched: matches (a_string) implies Result /= Void
			valid_position: Result /= Void implies
				(Result.first >= 1 and
				Result.first <= Result.second + 1 and
				Result.second <= a_string.count)
		end

end -- class LX_REGULAR_EXPRESSION
