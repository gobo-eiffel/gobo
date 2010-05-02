note

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

	make
			-- Create a new pattern matcher.
		do
			wipe_out
		end

feature -- Element change

	compile (a_pattern: STRING; i: BOOLEAN)
			-- Compile `a_regexp'. Make the matching engine
			-- case-insensitive if `i' is set. Set `compiled'
			-- to True after successful compilation.
		require
			a_pattern_not_void: a_pattern /= Void
		deferred
		ensure
			pattern_set: pattern = a_pattern
			case_insensitive_set: is_case_insensitive = i
			not_matched: not has_matched
			not_matching: not is_matching
		end

	compile_case_sensitive (a_pattern: STRING)
			-- Compile `a_pattern'. Make the matching engine
			-- case-sensitive. Set `is_compiled' to True after
			-- successful compilation.
		do
			compile (a_pattern, False)
		ensure then
			case_sensitive: not is_case_insensitive
		end

	compile_case_insensitive (a_pattern: STRING)
			-- Compile `a_pattern'. Make the matching engine
			-- case-insensitive. Set `is_compiled' to True after
			-- successful compilation.
		require
			a_pattern_not_void: a_pattern /= Void
		do
			compile (a_pattern, True)
		ensure
			pattern_set: pattern = a_pattern
			case_insensitive: is_case_insensitive
			not_matched: not has_matched
			not_matching: not is_matching
		end

feature -- Access

	pattern: STRING
			-- Pattern being matched

	matched_position (a_string: STRING): DS_PAIR [INTEGER, INTEGER]
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
			definition_first: Result /= Void implies Result.first = captured_start_position (0)
			definition_second: Result /= Void implies Result.second = captured_end_position (0)
		end

feature -- Status report

	is_case_insensitive: BOOLEAN
			-- Is current pattern matcher case-insensitive?

end
