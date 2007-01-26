indexing

	description:

		"Pattern matchers"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_PATTERN_MATCHER

inherit

	RX_PATTERN_MATCHER
		rename
			compile as compile_case_sensitive
		end

feature {NONE} -- Initialization

	make is
			-- Create a new pattern matcher.
		do
			wipe_out
		end

feature -- Element change

	compile (a_pattern: STRING; i: BOOLEAN) is
			-- Compile `a_regexp'. Make the matching engine
			-- case-insensitive if `i' is set. Set `compiled'
			-- to True after successful compilation.
		require
			a_pattern_not_void: a_pattern /= Void
		deferred
		ensure
			not_matched: not has_matched
			not_matching: not is_matching
		end

	compile_case_sensitive (a_pattern: STRING) is
			-- Compile `a_pattern'. Make the matching engine
			-- case-sensitive. Set `is_compiled' to True after
			-- successful compilation.
		do
			compile (a_pattern, False)
		end

	compile_case_insensitive (a_pattern: STRING) is
			-- Compile `a_pattern'. Make the matching engine
			-- case-insensitive. Set `is_compiled' to True after
			-- successful compilation.
		require
			a_pattern_not_void: a_pattern /= Void
		do
			compile (a_pattern, True)
		ensure
			not_matched: not has_matched
			not_matching: not is_matching
		end

feature -- Access

	matched_position (a_string: STRING): DS_PAIR [INTEGER, INTEGER] is
			-- Position of the longest-leftmost token matched
			-- by current pattern in `a_string'
		require
			compiled: is_compiled
			a_string_not_void: a_string /= Void
		do
			match (a_string)
			if has_matched then
				create Result.make (captured_start_position (0), captured_end_position (0))
			end
		ensure
			is_matching: is_matching
			subject_set: subject = a_string
			subject_start_set: subject_start = 1
			subject_end_set: subject_end = a_string.count
			matched: has_matched implies Result /= Void
			definition: Result /= Void implies
				(Result.first = captured_start_position (0) and
				Result.second = captured_end_position (0))
		end

feature -- Obsolete

	compiled: BOOLEAN is
			-- Has pattern been sucessfully compiled?
		obsolete
			"[020706] Use `is_compiled' instead."
		do
			Result := is_compiled
		end

end
