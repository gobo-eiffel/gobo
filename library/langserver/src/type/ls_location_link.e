note

	description:

		"LSP links between a source and a target location"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_LOCATION_LINK

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_origin_selection_range: like origin_selection_range; a_target_uri: like target_uri; a_target_range: like target_range; a_target_selection_range: like target_selection_range)
			-- Create a new location link.
		require
			a_target_uri_not_void: a_target_uri /= Void
			a_target_range_not_void: a_target_range /= Void
			a_target_selection_range_not_void: a_target_selection_range /= Void
		do
			origin_selection_range := a_origin_selection_range
			target_uri := a_target_uri
			target_range := a_target_range
			target_selection_range := a_target_selection_range
		ensure
			origin_selection_range_set: origin_selection_range = a_origin_selection_range
			target_uri_set: target_uri = a_target_uri
			target_range_set: target_range = a_target_range
			target_selection_range_set: target_selection_range = a_target_selection_range
		end

feature -- Access

	origin_selection_range: detachable LS_RANGE
			-- Span of the origin of this link.
			--
			-- Used as the underlined span for mouse interaction. Defaults to the word
			-- range at the mouse position.

	target_uri: LS_DOCUMENT_URI
			-- The target resource identifier of this link.

	target_range: LS_RANGE
			-- The full target range of this link. If the target for example is a symbol
			-- then target range is the range enclosing this symbol not including
			-- leading/trailing whitespace but everything else like comments. This
			-- information is typically used to highlight the range in the editor.

	target_selection_range: LS_RANGE
			-- The range that should be selected and revealed when this link is being
			-- followed, e.g the name of a function. Must be contained by the
			-- `target_range`. See also `DocumentSymbol#range`

feature -- Field names

	origin_selection_range_name: STRING_8 = "originSelectionRange"
	target_uri_name: STRING_8 = "targetUri"
	target_range_name: STRING_8 = "targetRange"
	target_selection_range_name: STRING_8 = "targetSelectionRange"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_location_link (Current)
		end

invariant

	target_uri_not_void: target_uri /= Void
	target_range_not_void: target_range /= Void
	target_selection_range_not_void: target_selection_range /= Void

end
