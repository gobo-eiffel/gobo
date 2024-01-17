note

	description:

		"PCRE regular expression routines"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class RX_PCRE_ROUTINES

feature -- Access

	regexp (a_pattern: READABLE_STRING_GENERAL): RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression corresponding to `a_pattern'.
			--
			-- There are two different sets of meta-characters: those  that
			-- are recognized anywhere in the pattern except within square
			-- brackets, and those that are recognized in square brackets.
			-- Outside square brackets, the meta-characters are as follows:
			--   \      general escape character with several uses
			--   ^      assert start of subject (or line, in multiline mode)
			--   $      assert end of subject (or line, in multiline mode)
			--   .      match any character except newline (by default)
			--   [      start character class definition
			--   |      start of alternative branch
			--   (      start subpattern
			--   )      end subpattern
			--   ?      extends the meaning of (
			--          also 0 or 1 quantifier
			--          also quantifier minimizer
			--   *      0 or more quantifier
			--   +      1 or more quantifier
			--   {      start min/max quantifier
			--
			-- Part of a pattern that is in square brackets is called a
			-- "character  class". In a character class the only meta-
			-- characters are:
			--   \      general escape character
			--   ^      negate the class, but only if the first character
			--   -      indicates character range
			--   ]      terminates the character class
		require
			a_pattern_not_void: a_pattern /= Void
		do
			create Result.make
			Result.compile (a_pattern)
		ensure
			instance_free: class
			regexp_not_void: Result /= Void
			pattern_set: Result.pattern = a_pattern
			not_matched: not Result.has_matched
			not_matching: not Result.is_matching
		end

end
