indexing

	description:

		"Pattern matchers"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class LX_PATTERN_MATCHER

feature {NONE} -- Initialization

	make is
			-- Create a new pattern matcher.
		do
		ensure
			not_compiled: not compiled
		end

feature -- Element change

	compile (a_pattern: STRING; i: BOOLEAN) is
			-- Compile `a_pattern'. Make the matching engine
			-- case-insensitive if `i' is set. Set `compiled'
			-- to True after successful compilation.
		require
			a_pattern_not_void: a_pattern /= Void
		deferred
		end

feature -- Status report

	compiled: BOOLEAN is
			-- Has pattern been sucessfully compiled?
		deferred
		end

	matches (a_string: STRING): BOOLEAN is
			-- Does `a_string' include a token of the language
			-- described by current pattern?
		require
			compiled: compiled
			a_string_not_void: a_string /= Void
		deferred
		end

	recognizes (a_string: STRING): BOOLEAN is
			-- Is `a_string' a token of the language
			-- described by current pattern?
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
			-- by current pattern in `a_string'
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

feature -- Multiple matching

	match_strings (an_input: DS_LINEAR [STRING]; an_output: DS_EXTENDIBLE [STRING]) is
			-- Put in `an_output' all strings of `an_input' that include
			-- a token of the language described by current pattern.
			-- (Strings are inserted in `an_output' in the same order
			-- as they appear in `an_input' when the internal
			-- implementation of `an_output' permits.)
		require
			compiled: compiled
			an_input_not_void: an_input /= Void
			no_void_input: not an_input.has (Void)
			an_output_not_void: an_output /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_string: STRING
		do
			a_cursor := an_input.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_string := a_cursor.item
				if matches (a_string) then
					an_output.force (a_string)
				end
				a_cursor.forth
			end
		end

	recognize_strings (an_input: DS_LINEAR [STRING]; an_output: DS_EXTENDIBLE [STRING]) is
			-- Put in `an_output' all strings of `an_input' that are
			-- tokens of the language described by current pattern.
			-- (Strings are inserted in `an_output' in the same order
			-- as they appear in `an_input' when the internal
			-- implementation of `an_output' permits.)
		require
			compiled: compiled
			an_input_not_void: an_input /= Void
			no_void_input: not an_input.has (Void)
			an_output_not_void: an_output /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_string: STRING
		do
			a_cursor := an_input.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_string := a_cursor.item
				if recognizes (a_string) then
					an_output.force (a_string)
				end
				a_cursor.forth
			end
		end

end -- class LX_PATTERN_MATCHER
