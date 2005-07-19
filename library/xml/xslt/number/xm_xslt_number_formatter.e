indexing

	description: "Objects that format a list of integers as a character string under the control of a format string"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMBER_FORMATTER

inherit

	XM_XSLT_STRING_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_format: STRING) is
			-- Tokenize `a_format' into alternating alphanumeric and non-alphanumeric tokens.
		require
			format_string_not_void: a_format /= Void
		local
			a_format_string, a_token: STRING
			a_length, an_index, a_start_index: INTEGER
			first: BOOLEAN
		do
			starts_with_separator := True
			first := True
			if a_format.count = 0 then
				a_format_string := "1"
			else
				a_format_string := a_format
			end
			create formatting_tokens.make_default
			formatting_tokens.set_equality_tester (string_equality_tester)
			create formatting_separators.make_default
			formatting_separators.set_equality_tester (string_equality_tester)
			from
				a_length := a_format_string.count
				an_index := 1
			until
				an_index > a_length
			loop
				from
					a_start_index := an_index
				until
					an_index > a_length or else not is_alphanumeric (a_format_string.item_code (an_index))
				loop
					an_index := an_index + 1
				end
				if a_start_index <= an_index - 1 then
					a_token := a_format_string.substring (a_start_index, an_index - 1)
					formatting_tokens.force_last (a_token)
					if first then
						formatting_separators.force_last (".")
						first := False
						starts_with_separator := False
					end
				end
				from
					a_start_index := an_index
				until
					an_index > a_length or else is_alphanumeric (a_format_string.item_code (an_index))
				loop
					first := False
					an_index := an_index + 1
				end
				if a_start_index <= an_index - 1 then
					a_token := a_format_string.substring (a_start_index, an_index - 1)
					formatting_separators.force_last (a_token)
				end
			end
			if formatting_tokens.count = 0 then
				formatting_tokens.force_last ("1")
				if formatting_separators.count = 1 then
					formatting_separators.force_last (formatting_separators.item (1))
				end
			end
		end

feature -- Access

	formatted_string (numbers: DS_ARRAYED_LIST [XM_XPATH_INTEGER_VALUE];
							a_group_size: INTEGER; a_group_separator, a_letter, an_ordinal: STRING;
							a_numberer: XM_XSLT_NUMBERER): STRING is
			-- Formatted string
		require
			numbers_not_void: numbers /= Void
			positive_group_size: a_group_size >= 0
			group_separator_not_void: a_group_separator /= Void
			letter_not_void: a_letter /= Void
			ordinal_not_void: an_ordinal /= Void
			numberer_not_void: a_numberer /= Void
		local
			a_token_index: INTEGER
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_INTEGER_VALUE]
			a_decimal: MA_DECIMAL
			a_string: STRING
		do
			create Result.make (0)
			a_token_index := 1

			-- Output first punctuation token.

			if starts_with_separator then
				Result := STRING_.appended_string (Result, formatting_separators.item (a_token_index))
			end

			-- Output the list of numbers.

			from
				a_cursor := numbers.new_cursor; a_cursor.start
			variant
				numbers.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				if a_cursor.index > 1 then
					Result := STRING_.appended_string (Result, formatting_separators.item (a_token_index))
				end
				a_decimal := a_cursor.item.value
				a_string := a_numberer.formatted_string (a_decimal, formatting_tokens.item (a_token_index),
																	  a_group_size, a_group_separator, a_letter, an_ordinal)
				Result := STRING_.appended_string (Result, a_string)
				a_token_index := a_token_index + 1
				if a_token_index > formatting_tokens.count then
					a_token_index := a_token_index - 1
				end
				a_cursor.forth
			end

			-- Output the final punctuation token.

			if formatting_separators.count > formatting_tokens.count then
				Result := STRING_.appended_string (Result, formatting_separators.item (formatting_separators.count))
			end
		ensure
			formatted_string_not_void: Result /= Void	
		end

feature {NONE} -- Implementation

	formatting_tokens: DS_ARRAYED_LIST [STRING]
			-- Formatting tokens

	formatting_separators: DS_ARRAYED_LIST [STRING]
			-- Formatting separators

	starts_with_separator: BOOLEAN
			-- Did format string start with a separator?

invariant

	formatting_tokens: formatting_tokens /= Void
	formatting_separators: formatting_separators /= Void
	
end

