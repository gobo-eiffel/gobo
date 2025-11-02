note

	description:
	"[
		LSP document filters.

		A document filter denotes a document through properties
		like 'language', 'scheme' or 'pattern'. An example is a filter
		that applies to TypeScript files on disk. Another example is
		a filter that applies to JSON files with name 'package.json':

			{ language: 'typescript', scheme: 'file' }
			{ language: 'json', pattern: '**/package.json' }
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_FILTER

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_language: like language; a_scheme: like scheme; a_pattern: like pattern)
			-- Create a new document filter.
		require
			at_least_one: a_language /= Void or a_scheme /= Void or a_pattern /= Void
		do
			language := a_language
			scheme := a_scheme
			pattern := a_pattern
		ensure
			language_set: language = a_language
			scheme_set: scheme = a_scheme
			pattern_set: pattern = a_pattern
		end

feature -- Access

	language: detachable LS_STRING
			-- A language id, like 'typescript'.

	scheme: detachable LS_STRING
			-- A Uri scheme, like 'file' or 'untitled'.

	pattern: detachable LS_STRING
			-- A glob pattern, like '*.{ts,js}'.
			--
			-- Glob patterns can have the following syntax:
			-- - '*' to match zero or more characters in a path segment
			-- - '?' to match on one character in a path segment
			-- - '**' to match any number of path segments, including none
			-- - '{}' to group sub patterns into an OR expression. (e.g. '**​/*.{ts,js}'
			--   matches all TypeScript and JavaScript files)
			-- - '[]' to declare a range of characters to match in a path segment
			--   (e.g., 'example.[0-9]' to match on 'example.0', 'example.1', ...)
			-- - '[!...]' to negate a range of characters to match in a path segment
			--   (e.g., 'example.[!0-9]' to match on 'example.a', 'example.b', but
			--   not 'example.0')

feature -- Field names

	language_name: STRING_8 = "language"
	scheme_name: STRING_8 = "scheme"
	pattern_name: STRING_8 = "pattern"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_filter (Current)
		end

invariant

	at_least_one: language /= Void or scheme /= Void or pattern /= Void
end
