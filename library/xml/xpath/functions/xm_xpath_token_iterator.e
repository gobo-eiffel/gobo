indexing

	description:

		"Objects that iterate across tokens"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TOKEN_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

creation

	make

feature {NONE} -- Initialization

	make (an_input: STRING; a_regexp: RX_PCRE_REGULAR_EXPRESSION) is
			-- Establish invariant.
		require
				input_string: an_input /= Void and then an_input.count > 0
				regular_expression_not_void: a_regexp /= Void
		do
			input := an_input
			regexp := a_regexp
			regexp.match (input)
			tokens := regexp.split
			token_count := tokens.count
			if token_count > 0 and then tokens.item (token_count).count = 0 then

				-- Remove a trailing empty string

				token_count := token_count - 1
			end
		ensure
			input_string_set: input = an_input
			regular_expression_set: regexp = a_regexp
		end
	
feature -- Access

	item: XM_XPATH_ITEM
			-- Value or node at the current position

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := item = Void
		end
	
feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			if index > token_count then
				item := Void
			else
				create {XM_XPATH_STRING_VALUE} item.make (tokens.item (index))
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
			-- input string to be tokenized

	regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Tokenizing regular expression

	tokens: ARRAY [STRING]
			-- Tokens

	token_count: INTEGER
			-- Number of valid tokens

invariant

	input_string: input /= Void and then input.count > 0
	regular_expression_not_void: regexp /= Void

end
	
