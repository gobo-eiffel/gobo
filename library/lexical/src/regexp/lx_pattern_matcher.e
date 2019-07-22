note

	description:
	"[
		Pattern matchers.
		
		Compilation routines:
		---------------------
		
		The differences between Unicode mode and byte (8-bit character)
		mode are as follows:
		. In Unicode mode, characters are internally encoded in UTF-8.
		  So the character 'é' (U+00E9) is handled as a sequence of two
		  bytes \xC3\xA9.
		  Invalid or surrogate Unicode characters are internally handled
		  as the single byte \xFF, which is not valid in UTF-8. This
		  will produce a syntax error when compiling the regular expression.
		. In byte mode, 8-bit characters (even those with a code greater
		  then 127 (e.g. 'é') are handled as a single byte (e.g. \xE9).
		. In byte mode, Unicode characters with code greater than 255
		  (e.g. '∀') are not accepted. However, escaped characters of
		  the form \u2200 are accepted and handled as the UTF-8 byte
		  sequence, except in character classes ('[a-z]') which can
		  contain 8-bit characters only.
		. In Unicode mode, octal and hexadecimal escaped characters
		  (e.g. '\xE9') are handled as a single byte, even if they
		  are invalid UTF-8 bytes. Remember that internally, the matcher
		  handles bytes (form the UTF-8 encoding), not Unicode characters
		  directly. However, octal and hexadecimal escaped characters are
		  not accepted in character classes because character classes
		  should only contain valid Unicode characters.
		. The character class '.', like any other character class,
		  is only made up of 8-bit characters in byte mode (all
		  8-bit characters except the newline character '\n'), and
		  of valid non-surrogate Unicode characters in Unicode mode
		  (all valid non-surrogate Unicode characters except the
		  newline character '\n').
		Also note that we can switch between the Unicode mode and byte mode
		using the options "(u:rexexp)" and "(b:regexp)".
		
		Matching routines:
		------------------

		The difference between `match' and `unicode_match' (and similarly
		for other matching routines) is that non-ASCII 8-bit characters in
		the subject (with code greater than 127, e.g. 'é') will try to be
		matched as a single byte (e.g. \xE9) and not as the UTF-8 sequence
		of bytes (e.g. \xC3\xA9) of the corresponding Unicode character
		(e.g. U+00E9).
		Also note that invalid or surrogate Unicode characters are internally
		handled as the single byte \xFF, which is not valid in UTF-8.
	]"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_PATTERN_MATCHER

inherit

	RX_PATTERN_MATCHER
		rename
			compile as compile_case_sensitive,
			matches as unicode_matches,
			recognizes as unicode_recognizes,
			match as unicode_match,
			match_substring as unicode_match_substring,
			match_unbounded_substring as unicode_match_unbounded_substring,
			match_strings as unicode_match_strings,
			recognize_strings as unicode_recognize_strings
		end

feature {NONE} -- Initialization

	make
			-- Create a new pattern matcher.
		do
			wipe_out
		end

feature -- Element change

	compile (a_pattern: READABLE_STRING_GENERAL; i: BOOLEAN)
			-- Compile `a_pattern' in byte (8-bit character) mode.
			-- Make the matching engine case-insensitive if `i' is set.
			-- Set `compiled' to True after successful compilation.
		require
			a_pattern_not_void: a_pattern /= Void
		do
			compile_with_options (a_pattern, i, False)
		ensure
			pattern_set: pattern = a_pattern
			case_insensitive_set: is_case_insensitive = i
			not_matched: not has_matched
			not_matching: not is_matching
		end

	compile_case_sensitive (a_pattern: READABLE_STRING_GENERAL)
			-- Compile `a_pattern' in byte (8-bit character) mode.
			-- Make the matching engine case-sensitive.
			-- Set `is_compiled' to True after successful compilation.
		do
			compile (a_pattern, False)
		ensure then
			case_sensitive: not is_case_insensitive
		end

	compile_case_insensitive (a_pattern: READABLE_STRING_GENERAL)
			-- Compile `a_pattern' in byte (8-bit character) mode.
			-- Make the matching engine case-insensitive.
			-- Set `is_compiled' to True after successful compilation.
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

	compile_unicode (a_pattern: READABLE_STRING_GENERAL)
			-- Compile `a_pattern' in Unicode mode.
			-- Make the matching engine case-sensitive.
			-- Set `compiled' to True after successful compilation.
		require
			a_pattern_not_void: a_pattern /= Void
		do
			compile_with_options (a_pattern, False, True)
		ensure
			pattern_set: pattern = a_pattern
			case_sensitive: not is_case_insensitive
			not_matched: not has_matched
			not_matching: not is_matching
		end

	compile_with_options (a_pattern: READABLE_STRING_GENERAL; i, u: BOOLEAN)
			-- Compile `a_pattern'.
			-- Make the matching engine case-insensitive if `i' is set.
			-- Enable Unicode mode if `u' is set.
			-- Set `compiled' to True after successful compilation.
		require
			a_pattern_not_void: a_pattern /= Void
		deferred
		ensure
			pattern_set: pattern = a_pattern
			case_insensitive_set: is_case_insensitive = i
			not_matched: not has_matched
			not_matching: not is_matching
		end

feature -- Access

	pattern: detachable READABLE_STRING_GENERAL
			-- Pattern being matched

	matched_position (a_string: STRING): detachable DS_PAIR [INTEGER, INTEGER]
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

	unicode_matched_position (a_string: like subject): detachable DS_PAIR [INTEGER, INTEGER]
			-- Position of the longest-leftmost token matched
			-- by current pattern in `a_string'
		require
			compiled: is_compiled
			a_string_not_void: a_string /= Void
		do
			unicode_match (a_string)
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

	matches (a_subject: STRING): BOOLEAN
			-- Does `a_subject' include a token of the language
			-- described by current pattern?
		require
			compiled: is_compiled
			a_subject_not_void: a_subject /= Void
		do
			match (a_subject)
			Result := has_matched
		ensure
			is_matching: is_matching
			subject_set: subject = a_subject
			subject_start_set: subject_start = 1
			subject_end_set: subject_end = a_subject.count
		end

	recognizes (a_subject: STRING): BOOLEAN
			-- Is `a_subject' a token of the language
			-- described by current pattern?
		require
			compiled: is_compiled
			a_subject_not_void: a_subject /= Void
		do
			match (a_subject)
			if has_matched then
				Result := captured_start_position (0) = 1 and captured_end_position (0) = a_subject.count
			end
		ensure
			is_matching: is_matching
			subject_set: subject = a_subject
			subject_start_set: subject_start = 1
			subject_end_set: subject_end = a_subject.count
			definition: Result = (has_matched and then (captured_start_position (0) = 1 and captured_end_position (0) = a_subject.count))
		end

	is_case_insensitive: BOOLEAN
			-- Is current pattern matcher case-insensitive?
			-- Note that only ASCII characters (code less than 128)
			-- are taken into account.

