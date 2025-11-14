note

	description:
	"[
		LSP code blocks.

		Provides a language and a code snippet.
		The language identifier is semantically equal to the optional language
		identifier in fenced code blocks in GitHub issues.

		The pair of a language and a value is an equivalent to markdown:
		```${language}
		${value}
		```

		Deprecated, use DS_MARKUP_CONTENT instead.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CODE_BLOCK

inherit

	LS_MARKED_STRING

create

	make

feature {NONE} -- Initialization

	make (a_language: like language; a_value: like value)
			-- Create a new code block.
		require
			a_language_not_void: a_language /= Void
			a_value_not_void: a_value /= Void
		do
			language := a_language
			value := a_value
		ensure
			language_set: language = a_language
			value_set: value = a_value
		end

feature -- Access

	language: LS_STRING
			-- Language identifier

	value: LS_STRING
			-- Code snippet

feature -- Field names

	language_name: STRING_8 = "language"
	value_name: STRING = "value"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_code_block (Current)
		end

invariant

	language_not_void: language /= Void
	value_not_void: value /= Void

end
