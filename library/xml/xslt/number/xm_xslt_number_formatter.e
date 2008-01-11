indexing

	description: "Objects that format a list of integers as a character string under the control of a format string"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMBER_FORMATTER

inherit

	DT_STRING_ROUTINES

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
			l_format_string, l_token: STRING
			l_length, l_index, l_start_index: INTEGER
			l_first: BOOLEAN
		do
			starts_with_separator := True
			l_first := True
			if a_format.count = 0 then
				l_format_string := "1"
			else
				l_format_string := a_format
			end
			create formatting_tokens.make_default
			formatting_tokens.set_equality_tester (string_equality_tester)
			create formatting_separators.make_default
			formatting_separators.set_equality_tester (string_equality_tester)
			from
				l_length := l_format_string.count
				l_index := 1
			until
				l_index > l_length
			loop
				from
					l_start_index := l_index
				until
					l_index > l_length or else not is_alphanumeric (l_format_string.item_code (l_index))
				loop
					l_index := l_index + 1
				end
				if l_start_index <= l_index - 1 then
					l_token := l_format_string.substring (l_start_index, l_index - 1)
					formatting_tokens.force_last (l_token)
					if l_first then
						formatting_separators.force_last (".")
						l_first := False
						starts_with_separator := False
					end
				end
				from
					l_start_index := l_index
				until
					l_index > l_length or else is_alphanumeric (l_format_string.item_code (l_index))
				loop
					l_first := False
					l_index := l_index + 1
				end
				if l_start_index <= l_index - 1 then
					l_token := l_format_string.substring (l_start_index, l_index - 1)
					formatting_separators.force_last (l_token)
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

	formatted_string (a_numbers: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE];
							a_group_size: INTEGER; a_group_separator, a_letter, an_ordinal: STRING;
							a_numberer: DT_XSLT_NUMBERER): STRING is
			-- Formatted string
		require
			a_numbers_not_void: a_numbers /= Void
			a_numbers_all_strings_or_all_positive_integers: True
			positive_group_size: a_group_size >= 0
			group_separator_not_void: a_group_separator /= Void
			letter_not_void: a_letter /= Void
			ordinal_not_void: an_ordinal /= Void
			numberer_not_void: a_numberer /= Void
		local
			l_token_index: INTEGER
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_ATOMIC_VALUE]
			l_value: INTEGER_64
			l_atomic: XM_XPATH_ATOMIC_VALUE
			l_string: STRING
		do
			create Result.make (0)
			l_token_index := 1

			-- Output first punctuation token.

			if starts_with_separator then
				Result := STRING_.appended_string (Result, formatting_separators.item (l_token_index))
			end

			-- Output the list of numbers.

			from
				l_cursor := a_numbers.new_cursor; l_cursor.start
			variant
				a_numbers.count + 1 - l_cursor.index
			until
				l_cursor.after
			loop
				if l_cursor.index > 1 then
					if l_token_index = 1 and starts_with_separator then
						-- the first separator is actually punctuation, so it is used only once
						Result := STRING_.appended_string (Result, ".")
					else
						Result := STRING_.appended_string (Result, formatting_separators.item (l_token_index))
					end
				end
				l_atomic := l_cursor.item
				if l_atomic.is_machine_integer_value then
					l_value := l_atomic.as_machine_integer_value.value
					l_string := a_numberer.formatted_string (create {MA_DECIMAL}.make_from_string (l_value.out), formatting_tokens.item (l_token_index),
						a_group_size, a_group_separator, a_letter, an_ordinal)
				elseif l_atomic.is_integer_value then
					l_string := a_numberer.formatted_string (l_atomic.as_integer_value.value, formatting_tokens.item (l_token_index),
						a_group_size, a_group_separator, a_letter, an_ordinal)					
				elseif l_atomic.is_decimal_value then
					l_string := a_numberer.formatted_string (l_atomic.as_decimal_value.value, formatting_tokens.item (l_token_index),
						a_group_size, a_group_separator, a_letter, an_ordinal)					
				else
					l_string := l_atomic.string_value
				end
				Result := STRING_.appended_string (Result, l_string)
				l_token_index := l_token_index + 1
				if l_token_index > formatting_tokens.count then
					l_token_index := l_token_index - 1
				end
				l_cursor.forth
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

