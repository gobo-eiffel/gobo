note

	description:
	"[
		LSP markup contents.

		A `MarkupContent` literal represents a string value which content is
		interpreted base on its kind flag. Currently the protocol supports
		`plaintext` and `markdown` as markup kinds.

		If the kind is `markdown` then the value can contain fenced code blocks like
		in GitHub issues.

		Here is an example how such a string can be constructed using
		JavaScript / TypeScript:
		```typescript
		let markdown: MarkdownContent = {
			kind: MarkupKind.Markdown,
			value: [
				'# Header',
				'Some text',
				'```typescript',
				'someCode();',
				'```'
			].join('\n')
		};
		```

		*Please Note* that clients might sanitize the return markdown. A client could
		decide to remove HTML from the markdown to avoid script execution.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_MARKUP_CONTENT

inherit

	LS_STRING_CONTENT

create

	make

feature {NONE} -- Initialization

	make (a_kind: like kind; a_value: like value)
			-- Create a new markup content.
		require
			a_kind_not_void: a_kind /= Void
			a_value_not_void: a_value /= Void
		do
			kind := a_kind
			value := a_value
		ensure
			kind_set: kind = a_kind
			value_set: value = a_value
		end

feature -- Access

	kind: LS_MARKUP_KIND
			-- The type of the Markup

	value: LS_STRING
			-- The content itself

feature -- Field names

	kind_name: STRING_8 = "kind"
	value_name: STRING_8 = "value"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_markup_content (Current)
		end

end
