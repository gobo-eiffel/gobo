note

	description:
	"[
		LSP relative patterns.
		
		A relative pattern is a helper to construct glob patterns that are matched
		relatively to a base URI. The common value for a `baseUri` is a workspace
		folder root, but it can be another absolute URI as well.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_RELATIVE_PATTERN

inherit

	LS_GLOB_PATTERN

create

	make

feature {NONE} -- Initialization

	make (a_base_uri: like base_uri; a_pattern: like pattern)
			-- Create a new relative pattern.
		require
			a_base_uri_not_void: a_base_uri /= Void
			a_pattern_not_void: a_pattern /= Void
		do
			base_uri := a_base_uri
			pattern := a_pattern
		ensure
			base_uri_set: base_uri = a_base_uri
			pattern_set: pattern = a_pattern
		end

feature -- Access

	base_uri: LS_BASE_URI
			-- A workspace folder or a base URI to which this pattern will be matched
			-- against relatively.

	pattern: LS_PATTERN
			-- The actual glob pattern

feature -- Field names

	base_uri_name: STRING_8 = "baseUri"
	pattern_name: STRING_8 = "pattern"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_relative_pattern (Current)
		end

invariant

	base_uri_not_void: base_uri /= Void
	pattern_not_void: pattern /= Void

end
