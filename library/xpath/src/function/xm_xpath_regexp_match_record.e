note

	description:

		"Objects that record previous regexp matches"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_REGEXP_MATCH_RECORD

create

	make

feature {NONE} -- Initialization

	make (some_tokens: like tokens)
			-- Create with splitting record
		do
			add_split (some_tokens)
		end

feature -- Access

	has_split: BOOLEAN
			-- Does this record include a previous split result?
		do
			Result := tokens /= Void
		end

	tokens: detachable ARRAY [STRING]
			-- Result of previous split

feature -- Element change

	add_split (some_tokens: like tokens)
		-- Add result of previoius split
		require
			no_previous_split: not has_split
		do
			tokens := some_tokens
		ensure
			split_added: has_split and then tokens = some_tokens
		end

end

