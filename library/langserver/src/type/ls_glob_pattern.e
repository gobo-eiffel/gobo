note

	description:

		"LSP glob patterns. Either a string pattern or a relative pattern."

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_GLOB_PATTERN

inherit

	LS_ANY

feature -- Access

	pattern: LS_PATTERN
			-- Pattern
		deferred
		ensure
			pattern_not_void: Result /= Void
		end

end
