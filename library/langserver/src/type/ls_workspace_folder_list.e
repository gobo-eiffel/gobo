note

	description:

		"LSP lists of workspace folders"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_FOLDER_LIST

inherit

	LS_LIST [LS_WORKSPACE_FOLDER]

	LS_OPTIONAL_WORKSPACE_FOLDER_LIST

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_folder_list (Current)
		end

end
