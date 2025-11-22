note

	description:
	"[
		LSP Patterns.

		The glob pattern to watch relative to the base path. Glob patterns can have
		the following syntax:
		- `*` to match zero or more characters in a path segment
		- `?` to match on one character in a path segment
		- `**` to match any number of path segments, including none
		- `{}` to group conditions (e.g. `**/*.{ts,js}` matches all TypeScript
		  and JavaScript files)
		- `[]` to declare a range of characters to match in a path segment
		  (e.g., `example.[0-9]` to match on `example.0`, `example.1`, ...)
		- `[!...]` to negate a range of characters to match in a path segment
		  (e.g., `example.[!0-9]` to match on `example.a`, `example.b`,
		  but not `example.0`)
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_PATTERN

inherit

	LS_GLOB_PATTERN

convert

	value: {READABLE_STRING_GENERAL}

feature -- Access

	pattern: LS_PATTERN
			-- Pattern
		do
			Result := Current
		end

	utf8_value: STRING_8
			-- String value
			-- (using UTF-8 encoding)
		do
			Result := to_string.utf8_value
		ensure
			utf8_value_not_void: Result /= Void
			utf8_value_is_string_8: Result.same_type ({STRING_8} "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

	value: READABLE_STRING_GENERAL
			-- String value
		do
			Result := to_string.value
		ensure
			value_not_void: Result /= Void
			valid_unicode: across 1 |..| Result.count as l_index all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (Result.code (l_index.item)) end
			same_as_utf8_value_if_ascii: ({UC_UTF8_ROUTINES}.unicode_character_count (utf8_value) = utf8_value.count) implies Result = utf8_value
		end

	to_string: LS_STRING
			-- String representation
		deferred
		ensure
			to_string_not_void: Result /= Void
		end

end
