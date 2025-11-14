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

feature -- Access

	pattern: LS_PATTERN
			-- Pattern
		do
			Result := Current
		end

	to_string: LS_STRING
			-- String representation
		deferred
		ensure
			to_string_not_void: Result /= Void
		end

end
