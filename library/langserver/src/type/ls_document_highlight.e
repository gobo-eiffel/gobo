note

	description:

		"LSP results for 'textDocument/documentHighlight' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_HIGHLIGHT

inherit

	LS_ANY

create

	make,
	make_with_kind

feature {NONE} -- Initialization

	make (a_range: like range)
			-- Create a new result.
		require
			a_range_not_void: a_range /= Void
		do
			range := a_range
		ensure
			range_set: range = a_range
		end

	make_with_kind (a_range: like range; a_kind: like kind)
			-- Create a new result with optional kind.
		require
			a_range_not_void: a_range /= Void
		do
			range := a_range
			kind := a_kind
		ensure
			range_set: range = a_range
			kind_set: kind = a_kind
		end

feature -- Access

	range: LS_RANGE
			-- The range this highlight applies to.

	kind: detachable LS_DOCUMENT_HIGHLIGHT_KIND
			-- The highlight kind, default is DocumentHighlightKind.Text.

feature -- Field names

	range_name: STRING_8 = "range"
	kind_name: STRING_8 = "kind"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_highlight (Current)
		end

invariant

	range_not_void: range /= Void

end
