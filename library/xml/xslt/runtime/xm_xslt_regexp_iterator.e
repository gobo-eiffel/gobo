indexing

	description:

		"Objects that iterate over the sub-expressions of a regular expression"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_REGEXP_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_STRING_VALUE]
		redefine
			start, is_invulnerable
		end

	UC_UNICODE_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_input: STRING; a_regexp: RX_PCRE_REGULAR_EXPRESSION) is
			-- Establish invariant.
		require
			input_not_void: an_input /= Void
			regular_expression_not_void: a_regexp /= Void
		do
			input := an_input
			regexp := a_regexp
		ensure
			input_set: input = an_input
			regular_expression_set: regexp = a_regexp
		end

feature -- Access

	item: XM_XPATH_STRING_VALUE
			-- Value or node at the current position

	is_invulnerable: BOOLEAN is
			-- Is `Current' guarenteed free of implicit errors?
		do
			Result := True
		end

	regex_group (a_group: INTEGER): STRING is
			-- Nth captured substring (zero means entire match)
		require
			currently_matching: is_matching
		do
			if a_group < 0 or else a_group >= regexp.match_count then
				Result := ""
			else
				Result := regexp.captured_substring (a_group)
			end
		ensure
			result_not_void: Result /= Void
		end
	
feature -- Status report

	is_matching: BOOLEAN is
			-- Is `item' a matching substring?
		require
			not_in_error: not is_error
			not_off: not off
		do
			Result := was_last_match
		end

	after: BOOLEAN
			-- Are there any more items in the sequence?

feature -- Cursor movement

	start is
			-- Move to first position
		do
			index := 1
			regexp.wipe_out
			if input.count = 0 then
				was_last_match := False; after := True
			else
				regexp.match (input)
				if regexp.match_count = 0 then
					create item .make (new_unicode_string_from_utf8 (input))
					was_last_match := False
					next_subject := ""
				elseif regexp.captured_start_position (0) > 1 then
					create item.make (new_unicode_string_from_utf8 (input.substring (1, regexp.captured_start_position (0) - 1)))
					was_last_match := False
					next_subject := input.substring (regexp.captured_start_position (0), input.count)
				else
					create item.make (new_unicode_string_from_utf8 (input.substring (regexp.captured_start_position (0), regexp.captured_end_position (0))))
					next_subject := input.substring (regexp.captured_end_position (0) + 1, input.count)
					was_last_match := True
				end
			end
		end
			
	forth is
			-- Move to next position
		do
			index := index + 1
			regexp.wipe_out
			if next_subject.count = 0 then
				was_last_match := False; after := True
			else
				regexp.match (next_subject)
				if regexp.match_count = 0 then
					create item.make (new_unicode_string_from_utf8 (next_subject))
					was_last_match := False
					next_subject := ""
				elseif regexp.captured_start_position (0) > 1 then
					create item.make (new_unicode_string_from_utf8 (next_subject.substring (1, regexp.captured_start_position (0) - 1)))
					was_last_match := False
					next_subject := next_subject.substring (regexp.captured_start_position (0), next_subject.count)
				else
					create item.make (new_unicode_string_from_utf8 (next_subject.substring (regexp.captured_start_position (0), regexp.captured_end_position (0))))
					next_subject := next_subject.substring (regexp.captured_end_position (0) + 1, next_subject.count)
					was_last_match := True
				end
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (input, regexp)
		end

feature {NONE} -- Implementation

	input: STRING
			-- Original input string

	regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Compiled regular expression

	was_last_match: BOOLEAN
			-- Is `item' a match or a non-match?

	next_subject: STRING
			-- Next subject to match

invariant

	input_not_void: input /= Void
	regular_expression_not_void: regexp /= Void

end
	
