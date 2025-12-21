note

	description:

		"LSP completion item options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM_OPTIONS

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_label_details_support: like label_details_support)
			-- Create a new server options.
		do
			label_details_support := a_label_details_support
		ensure
			label_details_support_set: label_details_support = a_label_details_support
		end

feature -- Access

	label_details_support: detachable LS_BOOLEAN
			-- The server has support for completion item label
			-- details (see also `CompletionItemLabelDetails`) when receiving
			-- a completion item in a resolve call.

feature -- Field names

	label_details_support_name: STRING_8 = "labelDetailsSupport"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_item_options (Current)
		end

end
