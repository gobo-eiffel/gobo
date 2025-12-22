note

	description:

		"LSP additional details for a completion item label"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM_LABEL_DETAILS

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_detail: like detail; a_description: like description)
			-- Create a new completion item label details.
		do
			detail := a_detail
			description := a_description
		ensure
			detail_set: detail = a_detail
			description_set: description = a_description
		end

feature -- Access

	detail: detachable LS_STRING
			-- An optional string which is rendered less prominently directly after
			-- `LS_COMPLETION_ITEM.label`, without any spacing. Should be
			-- used for function signatures or type annotations.

	description: detachable LS_STRING
			-- An optional string which is rendered less prominently after
			-- `LS_COMPLETION_ITEM_LABEL_DETAILS.detail`. Should be used for fully qualified
			-- names or file path.

feature -- Field names

	detail_name: STRING_8 = "detail"
	description_name: STRING_8 = "description"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_item_label_details (Current)
		end

end