feature -- Matching

	match (a_subject: STRING)
			-- Try to match `a_subject' with the current pattern.
			-- Make result available in `has_matched' and the various
			-- `*_captured_*' features.			
		require
			compiled: is_compiled
			a_subject_not_void: a_subject /= Void
		do
			match_substring (a_subject, 1, a_subject.count)
		ensure
			is_matching: is_matching
			subject_set: subject = a_subject
			subject_start_set: subject_start = 1
			subject_end_set: subject_end = a_subject.count
		end

	match_substring (a_subject: STRING; a_from, a_to: INTEGER)
			-- Try to match the substring of `a_subject' between
			-- positions `a_from' and `a_to' with the current pattern.
			-- Make result available in `has_matched' and the various
			-- `*_captured_*' features.
		require
			compiled: is_compiled
			a_subject_not_void: a_subject /= Void
			a_from_large_enough: a_from >= 1
			a_to_small_enough: a_to <= a_subject.count
			valid_bounds: a_from <= a_to + 1
		deferred
		ensure
			is_matching: is_matching
			subject_set: subject = a_subject
			subject_start_set: subject_start = a_from
			subject_end_set: subject_end = a_to
		end

	match_unbounded_substring (a_subject: STRING; a_from, a_to: INTEGER)
			-- Try to match the substring of `a_subject' between
			-- positions `a_from' and `a_to' with the current pattern.
			-- Make result available in `has_matched' and the various
			-- `*_captured_*' features.
			--
			-- Note that if `a_from' is not 1, then ^ will not match at position `a_from'.
			-- And if `a_to' is not `a_subject.count' then $ will not match at position `a_to'.
		require
			compiled: is_compiled
			a_subject_not_void: a_subject /= Void
			a_from_large_enough: a_from >= 1
			a_to_small_enough: a_to <= a_subject.count
			valid_bounds: a_from <= a_to + 1
		deferred
		ensure
			is_matching: is_matching
			subject_set: subject = a_subject
			subject_start_set: subject_start = a_from
			subject_end_set: subject_end = a_to
		end

feature -- Multiple matching

	match_strings (an_input: DS_LINEAR [STRING]; an_output: DS_EXTENDIBLE [STRING])
			-- Put in `an_output' all strings of `an_input' that include
			-- a token of the language described by current pattern.
			-- (Strings are inserted in `an_output' in the same order
			-- as they appear in `an_input' when the internal
			-- implementation of `an_output' permits.)
		require
			compiled: is_compiled
			an_input_not_void: an_input /= Void
			no_void_input: not an_input.has_void
			an_output_not_void: an_output /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_string: STRING
		do
			a_cursor := an_input.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_string := a_cursor.item
				if matches (a_string) then
					an_output.force (a_string)
				end
				a_cursor.forth
			end
		end

	recognize_strings (an_input: DS_LINEAR [STRING]; an_output: DS_EXTENDIBLE [STRING])
			-- Put in `an_output' all strings of `an_input' that are
			-- tokens of the language described by current pattern.
			-- (Strings are inserted in `an_output' in the same order
			-- as they appear in `an_input' when the internal
			-- implementation of `an_output' permits.)
		require
			compiled: is_compiled
			an_input_not_void: an_input /= Void
			no_void_input: not an_input.has_void
			an_output_not_void: an_output /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_string: STRING
		do
			a_cursor := an_input.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_string := a_cursor.item
				if recognizes (a_string) then
					an_output.force (a_string)
				end
				a_cursor.forth
			end
		end

end
