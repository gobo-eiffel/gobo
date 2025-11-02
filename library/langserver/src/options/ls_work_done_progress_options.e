note

	description:

		"LSP 'WorkDoneProgress' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_WORK_DONE_PROGRESS_OPTIONS

inherit

	LS_SERVER_OPTIONS

feature {NONE} -- Initialization

	make (a_work_done_progress: like work_done_progress)
			-- Create a new server options.
		do
			work_done_progress := a_work_done_progress
		ensure
			work_done_progress_set: work_done_progress = a_work_done_progress
		end

feature -- Access

	work_done_progress: detachable LS_BOOLEAN
			-- Whether client supports server initiated progress
			-- for the given request.

feature -- Field names

	work_done_progress_name: STRING_8 = "workDoneProgress"
			-- Field names

end
