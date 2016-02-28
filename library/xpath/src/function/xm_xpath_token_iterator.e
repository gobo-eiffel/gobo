note

	description:

		"Objects that iterate across tokens"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TOKEN_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

	UC_UNICODE_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_input: STRING; a_regexp_cache_entry: XM_XPATH_REGEXP_CACHE_ENTRY)
			-- Establish invariant.
		require
				input_string: an_input /= Void
				regular_expression_not_in_error: a_regexp_cache_entry /= Void and then not a_regexp_cache_entry.is_error
		local
			a_match_record: detachable XM_XPATH_REGEXP_MATCH_RECORD
		do
			input := an_input
			regexp_cache_entry := a_regexp_cache_entry
			a_match_record := regexp_cache_entry.match_record (input)
			if a_match_record /= Void and then attached a_match_record.tokens as l_tokens then
				check has_split: a_match_record.has_split end
				tokens := l_tokens
			else
				regexp_cache_entry.regexp.match (input)
				tokens := regexp_cache_entry.regexp.split
				if a_match_record = Void then
					regexp_cache_entry.add_splitting_match (input, tokens)
				else
					a_match_record.add_split (tokens)
				end
			end
			check
				tokens_not_void: tokens /= Void
			end
			token_count := tokens.count
			if token_count > 0 and then tokens.item (token_count).count = 0 then

				-- Remove a trailing empty string

				token_count := token_count - 1
			end
		ensure
			input_string_set: input = an_input
			regular_expression_set: regexp_cache_entry = a_regexp_cache_entry
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Value or node at the current position
		do
			check precondition_not_off: attached internal_item as l_internal_item then
				Result := l_internal_item
			end
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := internal_item = Void
		end

feature -- Cursor movement

	forth
			-- Move to next position.
		do
			index := index + 1
			if index > token_count then
				internal_item := Void
			else
				create {XM_XPATH_STRING_VALUE} internal_item.make (new_unicode_string_from_utf8 (tokens.item (index)))
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (input, regexp_cache_entry)
		end

feature {NONE} -- Implementation

	input: STRING
			-- input string to be tokenized

	regexp_cache_entry: XM_XPATH_REGEXP_CACHE_ENTRY
			-- Tokenizing regular expression

	tokens: ARRAY [STRING]
			-- Tokens

	token_count: INTEGER
			-- Number of valid tokens

	internal_item: detachable XM_XPATH_ITEM
			-- Value or node at the current position

invariant

	input_string: input /= Void
	regular_expression_not_in_error: regexp_cache_entry /= Void and then not regexp_cache_entry.is_error
end

