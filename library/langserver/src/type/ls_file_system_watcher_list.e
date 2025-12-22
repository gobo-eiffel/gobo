note

	description:

		"LSP lists of file system watchers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_FILE_SYSTEM_WATCHER_LIST

inherit

	LS_LIST [LS_FILE_SYSTEM_WATCHER]

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_file_system_watcher_list (Current)
		end

end
